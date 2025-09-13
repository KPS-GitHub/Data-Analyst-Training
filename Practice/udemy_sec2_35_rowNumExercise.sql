-- udemy 2-35 - row number exercise
-- Instructions: Display the orderDate, orderNumber, and salesRepEmployeeNumber for each sales rep's second order.

WITH ords_custs_emps AS (
	SELECT 
		t1.orderDate, 
        t1.orderNumber,
        t2.salesRepEmployeeNumber,
        ROW_NUMBER() OVER (PARTITION BY t2.salesRepEmployeeNumber ORDER BY t1.orderDate) AS rep_order_count
    FROM orders t1
		JOIN customers t2 ON t1.customerNumber = t2.customerNumber
		JOIN employees t3 ON t3.employeeNumber = t2.salesRepEmployeeNumber
	-- ORDER BY t1.orderDate
)

SELECT
	orderDate,
    orderNumber,
    salesRepEmployeeNumber
    -- , rep_order_count
FROM ords_custs_emps
WHERE rep_order_count = 2
;