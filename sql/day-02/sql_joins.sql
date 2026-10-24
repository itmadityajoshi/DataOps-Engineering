CREATE Table If NOT Exists payments (
    payment_id INT PRIMARY KEY,
    order_id INT UNIQUE REFERENCES orders(order_id),
    payment_method VARCHAR(30),
    payment_status VARCHAR(20),
    paid_amoaunt DECIMAL(10,2)
);


Alter table payments
rename column paid_amoaunt to paid_amount;


select * from payments, orders;

insert into payments
(payment_id, order_id, payment_method, payment_status, paid_amount)
values
(201, 101, 'Card', 'Success', 850),
(202, 102, 'Cash', 'Success', 25),
(203, 104, 'Card', 'Success', 220),
(204, 106, 'Card', 'Failed', 25)
ON CONFLICT (payment_id) DO NOTHING;


-- inner join
-- an inner join return only the records that have mathcing values in both tables.
select 
	o.order_id,
	o.customer_name,
	o.amount,
	p.payment_status
from orders as o
Inner join payments as p
	on o.order_id = p.order_id;

-- Only four orders appear because orders 103 and 105 have no matching payment records.

-- A LEFT JOIN returns all rows from the left table, including those without a matching record in the right table.

select 
	o.order_id,
	o.customer_name,
	o.status as order_status,
	p.payment_status
From orders as o
Left join payments as p
	on o.order_id = p.order_id;


-- Notice NULL. It means there is no matching payment record for that order, so the joined payment value is missing.
-- In DataOps, LEFT JOIN is particularly useful for identifying missing relationships and incomplete data.





















