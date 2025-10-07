-- ========== UdemyPractice_8-82 ============

-- creating view for Power BI with sales data


-- create view (or replace if the view already exists)
create or replace view sales_data_for_power_bi as 

-- query all relevant data - the resulting table is what will be saved in Views as sales_data_for_power_bi
SELECT 
	orderDate,
    ord.orderNumber,
    prod.productName,
    prod.productLine,
    cust.customerName,
    cust.country as customer_country,
    offc.country as office_country,
    buyPrice,
    priceEach,
    quantityOrdered,
    quantityOrdered * priceEach as sales_value,
    quantityOrdered * buyPrice as cost_of_sales
FROM orders ord
JOIN orderdetails orddet
ON ord.orderNumber = orddet.orderNumber
JOIN customers cust
ON ord.customerNumber = cust.customerNumber
JOIN products prod
ON orddet.productCode = prod.productCode
JOIN employees emp
ON cust.salesRepEmployeeNumber = emp.employeeNumber
JOIN offices offc
ON emp.officeCode = offc.officeCode
;