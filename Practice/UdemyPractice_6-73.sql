-- ========== UdemyPractice_6-73 ============

-- Can I have a view showing customers sales and include a column which shows the difference in value from their previous sale? I want to see if new customers who make their first purchase are likely to spend more.


WITH main_cte AS (
	SELECT orderNumber, orderDate,  SUM(sales_value) AS sales_value, customerNumber
	FROM
		(SELECT t1.orderNumber, orderDate, customerNumber, quantityOrdered * priceEach AS sales_value
		FROM orders t1
		JOIN orderdetails t2
		ON t1.orderNumber = t2.orderNumber
		) main -- subquery for practice
	GROUP BY orderNumber, orderDate, customerNumber
), -- end of main_cte

sales_cte AS (
	SELECT 
	t1.*, 
    customerName, 
    ROW_NUMBER() OVER (
		PARTITION BY customerName ORDER BY orderDate
        ) as purchase_number,
	LAG(sales_value) OVER (
		PARTITION BY customerName ORDER BY orderDate
		) AS prev_sales_value
	FROM main_cte t1
	JOIN customers t2
	ON t1.customerNumber = t2.customerNumber
) -- end of sales_cte

SELECT *, sales_value - prev_sales_value AS purchase_value_change
FROM sales_cte
WHERE prev_sales_value IS NOT NULL
;