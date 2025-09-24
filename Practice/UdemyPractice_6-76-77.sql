-- ========== UdemyPractice_6-76-77 ============

-- Please can you send me a breakdown of each customer and their sales, but include a money owed column as I would like to see if any customers have gone over their credit limit.


WITH cte_sales AS (
SELECT orderDate, t1.customerNumber, t1.orderNumber, customerName, productCode, creditLimit, quantityOrdered * priceEach AS sales_value
FROM orders t1
JOIN orderdetails t2
ON t1.orderNumber = t2.orderNumber
JOIN customers t3
ON t1.customerNumber = t3.customerNumber
LIMIT 100000
),
cte_running_total_sales AS (
SELECT orderDate, orderNumber, customerNumber, customerName, creditLimit, SUM(sales_value) AS sales_value
FROM cte_sales
GROUP BY orderDate, orderNumber, customerNumber, customerName, creditLimit
)
SELECT *,
	SUM(sales_value) OVER (PARTITION BY customerNumber ORDER BY orderDate) AS running_total_sales,
    ROW_NUMBER() OVER (PARTITION BY customerNumber ORDER BY orderDate) AS running_total_sales
FROM cte_running_total_sales
;