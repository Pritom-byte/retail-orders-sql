-- Schema for retail_orders.db
-- Generated from the Microsoft Access database
-- built for the Data Management module, FH-SWF.

CREATE TABLE customers (customer_id TEXT PRIMARY KEY, customer_name TEXT, state TEXT, region TEXT);

CREATE TABLE employees (employee_id INTEGER PRIMARY KEY, employee_name TEXT, date_employed TEXT);

CREATE TABLE orders (
  order_id INTEGER PRIMARY KEY, customer_id TEXT NOT NULL, product_id TEXT NOT NULL,
  employee_id INTEGER NOT NULL, qty INTEGER, order_date TEXT,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (product_id)  REFERENCES products(product_id),
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id));

CREATE TABLE products  (product_id TEXT PRIMARY KEY, category TEXT, product_name TEXT, price REAL, stock_qty REAL);
