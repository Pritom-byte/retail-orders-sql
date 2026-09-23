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

Grouped by the SQL they need. Answers go in [`queries.sql`](queries.sql) as I work through them.

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

## Running it

The database is a single SQLite file, so there is nothing to install beyond a client.

- **DB Browser for SQLite** — [sqlitebrowser.org](https://sqlitebrowser.org), free, open `retail_orders.db`, use the *Execute SQL* tab
- Or from a terminal: `sqlite3 retail_orders.db`

---

## A note on the data

The underlying customer and product records come from the widely used Sample Superstore teaching dataset. The table structure, the modifications and the Access implementation were my coursework for the Data Management module at FH-SWF.

---

**Pritom Mazumder** · BBA with Informatics, FH-SWF Campus Soest
