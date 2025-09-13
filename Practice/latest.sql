select *
from customers;

select *
from employees;

select 'customer' as type,
contactFirstName as firstname, 
contactLastName as lastname,
city
from customers

union all

select 'employee' as type,
firstName as firstname,
lastName as lastname,
'unknown' as city
from employees;