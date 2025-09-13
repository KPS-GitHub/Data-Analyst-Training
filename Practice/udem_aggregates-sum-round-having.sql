select *
from payments;


select paymentDate, sum(amount) as total_payments
from payments
group by paymentDate
order by paymentDate desc;



select paymentDate, customerNumber, round(sum(amount),1) as total_payments
from payments
group by paymentDate, customerNumber
having paymentDate > '2005-01-00'
order by paymentDate desc;