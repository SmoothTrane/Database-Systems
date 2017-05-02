-- Gary Coltrane
-- 2/7/17

-- Lab 4


-- 1

-- Get	the	cities	of	agents	booking	an	order	for	a	customer	whose	cid	is	'c006'.

SELECT city
FROM agents
WHERE agents.aid IN (select orders.aid
							from orders
							where orders.CID = 'c006');




-- 2

-- Get	the	distinct	ids	of	products	ordered	through	any	agent	who	takes	at	least	one
-- order	from	a	customer	in	Kyoto,	sorted	by	pid	from	highest	to	lowest.	(This	is	not	the
-- same	as	asking	for	ids	of	products	ordered	by	customers	in	Kyoto.)





SELECT distinct pid
FROM orders
WHERE aid IN (
	SELECT aid
	FROM orders
	WHERE cid in (
		SELECT cid
		FROM customers
		WHERE city = 'Kyoto'
	)
)
ORDER BY pid DESC;



-- 3
-- Get	the	ids	and	names	of	customers	who	did	not	place	an	order	through	agent	a01.




SELECT distinct cid, name
FROM customers
WHERE NOT customers.cid  IN (SELECT orders.cid
														FROM ORDERS
														WHERE aid = 'a01')
ORDER BY CUSTOMERS.cid;



--4
-- Get	the	ids	of	customers	who	ordered	both	product	p01	and	p07.

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



-- Get	the	ids	of	products		ordered	by	any	customers	who	placed	any	order	through
-- agent	a08	in	pid	order	from	highest	to	lowest.


SELECT distinct pid
FROM orders
WHERE  pid NOT in
							(SELECT pid
								FROM ORDERS
								WHERE aid = 'a08')
order by pid desc;



-- 6
--  Get the name, discounts, and city for all customers who place orders  through agents in London or New York.

SELECT name, discount, city
from customers
where customers.cid
IN(SELECT orders.cid
   from orders
   where orders.aid
   IN (
   SELECT aid
   from agents
    where city in('Tokyo', 'New York')));





-- 7
-- Get	all	customers	who	have	the	same	discount	as	that	of	any	customers	in	Duluth	or	London
 select * from customers where  discount  IN(SELECT discount FROM CUSTOMERS WHERE city = 'Duluth' or city = 'London');


 /*
	8: Tell	me	about	check	constraints:	What	are	they?	What	are	they	good	for?	What’s	the
advantage	of	putting	that	sort	of	thing	inside	the	database?	Make	up	some	examples
of	good	uses	of	check	constraints	and	some	examples	of	bad	uses	of	check	constraints.	
Explain	the	differences	in	your	examples	and	argue	your	case.

ANS:

Check constraints are conditional constraints that places a limit on a what can values can be splaced in an attribute. They are good for enumerating values and doing an arithmetic inequality. Check constraints places a limit on the value range of a specific column. Check constraints can also be used on a table,
which places limits on columns based on values in other columns in the row. The advantage of using a check constraint insie the database is that it clearly defines what sort of values should
placed inside of a specific column in a table. In addition, it clears up ambiiguity, which creates less room for confusion.


Good uses of check constraints:

 CREATE TABLE STUDENTS
 (
 cwid int NOT null,
 	fname varchar(255) not null,
 	lname varchar(255) not null,
 	gender char(1) check (gender in('F', 'M'))
 );



CREATE TABLE APPLICATION
(
	status varchar(255) check(status in('PENDING', 'ACCEPTED', 'DENIED'))
);



These are generally good examples of check constaints because they provide a logical limitation of what can be selected for the specific columns.
Bad use of check constraints:

CREATE TABLE Sneakers
(
brand varchar255 check (brand = "Nike")
)

This check constraint is bad because it limits a general sneakers database to be only one brand, while there can possibly be many brands of sneakers in a sneakers database.
 */
