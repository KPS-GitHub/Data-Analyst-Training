-- udemy 2-37 - String Functions

/* CAST */
-- used to change the data type of a column
-- CAST(columnName AS dataType)
-- common to have to do this when joining tables together, where one key is an integer or varchar and the other is in date format

SELECT 
	*,
    CAST(paymentDate AS datetime) as datetime_type,
    CAST(CAST(paymentDate AS datetime) AS date) as date_type
FROM payments
;


/* SUBSTRING */
-- returns substring based on args
-- SUBSTRING(columnName, startFrom, length)
SELECT 
	checkNumber,
    SUBSTRING(checkNumber, 2, 3) AS checkNum_substring_2_3,
    paymentDate,
    SUBSTRING(paymentDate, 1, 7) AS month_key
FROM payments
;

/* CONCAT */
-- used to merge 2 or more columns together
-- CONCAT(column1, column2)

SELECT
	employeeNumber,
    lastName,
    firstName,
    CONCAT(firstName, ' ', lastName) AS concat_fullName
FROM employees
;