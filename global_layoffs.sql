# DATA CLEANSING OPERATION FOR THE DATASET "layoffs" 



# Load the database
SELECT 
    *
FROM
    global_layoffs_rawdata;

    
    
    
 # Create Staging from raw data 
 
 CREATE TABLE layoffs_cleansing LIKE global_layoffs_rawdata;
 
 # Import data from layoffs
 insert layoffs_cleansing select * from global_layoffs_rawdata;




# Rechck new data
 SELECT 
    *
FROM
    layoffs_cleansing;



# Inspect datatypes
DESCRIBE layoffs_cleansing;




# Disbale safe update mode
SET SQL_SAFE_UPDATES = 0;




# Change date type from str to datetime
ALTER TABLE layoffs_cleansing
ADD COLUMN layoff_date DATE;

UPDATE layoffs_cleansing 
SET 
    layoff_date = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE layoffs_cleansing DROP COLUMN `date`;

ALTER TABLE layoffs_cleansing
CHANGE COLUMN layoff_date date DATE;




# Change "percentage_laid_off" from text to float
ALTER TABLE layoffs_cleansing
MODIFY COLUMN percentage_laid_off FLOAT;




# Change "funds_raised_millions" to float
ALTER TABLE layoffs_cleansing
MODIFY COLUMN funds_raised_millions FLOAT;




# Check for duplicate
SELECT 
    *, COUNT(*) AS duplicate_count
FROM
    layoffs_cleansing
GROUP BY company , location , industry , total_laid_off , percentage_laid_off , date , stage , country , funds_raised_millions
HAVING COUNT(*) > 1;




# Add row ID
ALTER TABLE layoffs_cleansing 
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY;




# Remove deuplicates
DELETE FROM layoffs_cleansing 
WHERE
    id NOT IN (SELECT 
        min_id
    FROM
        (SELECT 
            MIN(id) AS min_id
        FROM
            layoffs_cleansing
        GROUP BY company , location , industry , total_laid_off , percentage_laid_off , date , stage , country , funds_raised_millions) t);




# Recheck duplicates
SELECT 
    company,
    location,
    industry,
    total_laid_off,
    percentage_laid_off,
    date,
    stage,
    country,
    funds_raised_millions,
    COUNT(*) AS duplicate_count
FROM
    layoffs_cleansing
GROUP BY company , location , industry , total_laid_off , percentage_laid_off , date , stage , country , funds_raised_millions
HAVING COUNT(*) > 1;




# Reload and recheck dataset
SELECT 
    *
FROM
    layoffs_cleansing;
    
    
    
    
# Droping missing values where necessary: Drop rows where BOTH total_laid_off or percentage_laid_off are missing
DELETE FROM layoffs_cleansing 
WHERE
    percentage_laid_off IS NULL
    OR total_laid_off IS NULL;




# Set null values in "funds_raised_millions" to 0
UPDATE layoffs_cleansing 
SET 
    funds_raised_millions = 0
WHERE
    funds_raised_millions IS NULL;




# Drop rows where 'date' is null
DELETE FROM layoffs_cleansing 
WHERE
    `date` IS NULL;




# Drop rows where 'industry' is an empty cell
DELETE
FROM layoffs_cleansing
WHERE industry = '';




# Drop rows where 'company' is null
DELETE FROM layoffs_cleansing 
WHERE
    company IS NULL;




# Replace with 'unknown' where 'stage' is null
UPDATE layoffs_cleansing
SET stage = 'Unknown'
WHERE stage IS NULL;




# Recheck for possble null values
SELECT *
FROM layoffs_cleansing
WHERE COALESCE(
    company,
    location,
    industry,
    total_laid_off,
    percentage_laid_off,
    date,
    stage,
    country,
    funds_raised_millions
) IS NULL;




# Drop the 'id' column
ALTER TABLE layoffs_cleansing
DROP COLUMN id;




# Clean the country column to be uniform
UPDATE layoffs_cleansing
SET country = 'United States'
WHERE country = 'United States.';




# Clean industry column to be uniform
UPDATE layoffs_cleansing
SET industry = 'Crypto'
WHERE industry IN ('CryptoCurrency', 'Crypto Currency');





# Load the cleased data set
SELECT 
    *
FROM
    layoffs_cleansing;





    
    
    





