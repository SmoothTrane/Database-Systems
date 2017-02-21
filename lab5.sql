
/*
1. Show	the	cities	of	agents	booking	an	order	for	a	customer	whose	id	is	'c006'.	Use	joins
this	time;	no	subqueries.
*/



SELECT city from agents
inner join orders on orders.aid = agents.aid
where orders.cid = 'c006';


/*
2. Show	the	ids	of	products	ordered	through	any	agent	who	makes	at	least	one	order	for
a	customer	in	Kyoto,	sorted	by	pid	from	highest	to	lowest.	Use	joins;	no	subqueries.

*/
SELECT products.pid
from products
inner join orders on products.pid = orders.pid
inner join customers on orders.cid = customers.cid
where customers.city = 'Kyoto';



/*
3. Show	the	names	of	customers	who	have	never	placed	an	order.	Use	a	subquery.
*/

select name from customers where customers.cid NOT in(select orders.cid from orders);

/*
4. Show	the	names	of	customers	who	have	never	placed	an	order.	Use	an	outer	join.
*/



select name from customers left join orders on customers.cid = orders.cid where orders.cid is null;


/*
5. Show	the	names	of	customers	who	placed	at	least	one	order	through	an	agent	in	their
own	city,	along	with	those	agent(s')	names.
*/

SELECT distinct customers.name from customers inner join orders on customers.cid = orders.cid inner join agents on agents.aid = orders.aid and customers.city = agents.city;

/*

6. Show	the	names	of	customers	and	agents	living	in	the	same	city,	along	with	the	name
of	the	shared	city,	regardless	of	whether	or	not	the	customer	has	ever	placed	an	order
with	that	agent.
*/


select customers.name as "Customer Name",
agents.name as "Agent Name",
agents.city as "Shared City"
from customers inner join agents on customers.city = agents.city;


/*
7. Show	the	name	and	city	of	customers	who	live	in	the	city	that	makes	the	fewest
different	kinds	of	products.	(Hint:	Use	count	and	group	by	on	the	Products	table.)


*/

SELECT name, city
FROM customers
where city IN (SELECT city
                FROM products
                group by city
                order by COUNT(*) ASC
                LIMIT 1
              );
