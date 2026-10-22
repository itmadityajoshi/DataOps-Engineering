-- create table orders (
-- 	order_id INT PRIMARY KEY,
-- 	customer_name VARCHAR(100),
-- 	product VARCHAR(100),
-- 	amount DECIMAL(10,2),
-- 	status VARCHAR(30),
-- 	order_date DATE
-- )



-- INSERT INTO orders
-- (order_id, customer_name, product, amount, status, order_date)
-- VALUES 
-- (101, 'Ram', 'Laptop', 850, 'Completed', '2026-10-20'),
-- (102, 'Sita', 'Mouse', 25, 'Completed', '2026-10-20'),
-- (103, 'Hari', 'Keyboard', 70, 'Pending', '2026-10-20'),
-- (104, 'Ram', 'Monitor', 220, 'Completed', '2026-10-21'),
-- (105, 'Sita', 'Headphones', 60, 'Cancelled', '2026-10-21'),
-- (106, 'Hari', 'Mouse', 25, 'Completed', '2026-10-21');



-- select * from orders;


-- SELECT specifies the data to retrieve.
-- * means all columns.
-- FROM orders identifies the source table.



-- select * 
-- from orders
-- where status= 'Completed';

-- The WHERE clause filters rows according to a condition.



-- Calculate total completed revenue
-- Select sum(amount) as total_revenue
-- from orders
-- where status = 'Completed';



-- Calculate each customer's completed spending

-- select 
-- 	customer_name, 
-- 	sum(amount) as total_spent
-- from orders
-- where status='Completed'
-- group by customer_name
-- order by total_spent desc;


-- Retrieve only customer_name, product, and amount from the orders table.
select customer_name, product, amount from orders;

-- Find all orders where the amount is greater than €100.
select amount
from orders
where amount > 100;

-- Count how many orders have the status Pending.
select count(*) as remaining_orders
from orders
where status = 'Pending';

-- Calculate the total amount of all orders on October 20, 2026.
select sum(amount)
from orders 
where order_date  = '2026-10-20';

--Find customers whose total completed spending exceeds €100.
select 
	customer_name,
	sum(amount) as total_spent
from orders
where status = 'Completed'
group by customer_name
having sum(amount) > 100;


-- next

select 
	customer_name,
	count(*) as total_orders
from orders
where status = 'Completed'
group by customer_name
having count(*) > 1;
