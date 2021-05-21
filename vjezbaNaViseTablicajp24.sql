# Vjezba select na vise tablica

select a.productName 
from products a inner join orderdetails b
on a.productCode=b.productCode
inner join orders c on
b.orderNumber=c.orderNumber 
inner join customers d on
c.customerNumber=d.customerNumber 
where d.customerName like '%k%';
