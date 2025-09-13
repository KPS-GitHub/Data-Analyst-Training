-- flags via case - also just good complex query example
SELECT 
    *
FROM
    orders;

SELECT 
    *
FROM
    orderdetails;

SELECT 
    *
FROM
    products;

WITH cte_ordersWith40Motos AS
  (WITH cte_ords_orddeets_prods AS
     (SELECT orderDate,
             t1.orderNumber,
             t2.productCode,
             quantityOrdered,
             productName,
             productLine
      FROM orders t1
      JOIN orderdetails t2 ON t1.orderNumber = t2.orderNumber
      JOIN products t3 ON t2.productCode = t3.productCode
      ORDER BY orderDate DESC) SELECT *,
                                      CASE
                                          WHEN (quantityOrdered > 40
                                                AND productLine = 'Motorcycles') THEN 1
                                          ELSE 0
                                      END AS order_over_40_motorcycles
   FROM cte_ords_orddeets_prods)
SELECT orderDate,
       sum(order_over_40_motorcycles) AS times_ordered_over_40_motos
FROM cte_ordersWith40Motos
GROUP BY orderdate;