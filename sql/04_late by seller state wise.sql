-- Q3: Which seller states ship the most late orders?


SELECT s.seller_state,

       COUNT(DISTINCT o.order_id) AS delivered_orders,

       COUNT(DISTINCT CASE WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN o.order_id END) AS late_orders

FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN sellers s ON oi.seller_id = s.seller_id
WHERE o.order_status = 'delivered'
GROUP BY s.seller_state
ORDER BY late_orders DESC;

--According to the data SP and PR and MG and Rj has the most late orders but their delivered orders has more volume than the late orders
--The real most late delivery is done by AM 