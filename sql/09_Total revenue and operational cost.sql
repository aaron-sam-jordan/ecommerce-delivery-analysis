--How much revenue does the store make each month, and what is the running total?

WITH monthly AS (
    SELECT YEAR(o.order_purchase_timestamp)  AS order_year,
           MONTH(o.order_purchase_timestamp) AS order_month,
           SUM(oi.price) AS revenue

    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY YEAR(o.order_purchase_timestamp), MONTH(o.order_purchase_timestamp)
)
SELECT order_year, order_month, revenue,
       SUM(revenue) OVER (ORDER BY order_year, order_month) AS running_total

FROM monthly
ORDER BY order_year, order_month;

-- Revenue grew from ~112k (Jan 2017) to ~988k (Nov 2017, peak, +52% vs Oct). Running total reaches ~13.2M BRL by Aug 2018.
-- In 2018 monthly revenue is flat (~826k-978k), so growth has levelled off.
-- The biggest months (Nov 2017, Mar 2018) also had the worst late rates (14.3%, 21.4%),so peak-time delivery is where the most revenue is at risk.