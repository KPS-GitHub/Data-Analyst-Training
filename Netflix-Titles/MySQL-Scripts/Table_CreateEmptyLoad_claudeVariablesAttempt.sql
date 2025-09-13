-- ==================================================
-- CONFIGURATION VARIABLES - EDIT THESE AS NEEDED
-- ==================================================

-- Database and table configuration
SET @database_name = 'netflix_data';
SET @table_name = 'new_table';

-- Column definitions (modify these for your table structure)
SET @col1_def = 'id INT NOT NULL';
SET @col2_def = 'yeh VARCHAR(45) NULL';
SET @col3_def = 'yo DECIMAL(2) NULL';
SET @col4_def = 'yuh DATETIME NULL';

-- Primary key and indexes
SET @primary_key = 'PRIMARY KEY (id)';
SET @unique_index = 'UNIQUE INDEX id_UNIQUE (id ASC) VISIBLE';

-- File configuration - choose one of these file paths
SET @data_file_path = 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/netflix_titles_basics_csv.csv';
-- SET @data_file_path = 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/netflix_titles_cast_csv.csv';
-- SET @data_file_path = 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/netflix_titles_countries_csv.csv';
-- SET @data_file_path = 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/netflix_titles_descriptions_csv.csv';
-- SET @data_file_path = 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/netflix_titles_directors_csv.csv';
-- SET @data_file_path = 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/netflix_titles_listedIn_csv.csv';

-- CSV format configuration
SET @field_terminator = ',';
SET @enclosed_by = '"';
SET @line_terminator = '\n';
SET @ignore_lines = 1;

-- Display configuration
SET @result_limit = 10000;
SET @result_offset = 0; -- Change to 2 if you want OFFSET 2

-- ==================================================
-- SCRIPT EXECUTION - DON'T EDIT BELOW THIS LINE
-- ==================================================

-- Drop table if it exists
SET @drop_sql = CONCAT('DROP TABLE IF EXISTS `', @database_name, '`.`', @table_name, '`');
PREPARE stmt FROM @drop_sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SELECT CONCAT('Dropped table ', @database_name, '.', @table_name, ' if it existed') AS Status;

-- Create table with dynamic structure
SET @create_sql = CONCAT('CREATE TABLE `', @database_name, '`.`', @table_name, '` (',
    @col1_def, ', ',
    @col2_def, ', ',
    @col3_def, ', ',
    @col4_def, ', ',
    @primary_key, ', ',
    @unique_index,
')');

PREPARE stmt FROM @create_sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SELECT CONCAT('Table ', @database_name, '.', @table_name, ' created successfully!') AS Status;

-- Empty table (truncate)
SET @truncate_sql = CONCAT('TRUNCATE TABLE ', @table_name);
PREPARE stmt FROM @truncate_sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SELECT CONCAT('Table ', @table_name, ' truncated successfully!') AS Status;

-- Load data from file
-- Note: LOAD DATA INFILE cannot use prepared statements, so we'll output the command to run manually
SELECT CONCAT(
    'LOAD DATA INFILE "', @data_file_path, '" ',
    'INTO TABLE ', @table_name, ' ',
    'FIELDS TERMINATED BY ''', @field_terminator, ''' ',
    'ENCLOSED BY ''', @enclosed_by, ''' ',
    'LINES TERMINATED BY ''', @line_terminator, ''' ',
    'IGNORE ', @ignore_lines, ' LINES;'
) AS 'Copy and run this LOAD DATA command:';

-- ==================================================
-- MANUAL LOAD DATA SECTION
-- Copy the output from above and paste it here, or uncomment and modify one of these:
-- ==================================================

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/netflix_titles_basics_csv.csv"
INTO TABLE new_table FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

-- LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/netflix_titles_cast_csv.csv"  
-- INTO TABLE new_table FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

-- LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/netflix_titles_countries_csv.csv"
-- INTO TABLE new_table FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;

-- Add a manual confirmation
-- SELECT 'Data loaded successfully - verify with the SELECT below!' AS Status;

-- Display loaded table to verify
SET @select_sql = CONCAT(
    'SELECT * FROM ', @database_name, '.', @table_name, ' ',
    'LIMIT ', @result_limit
    -- Add OFFSET if needed: uncomment the line below and set @result_offset > 0
    -- , CASE WHEN @result_offset > 0 THEN CONCAT(' OFFSET ', @result_offset) ELSE '' END
);

PREPARE stmt FROM @select_sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;