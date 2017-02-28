-- Gary Coltrane
-- 2/27/17
-- Lab 6: Painful Queries



-- 1


SELECT name, city
FROM customers
WHERE customers.city IN (SELECT city
                      FROM products
                      GROUP BY city
                      ORDER BY count (city)
                      LIMIT 1);



-- 2

    SELECT name
    FROM PRODUCTS
    WHERE priceUSD > (SELECT AVG(priceUSD) FROM PRODUCTS) ORDER BY name DESC;





-- 3
SELECT customers.name, orders.totalUSD, orders.pid
FROM CUSTOMERS inner join orders on
 orders.cid = customers.cid
order by orders.totalUSD  ASC;

-- 4



-- 5

--6

/*
-- 7

In a left outer join, all of the rows in the left table will be shown regardless if it meets the condition of the on statement,
similar for a right inner join, all of the rows on the right table will be shown if it meets the condition of the specific on statement.

Example Queries:

select * from customers left outer join agents on agents.city = customers.city;



select * from agents left outer join orders on agents.aid = orders.aid;

*/
