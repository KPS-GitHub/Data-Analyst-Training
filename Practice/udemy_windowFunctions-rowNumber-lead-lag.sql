-- WINDOW FUNCTIONS - ROW NUMBER, LEAD, LAG


/* ========= ROW NUMBER ========= */
-- ROW_NUMBER() OVER (PARTITION BY column_name1 ORDER BY column_name2)

-- EXAMPLES
SELECT 
	customerNumber, 
	t1.orderNumber,
    row_number() over (partition by customerNumber order by orderDate) as purchase_number
FROM orders t1
ORDER BY customerNumber, t1.orderNumber
;


WITH ords_ordeets_custs AS 
	(SELECT t3.customerName,
		t1.customerNumber,
		t1.orderNumber,
		orderDate,
		productCode
    FROM orders t1
    JOIN orderdetails t2 on t1.orderNumber = t2.orderNumber
    JOIN customers t3 on t1.customerNumber = t3.customerNumber)
SELECT customerName,
	customerNumber,
	orderNumber,
	orderDate,
	productCode,
	row_number() over (partition by customerNumber, orderNumber order by orderDate) as purchase_number
FROM  ords_ordeets_custs
ORDER BY customerName
;



/* ========= LEAD & LAG ========= */
-- reads next/previous row of ordered output
-- LEAD(column_name) OVER (PARTITION BY column_name ORDER BY column_name)

SELECT
	customerNumber,
    paymentDate,
    amount,
    LEAD(amount) OVER (PARTITION BY customerNumber ORDER BY paymentDate) as next_pmt_amount,
    LAG(amount) OVER (PARTITION BY customerNumber ORDER BY paymentDate) as prev_pmt_amount
FROM payments
;
