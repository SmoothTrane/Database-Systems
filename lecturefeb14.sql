select o.*, c.name as "customer", p.name as "product", a.name as "agent"
from orders o inner join customers c on o.cid = c.cid
inner join products p on o.pid = p.pid
inner join agents a  on o.aid = a.aid



select o.*, c.name as 'customer' p.nameas 'product', a.name as 'agent', from orders o inner join customers c on o.cid = c.cid
inner join products p on opid = p.pid 
iner join agens a on o.aid = a.aid
where o.month = 'jan'
and a.city = 'new york';



select o.ordNumber, o.cid, o.aid, o.pidfrom orders o 
inner join customers c on o.cid = c.cid
inner join products p on o.pid = p.pid
inner join agents a on o.aid = a.aid;




select from where 