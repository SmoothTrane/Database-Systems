-- 1 
SELECT ordNumber, totalUSD
FROM  Orders;
-- 2
SELECT name, city
FROM Agents
Where name = 'Smith';

-- 3
SELECT pid, name, priceUSD
FROM Products
WHERE quantity > 200100;

-- 4
SELECT name, city
FROM Customers
WHERE city = 'Duluth';

-- 5
SELECT name
FROM Agents
WHERE city<> 'New York' and city <> 'Duluth'
--6 

SELECT * FROM PRODUCTS WHERE city<> 'Dallas' and city <> 'Duluth' and priceUSD > 1.00;



--7
SELECT * FROM ORDERS
WHERE month = 'Feb' or month = 'May'

--8 

SELECT * FROM ORDERS
WHERE totalUSD > 600;


--9
 
 SELECT * FROM ORDERS
 WHERE cid = "C005"
 
