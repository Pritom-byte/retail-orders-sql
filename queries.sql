-- ============================================================
-- Retail Orders — SQL practice
-- Database: retail_orders.db
-- ============================================================


-- ------------------------------------------------------------
-- PART 1 — Reading one table
-- ------------------------------------------------------------

-- Q1. Which products are running low on stock?

SELECT product_name, stock_qty
FROM products
WHERE stock_qty < 10
ORDER BY stock_qty ASC;


-- Q2. Which customers are in the West region?

SELECT customer_name, region
FROM customers
WHERE region = 'West';


-- Q3. Which employees have been here longest?

SELECT employee_name, date_employed
FROM employees
ORDER BY date_employed ASC;


-- ------------------------------------------------------------
-- PART 2 — Joining tables
-- ------------------------------------------------------------

-- Q4. What is each order worth?

SELECT orders.order_id, products.product_name, orders.qty, products.price,
       orders.qty * products.price AS revenue
FROM orders
JOIN products ON orders.product_id = products.product_id
ORDER BY revenue DESC;


-- Q5. Which customer bought what, and what was each order worth?

SELECT orders.order_id, customers.customer_name, products.product_name,
       orders.qty * products.price AS revenue
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
JOIN products ON orders.product_id = products.product_id
ORDER BY revenue DESC;


-- ------------------------------------------------------------
-- PART 3 — Grouping and totalling
-- ------------------------------------------------------------

-- Q6. Total revenue by region.

SELECT customers.region,
       COUNT(*) AS orders,
       SUM(orders.qty * products.price) AS revenue
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
JOIN products ON orders.product_id = products.product_id
GROUP BY customers.region
ORDER BY revenue DESC;


-- Q7. Total revenue by product category.

SELECT products.category,
       COUNT(*) AS orders,
       SUM(orders.qty * products.price) AS revenue
FROM orders
JOIN products ON orders.product_id = products.product_id
GROUP BY products.category
ORDER BY revenue DESC;


-- Q8. Which employee handled the most revenue?

SELECT employees.employee_name,
       COUNT(*) AS orders,
       SUM(orders.qty * products.price) AS revenue
FROM orders
JOIN employees ON orders.employee_id = employees.employee_id
JOIN products ON orders.product_id = products.product_id
GROUP BY employees.employee_name
ORDER BY revenue DESC;


-- ------------------------------------------------------------
-- PART 4 — Comparing totals against ratios
-- ------------------------------------------------------------

-- Q9. Orders and revenue by category, with each category's
--     share of the total order count.

SELECT products.category,
       COUNT(*) AS orders,
       ROUND(SUM(orders.qty * products.price), 2) AS revenue,
       ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM orders), 1) AS order_share_pct
FROM orders
JOIN products ON orders.product_id = products.product_id
GROUP BY products.category
ORDER BY revenue DESC;


-- Q10. Revenue per order by region, rather than total revenue.

SELECT customers.region,
       COUNT(*) AS orders,
       ROUND(SUM(orders.qty * products.price), 2) AS revenue,
       ROUND(SUM(orders.qty * products.price) / COUNT(*), 2) AS revenue_per_order
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
JOIN products ON orders.product_id = products.product_id
GROUP BY customers.region
ORDER BY revenue_per_order DESC;


-- ------------------------------------------------------------
-- What I found
-- ------------------------------------------------------------

-- By category (Q7 and Q9):
--   ____________ had the most orders (__ of 35) but earned only €__________.
--   ____________ had far fewer orders (__) and earned €__________.
--
-- By region (Q6 and Q10):
--   ____________ has the highest total revenue.
--   But ____________ earns the most per order — €________ against €________.
--
-- What this means:
--   _____________________________________________________________
--   _____________________________________________________________
SELECT customers.region,
       COUNT(*) AS orders,
       SUM(orders.qty * products.price) AS revenue
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
JOIN products ON orders.product_id = products.product_id
GROUP BY customers.region
ORDER BY revenue DESC;


-- Q7. Total revenue by product category.

SELECT products.category,
       COUNT(*) AS orders,
       SUM(orders.qty * products.price) AS revenue
FROM orders
JOIN products ON orders.product_id = products.product_id
GROUP BY products.category
ORDER BY revenue DESC;


-- Q8. Which employee handled the most revenue?

SELECT employees.employee_name,
       COUNT(*) AS orders,
       SUM(orders.qty * products.price) AS revenue
FROM orders
JOIN employees ON orders.employee_id = employees.employee_id
JOIN products ON orders.product_id = products.product_id
GROUP BY employees.employee_name
ORDER BY revenue DESC;


-- ------------------------------------------------------------
-- PART 4 — Still to do
-- ------------------------------------------------------------

-- Q9. For each category: how many orders, how much revenue,
--     and what share of each.




-- Q10. Revenue per order by region, not total revenue.




-- ------------------------------------------------------------
-- What I found
-- ------------------------------------------------------------

-- (To write up.)

-- Q8. Which employee handled the most revenue?




-- ------------------------------------------------------------
-- PART 4 — Comparing totals against ratios
-- ------------------------------------------------------------

-- Q9. For each category: how many orders, how much revenue,
--     and what share of each.




-- Q10. Revenue per order by region, not total revenue.




-- ------------------------------------------------------------
-- What I found
-- ------------------------------------------------------------

-- (Written up here once the queries above are answered.)
