-- DATA CLEANING IN SQL--
Select *
from layoffs;
/* Here we gonna do;-
1. Removing duplicates
2. Standardizing data
3. Handling NUll or Blank Values
4. Removing unneccesary columns or rows */
/*For doing all these we should create anothetr table with same data because if we make any mistakes 
during any of these we should have the raw data to get back the data that we deleted*/
-- Creating new table with same data--
Create table layoffs_staging
like layoffs;

select *
from layoffs_staging;


Insert layoffs_staging
select *
from layoffs;


select *
from layoffs_staging;

-- Now we are  going a new column with row numbers to eliminate duplicates--

select *,
row_number() over(
partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoffs_staging;

with duplicate_cte as
(select *,
row_number() over(
partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoffs_staging)
select*
from duplicate_cte
where row_num>1;

select *
from layoffs_staging
where company = 'casper'; # here casper have a duplicate but we should not delete two rows as it gonna effect our data we should delete only one row

with duplicate_cte as
(select *,
row_number() over(
partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoffs_staging)
Delete
from duplicate_cte
where row_num>1; # here we cannot update the data in in duplicate_cte i.e., we cannot delete the duplicate columns


CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select *
from layoffs_staging2;

insert into layoffs_staging2
select *,
row_number() over(
partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoffs_staging;

select *
from layoffs_staging2
where row_num>1; # do this to see what are the duplicates we have before deleting it
delete 
from layoffs_staging2 #here we are deleting all the duplicate rows
 where row_num>1;
 select *
 from layoffs_staging2 # make sure you deleted the duplicate values
 where row_num>1;
 # we have to delete the column row_num to imrpove processing time and for storage
 
 /* Standardizing data:- Standardizing data means transforming data into a consistent and uniform format. 
 This often involves fixing inconsistencies like misspellings, varying formats, or extra characters, so that all similar entries are represented identically.
For instance:
Removing leading/trailing spaces from company names.
Correcting different spellings like "crypto," "cryptocurrency," and "c-r-ypt" to a single "crypto" format .
Removing an extra period from "United States." to simply "United States".
This process ensures that when you analyze or visualize the data, related entries are grouped together accurately instead of being treated as separate, unique values.
*/
select company,trim(company)
from layoffs_staging2;  # This is just to see the difference between actual company data and after trimming it
/* If you're unable to perform the TRIM function or any UPDATE or DELETE statements in MySQL Workbench, it's likely due to the "Safe Updates" option being enabled.
To resolve this:
Go to Edit in the top menu.
Select Preferences.
Navigate to SQL Editor.
Scroll down to the Safe Updates (or "Reject UPDATEs and DELETEs with no restriction") checkbox.
Uncheck this option.
Click OK or Apply.
You may need to restart your MySQL Workbench for the changes to take effect.
Disabling "Safe Updates" allows you to modify tables without specifying a WHERE clause that uses a key column, 
which is often required for functions like TRIM when used in an UPDATE statement.*/

update layoffs_staging2
set company=trim(company); # thus one is to update the data in the table after doing trim function
-- correcting spellings--
select distinct industry
from layoffs_staging2 # here crypto industry was entered with different names to avoid errors in our data for analysis we need to change it same name
order by 1;

select*
from layoffs_staging2
where industry like 'crypto%';

update layoffs_staging2
set industry= 'crypto'
where industry like 'crypto%';  # now different names of the crypto currency will be updated to crypto industry

select* 
from layoffs_staging2;

select distinct location
from layoffs_staging2
order by 1;

select distinct country
from layoffs_staging2
order by 1; # here United states was entered two times one with "." and one without it we have to remove it

 update layoffs_staging2
 set country= 'United States'
 where country like 'United States%';
 
 
 select distinct country,trim(trailing '.' from country)
 from layoffs_staging2
 order by 1;
 
update layoffs_staging2
set country= trim(trailing '.' from country)
where country like 'United States%';
 
 select* 
 from layoffs_staging2;
 /* The STR_TO_DATE function is used  because the 'date' column in the imported data was initially recognized as a text (string) data type, even though it contained
 date information.
The purpose of STR_TO_DATE is to:
Convert a string into a proper date format: It takes the text string and a specified format pattern, then transforms it into a 
recognized DATE data type that MySQL can understand and process as a date. Enable date-based operations: Once the column is a DATE data type,
you can perform time-series analysis, filter by date ranges, sort chronologically, or create date-based visualizations accurately.
If it remained a text string, these operations would not work correctly .The function's name itself, STR_TO_DATE, clearly indicates its purpose: STRing TO DATE.*/

SELECT `date`,
STR_TO_DATE(`date`, '%m/%d/%Y')
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y'); # here it changes into date format

 ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE; # here it changes from text data type to date data type

-- Removing null values--
SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL  # To check null values in both the columns
AND percentage_laid_off IS NULL;

SELECT *
FROM layoffs_staging2
WHERE industry IS NULL # To check for null or blank values in the industry column
OR industry = '';

SELECT *
FROM layoffs_staging2  # To select all records for 'Airbnb' to check for populated industry values
WHERE company = 'Airbnb';


SELECT t1.industry, t2.industry #To identify rows where industry is null/blank but a corresponding industry (for the same company/location) is not null
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
    ON t1.company = t2.company
    AND t1.location = t2.location
WHERE t1.industry IS NULL OR t1.industry = ''
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging2 #To update blank industry values to NULL (to simplify the next update logic)
SET industry = NULL
WHERE industry = '';

UPDATE layoffs_staging2 t1 # To populate null industry values using existing non-null values for the same company/location
JOIN layoffs_staging2 t2
    ON t1.company = t2.company
    AND t1.location = t2.location
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

SELECT * # To re-check if any industry values are still null/blank after the update
FROM layoffs_staging2
WHERE industry IS NULL
OR industry = '';

DELETE #To delete rows where both total_laid_off and percentage_laid_off are null
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

ALTER TABLE layoffs_staging2 #To drop the temporary row_num column:
DROP COLUMN row_num;














 
 


