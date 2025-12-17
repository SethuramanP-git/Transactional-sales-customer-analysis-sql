-- =========================================
-- Transactional Sales & Customer Analysis
-- =========================================

-- 1. Total Revenue from Delivered Orders
SELECT 
    SUM(p.price * oi.quantity) AS total_revenue
FROM orders o
JOIN order_items oi 
    ON o.order_id = oi.order_id
JOIN products p 
    ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered';


-- 2. Month-wise Revenue Trend
SELECT 
    MONTH(o.order_date) AS month,
    SUM(p.price * oi.quantity) AS revenue
FROM orders o
JOIN order_items oi 
    ON o.order_id = oi.order_id
JOIN products p 
    ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY MONTH(o.order_date)
ORDER BY month;


-- 3. New vs Repeat Customers
SELECT customer_type, COUNT(*) AS total_customers
FROM (
    SELECT 
        c.customer_id,
        CASE 
            WHEN COUNT(o.order_id) > 1 THEN 'Repeat Customer'
            ELSE 'New Customer'
        END AS customer_type
    FROM customers c
    LEFT JOIN orders o 
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_id
) t
GROUP BY customer_type;


-- 4. Top 5 High-Value Customers
SELECT 
    c.customer_name,
    SUM(p.price * oi.quantity) AS total_spent
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
JOIN order_items oi 
    ON o.order_id = oi.order_id
JOIN products p 
    ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 5;


-- 5. Category-wise Revenue
SELECT 
    p.category,
    SUM(p.price * oi.quantity) AS revenue
FROM products p
JOIN order_items oi 
    ON p.product_id = oi.product_id
JOIN orders o 
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category
ORDER BY revenue DESC;


-- 6. City-wise Sales Performance
SELECT 
    c.city,
    SUM(p.price * oi.quantity) AS city_revenue
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
JOIN order_items oi 
    ON o.order_id = oi.order_id
JOIN products p 
    ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY c.city
ORDER BY city_revenue DESC;


-- 7. Cancelled Orders - Revenue Loss
SELECT 
    COUNT(*) AS cancelled_orders,
    SUM(p.price * oi.quantity) AS revenue_lost
FROM orders o
JOIN order_items oi 
    ON o.order_id = oi.order_id
JOIN products p 
    ON oi.product_id = p.product_id
WHERE o.order_status = 'Cancelled';
