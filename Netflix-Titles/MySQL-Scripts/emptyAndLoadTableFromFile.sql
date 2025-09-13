-- create table


-- file paths for quick copying
-- "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/netflix_titles_basics_csv.csv"
-- "C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\netflix_titles_cast_csv.csv"
-- "C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\netflix_titles_countries_csv.csv"
-- "C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\netflix_titles_descriptions_csv.csv"
-- "C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\netflix_titles_directors_csv.csv"
-- "C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\netflix_titles_listedIn_csv.csv"

-- empties table
TRUNCATE TABLE basics; 

-- loads table from file
LOAD DATA INFILE
"C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/netflix_titles_basics_csv.csv"
INTO TABLE basics
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES; 

-- display loaded table to make sure it worked
SELECT *
FROM netflix_data.basics
LIMIT 10000
-- OFFSET 2
;

-- count table rows
-- SELECT COUNT(*)
-- FROM netflix_data.basics
-- ;

-- various troubleshooting code
-- SHOW PROCESSLIST;
-- SHOW VARIABLES LIKE "local_infile"; 
-- SHOW VARIABLES LIKE "secure_file_priv";