-- ========== UdemyPractice_6-74 ============

-- Can you show me a view of where the customers of each sales office are located?


-- note: reviewed database chart to clearly see connections between tables, making it easy to determine which needs to be joined with which to ultimately connect orders to offices

WITH overall_cte AS (
	SELECT DISTINCT t5.officeCode, t5.city AS officeCity, t5.state AS officeState, t5.country AS officeCountry, t3.customerName, t3.city AS customerCity, t3.state AS customerState, t3.country AS customerCountry
	FROM orders t1
	JOIN orderdetails t2
	ON t1.orderNumber = t2.orderNumber
	JOIN customers t3
	ON t1.customerNumber = t3.customerNumber
	JOIN employees t4
	ON t3.salesRepEmployeeNumber = t4.employeeNumber
	JOIN offices t5
	ON t4.officeCode = t5.officeCode
    ORDER BY t5.officeCode
)
SELECT *
FROM overall_cte
;

