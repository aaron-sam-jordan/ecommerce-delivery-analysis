--Delivered orders that reached after the estimated delivery date

select count(*) as delivered_orders,
sum(case when order_delivered_customer_date> order_estimated_delivery_date then 1 else 0 end)as late
from orders
where order_status='delivered'


--so we don't need a hub because roughly 8 out of 100 orders reach the customer late 