# Retail Orders — SQL Practice
 
A working repository. I am learning SQL on a database I built myself, rather than on a tutorial dataset.
 
The database comes from my **Data Management** module at Fachhochschule Südwestfalen, where I built a four-table relational database in Microsoft Access for a sales and stock scenario. I have converted it to SQLite so the queries are portable and anyone can open it.
 
I add each query here as I write it. The question list below is what I want this database to answer.
 
---
 
## The database
 
```
customers ──┐
products  ──┼──→  orders
employees ──┘
```
 
`orders` is the fact table. Every row is one sale, and it points at three things: who bought it, what was sold, and which employee handled it.
 
| Table | Rows | What it holds |
|---|---:|---|
| `customers` | 48 | Customer ID, name, state, region |
| `products` | 95 | Product ID, category, name, price, stock quantity |
| `employees` | 11 | Employee ID, name, date employed |
| `orders` | 35 | Order ID, customer, product, employee, quantity, order date |
 
Every foreign key resolves — no order points at a customer, product or employee that does not exist.
 
Full table definitions are in [`schema.sql`](schema.sql).
 
---
 
## The questions
 
Grouped by the SQL they need. Answers go in [`queries.sql`](queries.sql) as I work through them, and findings are written up below.
 
**Reading one table**
1. Which products are out of stock, or nearly out?
2. Which customers are in each region?
3. Which employees have been here longest?
**Joining two tables**
4. What is the revenue of each individual order? (quantity × price)
5. Which product was sold in each order?
 
**Joining three tables**
6. What is total revenue by region?
7. What is total revenue by product category?
8. Which employee handled the most revenue?
 
**Aggregating and comparing**
9. Which categories sell often but earn little, and which are the reverse?
10. Which region has the highest revenue *per order*, rather than in total?
 
Question 10 is the one I care about most. It is the same idea as a retail case I worked through in another module: the totals and the per-unit figures rank things differently, and the gap between them is usually where the finding is.
 
---
 
## What I found
 
### Question 10 — revenue per order by region
 
Question 6 asks for total revenue by region. Question 10 asks for revenue per order. They do not give the same answer.
 
| Region | Orders | Total revenue | Revenue per order |
|---|---:|---:|---:|
| South | 4 | €4,938.69 | **€1,234.67** |
| West | 9 | €5,720.88 | €635.65 |
| Central | 15 | €7,032.73 | €468.85 |
| East | 7 | €1,416.19 | €202.31 |
 
Central earns the most in total. South earns nearly three times more per order than Central. Ranked on the last column alone, South is the region to put money into.
 
### Why I did not stop there
 
South has four orders. They are:
 
```
€4,199.30
€  368.94
€  349.71
€   20.74
```
 
One order is **85% of the region's entire revenue**. Take it out and South's revenue per order drops to roughly €246 — second from last instead of first.
 
The €1,234.67 is correct arithmetic. It is also not a fact about the South region. It is a fact about one customer.
 
### What would change my mind
 
- More orders. Four is not a sample.
- Whether that €4,199.30 sale is a type of sale that repeats, or a one-off.
- The same per-order spread for Central, to check that 15 orders are genuinely consistent and not hiding the same distortion.
### What I took from it
 
The gap between the total and the per-unit figure is where the finding is — but the finding is not always the one the gap points at. Here it pointed at South, and the real answer was that the sample was too small to point anywhere. Checking the rows behind an aggregate took about two minutes and changed the conclusion completely.
 
---
 
## Running it
 
The database is a single SQLite file, so there is nothing to install beyond a client.
 
- **DB Browser for SQLite** — [sqlitebrowser.org](https://sqlitebrowser.org), free, open `retail_orders.db`, use the *Execute SQL* tab
- Or from a terminal: `sqlite3 retail_orders.db`
---
 
## A note on the data
 
The underlying customer and product records come from the widely used Sample Superstore teaching dataset. The table structure, the modifications and the Access implementation were my coursework for the Data Management module at FH-SWF.
 
I worked the Question 10 comparison through with Claude (Anthropic) while writing it up for this repository. The database, the schema and the queries in [`queries.sql`](queries.sql) are my own work from the module.
 
---
 
**Pritom Mazumder** · BBA with Informatics, FH-SWF Campus Soest
 
