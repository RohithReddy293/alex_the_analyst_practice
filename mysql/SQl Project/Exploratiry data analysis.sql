/*
Here we are going to do exploratory data analysis (EDA) using MySQL on a dataset containing company layoff information.
we are going to cover:
•	Basic Aggregations: Finding maximum values for total laid off and percentage laid off.
•	Filtering: Identifying companies that laid off 100% of their employees.
•	Grouping and Summing: Analyzing total layoffs by company, industry, country, and year to find patterns and trends.
•	Date Range Analysis: Determining the earliest and latest dates in the dataset.
•	Rolling Sums (Window Functions): Calculating cumulative layoffs over time, specifically by month, using CTEs and the SUM() OVER() function.
•	Ranking (Window Functions): Ranking companies by the number of layoffs per year using DENSE_RANK() OVER() and multiple CTEs to find top layoff events.
The goal is to extract meaningful insights from the data by exploring various aspects of the layoff figures.*/

SELECT MAX(total_laid_off)
FROM layoffs_staging2; #For Finding Max Total Laid Off

SELECT MAX(percentage_laid_off)
FROM layoffs_staging2; #For Finding Max Percentage Laid Off

SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1; # For finding companies with 100% laid off

SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1 #For finding companies with 100% laid off in descending order of total laid off
ORDER BY total_laid_off DESC;

SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company #Sum of Total Laid Off by Company, Ordered Descending
ORDER BY 2 DESC;

SELECT MIN(date), MAX(date)
FROM layoffs_staging2; #Min and Max Dates in the Dataset

SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry #Sum of Total Laid Off by Industry, Ordered Descending
ORDER BY 2 DESC;

SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC; #Sum of Total Laid Off by Country, Ordered Descending

SELECT YEAR(date), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(date) #Sum of Total Laid Off by Year, Ordered by Year
ORDER BY 1 ASC;

SELECT stage, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY stage #Sum of Total Laid Off by Company Stage, Ordered Descending
ORDER BY 2 DESC;

SELECT SUBSTRING(date, 1, 7) AS month, SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE SUBSTRING(date, 1, 7) IS NOT NULL
GROUP BY month #Sum of Total Laid Off by Month (Substring of Date)
ORDER BY month ASC;

WITH rolling_total AS
(
SELECT SUBSTRING(date, 1, 7) AS month, SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE SUBSTRING(date, 1, 7) IS NOT NULL
GROUP BY month  #Rolling Total Layoffs by Month using CTE
ORDER BY month ASC
)
SELECT month, total_off, SUM(total_off) OVER(ORDER BY month) AS rolling_total
FROM rolling_total;

WITH company_year AS
(
SELECT company, YEAR(date) AS years, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
WHERE YEAR(date) IS NOT NULL
GROUP BY company, YEAR(date)
),
company_year_rank AS
(
SELECT *,
DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
FROM company_year
WHERE years IS NOT NULL
)
SELECT *
FROM company_year_rank
WHERE ranking <= 5
ORDER BY years ASC, ranking ASC; #Company Layoff Rank per Year using Multiple CTEs and Dense Rank:
















