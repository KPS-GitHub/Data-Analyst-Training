-- goal: return table with customerName and column for how many orders each customer has negotiated
 -- -- join orders and customers tables on customerNumber so that we can relate customerName (only in customers) to order comment data (only in orders)
WITH custs_ords_negKey AS
  (SELECT t1.customerName,
          t1.customerNumber,
          t2.comments, 
		  -- create column for negotiated key
		  CASE
			  WHEN t2.comments like '%negotiat%' THEN 1
			  ELSE 0
		  END AS negotiatedKey
-- join customers and orders tables
   FROM customers t1
   LEFT JOIN orders t2 ON t1.customerNumber = t2.customerNumber
   ORDER BY t1.customerName) -- end of custs_ords_negKey cte table creation
-- create table from custs_ords_negKey to display just customerName and how many orders each customer has negotiated
SELECT customerName,
       sum(negotiatedKey) AS orders_negotiated
FROM custs_ords_negKey
GROUP BY customerName
ORDER BY orders_negotiated DESC;