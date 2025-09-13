-- subquery
select avg(orders)
from
(select orderDate, count(orderNumber) as orders
from orders
group by orderDate) t1
where orderDate > '2005-05-01';

-- cte (common table expression) - way to simply organize and name subqueries, making code more readable
with cte_orders as
(select orderDate, count(orderNumber) as orders
from orders
group by orderDate) ,

cte_payments as
(select *
from payments)

select avg(orders) as cte_avgorders
from cte_orders
;