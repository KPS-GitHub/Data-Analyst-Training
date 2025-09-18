-- ========== UdemyPractice_6-72 ============

-- Can you show me a breakdown of sales, but also show their credit limit?
-- Maybe group the credit limits as I want a high level view to see if we get higher sales for customers who have a higher credit limit which we would expect.

WITH sales AS (
SELECT t1.orderNumber, t1.customerNumber, productCode, quantityOrdered, priceEach, quantityOrdered * priceEach AS sales_value, creditLimit
FROM orders t1
JOIN orderdetails t2
ON t1.orderNumber = t2.orderNumber
JOIN customers t3
ON t1.customerNumber = t3.customerNumber
)
SELECT orderNumber, customerNumber, 
	CASE WHEN creditLimit < 75000 THEN 'a: Less than $75k'
    WHEN creditLimit BETWEEN 75000 AND 100000 THEN 'b: $75k - $100k'
    WHEN creditLimit BETWEEN 100000 AND 150000 THEN 'c: $100k - $150k'
    WHEN creditLimit > 150000 THEN 'd: Greater than $150k'
    ELSE 'Other'
    END AS creditlimit_group
    , 
    SUM(sales_value) AS sales_value
FROM sales
GROUP BY orderNumber, customerNumber, creditlimit_group
;