--Does the late-delivery rate change by month?

SELECT YEAR(order_purchase_timestamp)  AS order_year,
       MONTH(order_purchase_timestamp) AS order_month,
       COUNT(*) AS delivered_orders,
       SUM(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date
                THEN 1 ELSE 0 END) AS late_orders,
       ROUND(100 * AVG(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date
                              THEN 1.0 ELSE 0 END),1) AS late_parcel

FROM orders
WHERE order_status = 'delivered'
GROUP BY YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp)
ORDER BY order_year, order_month;


-- Three months (Nov 2017, Feb 2018, Mar 2018) have 14-21% late rates. They are about 22% oforders but about 46% of all late orders.
-- Feb-Mar 2018 had normal volume, so the cause is unknown and needs checking.
-- the peak periods and find out what went wrong in Feb-Mar 2018. This targets the months
