select distinct cid 
from orders
where aid in (select aid
							from agents
							where city in('Dallas'), 'Duluth')
order by cid ASC;





--AGGREGATE FUNCTIONS:


--returns number of rows in orders, changes the count to bo called  "number of orders"
select count(*) as "number of orders" from orders;




--selects the average quantity in orders for the month of january
select avg(qty) from orders  where month = 'Jan';



-- Detechs the avg quantity for each month
select month, avg(qty)
from orders
group by month;



--selects month,  the qty to be monthly qty,  from orders, group by month and find the average quantity of each month that's less than 700, and then orders monthly qty to ascending order
select month, avg(qty) as "monthlyQTY" 
from orders 
group by month having avg(qty)<700
order by "monthlyQTY" ASC;


select pid, count(*)
from orders
group by pid
order by pid ASC

select pid, count(*) from orders group by pid, order by count(*) desc limit 1






select month, avg(qty) as "monthlyQty"
from orders
where pid in (select pid, count(*) from orders
group by pid
order by count(*) desc, pidlimit 1
) sub2)
group by monthhaving avg(qty) < 1000
order by "monthlyQty" ASC








-- Does a CARTERSIAN PRODUCT/INNER JOIN OF CUSTOMERS X ORDERS AND ORDERS BY EACH CUSTOMER CID THAT MATCHES WITH ORDERS FOREIGN KEY CID, AND ORDERS IT BY EACH CUSTOMER CID


select * from customers, orders 
where customers.cid = orders.cid
order by customers.cid;


-- DETECTS customers and agents that are in the same cityv
select * 
from customers c, agents a
where a.city = c.city;



SELECT * from customers, orders, agents
where orders.cid = customers.cid
and orders.aid = agents.aid;







select * from customers, orders, agents, products 
where orders.cid = customers.cid 
and orders.aid = agents.aid
and orders.pid = products.pid;


select * from customers 
inner join orders on orders.cid = customers.cid 
inner join agents on orders.aid = agents.aid 
inner join products on orders.pid = products.pid;

where orders.month = 'Jan' and products.city = 'Duluth';
