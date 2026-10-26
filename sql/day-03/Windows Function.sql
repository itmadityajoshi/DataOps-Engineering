SELECT 
	customer_name,
	order_id,
	amount,
	ROW_NUMBER( )OVER (
		PARTITION BY customer_name
		ORDER BY order_date, order_id
	) as order_number

From orders;

--  Let's understand the important keywords:
-- Keyword	Meaning
-- ROW_NUMBER()	Assigns a sequential number to each row
-- OVER()	Defines the rows used by the window function
-- PARTITION BY	Divides rows into groups for calculation
-- ORDER BY	Determines the order of rows within each group


SELECT
    order_id,
    customer_name,
    amount,
    RANK() OVER (
        ORDER BY amount DESC
    ) AS amount_rank
FROM orders;



-- 2. Detect missing data with NULL
-- In DataOps, identifying missing values is a daily responsibility.

-- Suppose an order has no matching payment record.

-- We can detect it using:


select 
	o.order_id,
	o.customer_name,
	p.payment_status
from orders as o
left join payments as p
	on o.order_id = p.order_id
where p.payment_id is null;


--- In SQL, NULL represents an unknown or missing value. It isn't an ordinary value you can compare using =.
