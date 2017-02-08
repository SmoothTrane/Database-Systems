-- Gary Coltrane
-- 2/7/17


-- 1


SELECT city 
FROM agents
WHERE agents.aid IN (select orders.aid 
							from orders 
							where orders.CID = 'c006');




-- 2



SELECT DISTINCT pid
FROM products 


-- 3




SELECT distinct cid, name 
FROM customers
WHERE NOT customers.cid  IN (SELECT orders.cid 
														FROM ORDERS 
														WHERE aid = 'a01') 
ORDER BY CUSTOMERS.cid;



--4



SELECT customers.cid 
from customers 
where customers.cid in 
										(SELECT distinct orders.cid 
											from ORDERS
											 WHERE pid = 'p01' 
											 INTERSECT 
											 SELECT orders.cid 
											 from ORDERS 
											 where pid = 'p07');



--5




-- 6

SELECT aid from agents where city in("Tokyo"), "New York");

;

SELECT name, discount, city from customers where customers.cid IN(SELECT orders.cid from orders where orders.aid IN (SELECT aid from agents where city in('Tokyo', 'New York');
