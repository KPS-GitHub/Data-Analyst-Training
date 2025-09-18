-- ======== UDEMY REAL WORLD PRACTICE PROBLEMS - 6-69 ========= -- 

-- Can you please give me an overview of sales for 2004?
-- I would like to see a breakdown by product, country and city and please include the sales value, cost of sales and net profit.

-- all relevant data
WITH cte_allData as (
	SELECT t1.orderNumber, t1.orderDate, t3.productName, t4.city, t4.country, t2.quantityOrdered, t2.priceEach, t3.buyPrice, t3.MSRP 
	FROM orders t1
	JOIN orderdetails t2
	ON t1.orderNumber = t2.orderNumber
	JOIN products t3
	ON t2.productCode = t3.productCode
	JOIN customers t4
	ON t4.customerNumber = t1.customerNumber
	WHERE YEAR(t1.orderDate) = 2004
	ORDER BY t1.orderNumber
)
SELECT *
FROM cte_allData
;


-- breakdown by product - final version (in progress)
WITH cte_allData as (
	SELECT t1.orderNumber, t1.orderDate, t3.productName, t4.city, t4.country, t2.quantityOrdered, t2.priceEach, t3.buyPrice, t3.MSRP 
	FROM orders t1
	JOIN orderdetails t2
	ON t1.orderNumber = t2.orderNumber
	JOIN products t3
	ON t2.productCode = t3.productCode
	JOIN customers t4
	ON t4.customerNumber = t1.customerNumber
	WHERE YEAR(t1.orderDate) = 2004
	ORDER BY t1.orderNumber
)
SELECT 
	productName, 
	SUM(quantityOrdered),
    priceEach
FROM cte_allData
GROUP BY productName, priceEach
ORDER BY SUM(quantityOrdered) desc, productName
;


-- breakdown by product - copy for testing/tinkering/etc
WITH cte_allData as (
	SELECT t1.orderNumber, t1.orderDate, t3.productName, t4.city, t4.country, t2.quantityOrdered, t2.priceEach, t3.buyPrice, t3.MSRP 
	FROM orders t1
	JOIN orderdetails t2
	ON t1.orderNumber = t2.orderNumber
	JOIN products t3
	ON t2.productCode = t3.productCode
	JOIN customers t4
	ON t4.customerNumber = t1.customerNumber
	WHERE YEAR(t1.orderDate) = 2004
	ORDER BY t1.orderNumber
)
SELECT 
	productName, 
	SUM(quantityOrdered)
FROM cte_allData
GROUP BY productName
ORDER BY SUM(quantityOrdered) desc
;

