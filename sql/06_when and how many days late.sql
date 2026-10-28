--When an order is late, how many days late is it?

SELECT COUNT(*) AS late_orders,
       ROUND(AVG(1.0 * DATEDIFF(DAY, order_estimated_delivery_date, order_delivered_customer_date)), 1) AS avg_days_late,
       MAX(DATEDIFF(DAY, order_estimated_delivery_date, order_delivered_customer_date)) AS max_days_late,
       SUM(CASE WHEN DATEDIFF(DAY, order_estimated_delivery_date, order_delivered_customer_date) <= 3
                THEN 1 ELSE 0 END) AS late_0_3_days,
       SUM(CASE WHEN DATEDIFF(DAY, order_estimated_delivery_date, order_delivered_customer_date) BETWEEN 4 AND 7
                THEN 1 ELSE 0 END) AS late_4_7_days,
       SUM(CASE WHEN DATEDIFF(DAY, order_estimated_delivery_date, order_delivered_customer_date) BETWEEN 8 AND 14
                THEN 1 ELSE 0 END) AS late_8_14_days,
       SUM(CASE WHEN DATEDIFF(DAY, order_estimated_delivery_date, order_delivered_customer_date) >= 15
                THEN 1 ELSE 0 END) AS late_15_plus_days

FROM orders

WHERE order_status = 'delivered' AND order_delivered_customer_date > order_estimated_delivery_date;

-- 1. Most late orders are mild: 40% are 0-3 days late and over half are 7 days late or less.
-- 2. About 2,862 orders arrive 8+ days late. These are the real failures.
-- 3. Owner action: set more realistic delivery dates to cut the late rate from 8.1% to about 4.8%, and investigate the 8+ day orders.