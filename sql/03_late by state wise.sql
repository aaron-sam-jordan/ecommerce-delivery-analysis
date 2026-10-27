--which customer state have the highest no.of late deliveries

select c.customer_state,

count(*) as delivered_orders,

sum(case when o.order_delivered_customer_date > o.order_estimated_delivery_date then 1 else 0 end)as late,

ROUND(100.0* avg(case when o.order_delivered_customer_date > o.order_estimated_delivery_date then 1.0 else 0 end),1)as late_parcel

from orders o
join customers c on o.customer_id=c.customer_id
where o.order_status='delivered'
group by c.customer_state
order by late_parcel 


--According to the data AL and MA has the highest late_parcel % but the thing to note is the volume is low.
--The main problem comes from RJ and BA comes firsts
--1.RJ(top tier)
--2.BA(second tier)
--3.CE,MA,ES,AL(mid tier)
