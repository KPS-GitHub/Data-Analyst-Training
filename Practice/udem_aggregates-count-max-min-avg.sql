select productCode, count(orderNumber) as Total_Orders
from orderdetails
group by productCode;

select paymentDate, round(avg(amount),2) as avg_pmt
from payments
group by paymentDate
having paymentDate > '2004-12-09'
order by paymentDate desc;


-- practice

-- show customer name of company with the most orders
select customerName, count(distinct orderNumber) as how_many_orders
from orders t1
inner join customers t2
on t1.customerNumber = t2.customerNumber
group by customerName
order by how_many_orders desc
limit 1;


-- display each customers first and last order date
select customerName, min(orderDate) as first_order, max(orderDate) as last_order
from orders t1
inner join customers t2
on t1.customerNumber = t2.customerNumber
group by customerName
order by customerName;
