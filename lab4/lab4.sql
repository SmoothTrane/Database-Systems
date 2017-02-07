-- Gary Coltrane
-- 2/7/17


-- 1


SELECT city 
FROM agents
WHERE agents.aid IN (select orders.aid 
							from orders 
							where orders.CID = 'c006');




-- 2

SELECT DISTINCT


-- 3




SELECT distinct cid, name 
FROM customers
WHERE NOT customers.cid  IN(SELECT orders.cid FROM ORDERS WHERE aid = 'a01') ORDER BY CUSTOMERS.cid;



--4

SELECT cid from customers where