-- ========== UdemyPractice_6-76-77 ============

-- Please can you send me a breakdown of each customer and their sales, but include a money owed column as I would like to see if any customers have gone over their credit limit.


-- create a table with relevant sales info by joining orders, orderdetails, and customers tables 
WITH cte_sales AS (
	SELECT orderDate, t1.customerNumber, t1.orderNumber, customerName, productCode, creditLimit, (quantityOrdered * priceEach) AS sales_value
	FROM orders t1
	JOIN orderdetails t2
	ON t1.orderNumber = t2.orderNumber
	JOIN customers t3
	ON t1.customerNumber = t3.customerNumber
	LIMIT 100000
),

-- use the sales cte made above to add a column for the running total sales value for each customer
cte_running_total_sales AS (
	SELECT *, LEAD(orderDate) OVER (PARTITION BY customerNumber ORDER BY orderDate) AS next_order_date
    FROM (
		SELECT orderDate, orderNumber, customerNumber, customerName, creditLimit, SUM(sales_value) AS sales_value
		FROM cte_sales
		GROUP BY orderDate, orderNumber, customerNumber, customerName, creditLimit
	) subquery_run_tot_sales 
),

-- create cte for payments table
cte_running_total_payments AS (
	SELECT *
	FROM payments
	LIMIT 100000
),

-- left join the running total sales cte with the payments cte so that we have those critical values together on the same rows, then sum the running totals for sales_value and payments made, all organized based on date so that the amount a customer owed on various dates can be compared to the total that customer has paid by each of those various dates
cte_final AS (
SELECT t1.*,
	SUM(sales_value) OVER (PARTITION BY t1.customerNumber ORDER BY orderDate) AS running_total_sales,
    ROW_NUMBER() OVER (PARTITION BY t1.customerNumber ORDER BY orderDate) AS sale_num,
    SUM(amount) OVER (PARTITION BY t1.customerNumber ORDER BY orderDate) AS running_total_payments
FROM cte_running_total_sales t1
LEFT JOIN cte_running_total_payments t2
ON t1.customerNumber = t2.customerNumber 
	AND (t2.paymentDate BETWEEN t1.orderDate 
			AND CASE 
					WHEN t1.next_order_date IS NULL THEN CURRENT_DATE 
                    ELSE next_order_date 
                    END
		)
)

-- add columns for: 
-- -- the calculated money owed at the row's date
-- --  the calculated amount of credit the customer has left at the row's date
SELECT *, 
	running_total_sales - running_total_payments AS running_total_money_owed,
    creditLimit - (running_total_sales - running_total_payments) AS credit_remaining
FROM cte_final

-- filter to only return the customers that have paid more money than their credit limit - comment this out to return all customers
WHERE creditLimit - (running_total_sales - running_total_payments) < 0
;


