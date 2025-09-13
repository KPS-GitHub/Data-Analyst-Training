-- drop table if it already exists
DROP TABLE IF exists categories;

-- create table
CREATE TABLE `netflix_data`.`categories` (
	`id` VARCHAR(100) NOT NULL,
	`category_1` VARCHAR(100) NULL,
	`category_2` VARCHAR(100) NULL,
	`category_3` VARCHAR(100) NULL,
	-- `category_4` VARCHAR(100) NULL,
-- 	`category_5` VARCHAR(100) NULL,
-- 	`category_6` VARCHAR(100) NULL,
-- 	`category_7` VARCHAR(100) NULL,
-- 	`category_8` VARCHAR(100) NULL,
-- 	`category_9` VARCHAR(100) NULL,
-- 	`category_10` VARCHAR(100) NULL,
-- 	`category_11` VARCHAR(100) NULL,
-- 	`category_12` VARCHAR(100) NULL,
-- 	`category_13` VARCHAR(100) NULL,
-- 	`category_14` VARCHAR(100) NULL,
-- 	`category_15` VARCHAR(100) NULL,
-- 	`category_16` VARCHAR(100) NULL,
-- 	`category_17` VARCHAR(100) NULL,
-- 	`category_18` VARCHAR(100) NULL,
-- 	`category_19` VARCHAR(100) NULL,
-- 	`category_20` VARCHAR(100) NULL,
-- 	`category_21` VARCHAR(100) NULL,
-- 	`category_22` VARCHAR(100) NULL,
-- 	`category_23` VARCHAR(100) NULL,
-- 	`category_24` VARCHAR(100) NULL,
-- 	`category_25` VARCHAR(100) NULL,
-- 	`category_26` VARCHAR(100) NULL,
-- 	`category_27` VARCHAR(100) NULL,
-- 	`category_28` VARCHAR(100) NULL,
-- 	`category_29` VARCHAR(100) NULL,
-- 	`category_30` VARCHAR(100) NULL,
-- 	`category_31` VARCHAR(100) NULL,
-- 	`category_32` VARCHAR(100) NULL,
-- 	`category_33` VARCHAR(100) NULL,
-- 	`category_34` VARCHAR(100) NULL,
-- 	`category_35` VARCHAR(100) NULL,
-- 	`category_36` VARCHAR(100) NULL,
-- 	`category_37` VARCHAR(100) NULL,
-- 	`category_38` VARCHAR(100) NULL,
-- 	`category_39` VARCHAR(100) NULL,
-- 	`category_40` VARCHAR(100) NULL,
-- 	`category_41` VARCHAR(100) NULL,
-- 	`category_42` VARCHAR(100) NULL,
-- 	`category_43` VARCHAR(100) NULL,
-- 	`category_44` VARCHAR(100) NULL,
-- 	`category_45` VARCHAR(100) NULL,
-- 	`category_46` VARCHAR(100) NULL,
-- 	`category_47` VARCHAR(100) NULL,
-- 	`category_48` VARCHAR(100) NULL,
-- 	`category_49` VARCHAR(100) NULL,
-- 	`category_50` VARCHAR(100) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);

-- general file path for quick copying
-- "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/netflix_titles_REPLACEME_csv.csv"

-- empties table
TRUNCATE TABLE categories; 

-- loads table from file
LOAD DATA INFILE
"C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/netflix_titles_listedIn_csv.csv"
INTO TABLE categories
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'  -- note: csv files saved in windows have \r\n line endings, so just 
IGNORE 1 LINES;

-- display loaded table to make sure it worked
SELECT 
    *
FROM
    netflix_data.categories
LIMIT 10000
;

-- count table rows
-- SELECT COUNT(*)
-- FROM netflix_data.basics
-- ;

-- various troubleshooting code
-- SHOW PROCESSLIST;
-- SHOW VARIABLES LIKE "local_infile"; 
-- SHOW VARIABLES LIKE "secure_file_priv";