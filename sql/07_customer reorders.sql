--How many customers ordered more than once?

WITH per_customer AS (
    SELECT customer_unique_id,
           COUNT(*) AS orders_placed
    FROM customers
    GROUP BY customer_unique_id
)
SELECT COUNT(*) AS total_customers,
       SUM(CASE WHEN orders_placed > 1 THEN 1 ELSE 0 END) AS repeat_customers,
       ROUND(100.0 * SUM(CASE WHEN orders_placed > 1 THEN 1 ELSE 0 END) / COUNT(*), 1) AS repeat_person
FROM per_customer;

-- Only 2,997 of 96,096 customers (3.1%) ordered more than once. ~97% bought once.
-- The cause is unknown; Q7 will check whether late delivery hurts reviews.
