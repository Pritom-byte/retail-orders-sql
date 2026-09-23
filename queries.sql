-- ============================================================
-- Retail Orders — SQL practice
-- Database: retail_orders.db
--
-- Each question below gets answered as I work through it.
-- Unanswered ones are left blank on purpose.
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
-- PART 2 — Joining two tables
-- ------------------------------------------------------------

-- Q4. What is each order worth?
--     Join orders to products, multiply qty by price.




-- Q5. List every order with the product name next to it,
--     most expensive order first.




-- ------------------------------------------------------------
-- PART 3 — Joining three tables
-- ------------------------------------------------------------

-- Q6. Total revenue by region.




-- Q7. Total revenue by product category.




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
