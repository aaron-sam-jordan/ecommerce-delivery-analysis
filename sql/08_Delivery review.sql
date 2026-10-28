--Do late deliveries get lower review scores?

SELECT CASE WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 'Late' ELSE 'On time' END AS delivery,
       COUNT(*) AS reviews,
       ROUND(AVG(1.0 * r.review_score), 2) AS avg_score

FROM orders o
JOIN order_reviews r ON o.order_id = r.order_id
WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
GROUP BY CASE WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 'Late' ELSE 'On time' END;

-- 1. Late orders average 2.57 stars (7,700 reviews); on-time orders average 4.29 (88,653 reviews). A gap of about 1.7 points.
-- 2. Late delivery is linked to much worse customer satisfaction, so it has a real cost.