-- case statements

select

case 
when creditLimit < 75000 then 'Less than $75k'
when creditLimit >= 75000 then '$75k or greater'
else 'Other' 
end 
as credit_limit_grp,

count(distinct c.customernumber) as customers

from customers c
group by credit_limit_grp;