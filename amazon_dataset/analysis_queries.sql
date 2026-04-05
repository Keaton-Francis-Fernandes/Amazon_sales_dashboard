-- ============================================
-- AMAZON SALES DATA ANALYSIS (SQL)
-- ============================================

-- 1. TOTAL REVENUE
SELECT
SUM(amount) AS total_revenue
FROM orders;

-- 2. TOTAL ORDERS
SELECT
COUNT(DISTINCT order_id) AS total_orders
FROM orders;

-- 3. AVERAGE ORDER VALUE (AOV)
SELECT
SUM(amount) * 1.0 / COUNT(DISTINCT order_id) AS avg_order_value
FROM orders;

-- 4. REVENUE BY STATE
SELECT
ship_state,
SUM(amount) AS total_revenue
FROM orders
GROUP BY ship_state
ORDER BY total_revenue DESC;

-- 5. TOP 10 CITIES BY REVENUE
SELECT
ship_city,
SUM(amount) AS total_revenue
FROM orders
GROUP BY ship_city
ORDER BY total_revenue DESC
LIMIT 10;

-- 6. REVENUE BY CATEGORY
SELECT
category,
SUM(amount) AS total_revenue
FROM orders
GROUP BY category
ORDER BY total_revenue DESC;

-- 7. ORDER STATUS DISTRIBUTION
SELECT
status,
COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY status
ORDER BY total_orders DESC;

-- 8. CLEANED STATUS GROUPING (FOR ANALYSIS)
SELECT
CASE
WHEN LOWER(status) LIKE '%cancel%' THEN 'Cancelled'
WHEN LOWER(status) LIKE '%deliver%' THEN 'Delivered'
WHEN LOWER(status) LIKE '%ship%' THEN 'Shipped'
WHEN LOWER(status) LIKE '%pend%' THEN 'Pending'
ELSE 'Other'
END AS status_grouped,
COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY status_grouped
ORDER BY total_orders DESC;

-- 9. CANCELLATION RATE
SELECT
COUNT(CASE WHEN LOWER(status) LIKE '%cancel%' THEN 1 END) * 1.0
/ COUNT(DISTINCT order_id) AS cancellation_rate
FROM orders;

-- 10. DELIVERY RATE 
SELECT
COUNT(CASE WHEN LOWER(status) LIKE '%deliver%' THEN 1 END) * 1.0
/ COUNT(CASE
WHEN LOWER(status) LIKE '%ship%'
OR LOWER(status) LIKE '%deliver%'
THEN 1 END
) AS delivery_rate
FROM orders;

-- 11. REVENUE BY STATE AND STATUS
SELECT
ship_state,
status,
SUM(amount) AS revenue
FROM orders
GROUP BY ship_state, status
ORDER BY ship_state;

-- 12. TOP STATES BY CANCELLATIONS
SELECT
ship_state,
COUNT(*) AS cancelled_orders
FROM orders
WHERE LOWER(status) LIKE '%cancel%'
GROUP BY ship_state
ORDER BY cancelled_orders DESC;

-- 13. MONTHLY REVENUE TREND
SELECT
strftime('%Y-%m', date) AS month,
SUM(amount) AS total_revenue
FROM orders
GROUP BY month
ORDER BY month;

-- 14. MONTHLY ORDER COUNT
SELECT
strftime('%Y-%m', date) AS month,
COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY month
ORDER BY month;

-- 15. TOP PRODUCTS (SKU LEVEL)
SELECT
sku,
SUM(amount) AS revenue
FROM orders
GROUP BY sku
ORDER BY revenue DESC
LIMIT 10;

-- 16. B2B vs B2C ANALYSIS
SELECT
b2b,
COUNT(DISTINCT order_id) AS total_orders,
SUM(amount) AS total_revenue
FROM orders
GROUP BY b2b;

-- 17. AVERAGE ORDER VALUE BY STATE
SELECT
ship_state,
SUM(amount) * 1.0 / COUNT(DISTINCT order_id) AS avg_order_value
FROM orders
GROUP BY ship_state
ORDER BY avg_order_value DESC;

-- 18. HIGH REVENUE ORDERS (OUTLIERS)
SELECT
order_id,
amount
FROM orders
WHERE amount > (
SELECT AVG(amount) * 3 FROM orders
)
ORDER BY amount DESC;

-- ============================================
-- END OF ANALYSIS
-- ============================================
