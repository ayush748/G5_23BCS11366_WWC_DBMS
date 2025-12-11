# Write your MySQL query statement below
SELECT ROUND(
    SUM(CASE WHEN min_date=customer_pref_delivery_date THEN 1 else 0 END) * 100.0/
    COUNT(DISTINCT first_orders.customer_id),2) 
    AS immediate_percentage
FROM delivery d
INNER JOIN 
    (
        SELECT customer_id, min(order_date) AS min_date
    FROM delivery
    GROUP BY customer_id
    ) first_orders
ON first_orders.customer_id = d.customer_id AND first_orders.min_date = d.order_date


