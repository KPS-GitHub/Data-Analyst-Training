TRUNCATE TABLE basics;

LOAD DATA INFILE
"C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/netflix_titles_basics_csv.csv"
INTO TABLE basics
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES; 

SELECT *
FROM netflix_data.basics
LIMIT 10000
-- OFFSET 2
;

-- SELECT COUNT(*)
-- FROM netflix_data.basics
-- ;

-- SHOW PROCESSLIST;

-- SHOW VARIABLES LIKE "local_infile"; 
-- SHOW VARIABLES LIKE "secure_file_priv";