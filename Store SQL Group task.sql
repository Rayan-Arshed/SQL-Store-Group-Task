USE store;

-- Group 4 --

-- Task 1: Retrieve a list of products with their names and prices. --
SELECT name AS 'Name', unit_price AS 'Price' FROM products;

-- Task 2: Find the total number of customers in each state. --
SELECT count(distinct customer_id) AS 'Total People', state as 'State' FROM customers
GROUP BY state;

-- Task 3: Insert a new customer into the customers table. --
SELECT * FROM customers;

INSERT INTO customers VALUES (
11,
"Rayan", 
"Arshed", 
"2001-04-21", 
"754-376-9673", 
"10 Iron Lane", 
"Chicago", 
"IL", 
735);

-- Task 4: Delete all order items for a specific order (e.g., order ID 6). -- 
DELETE FROM order_items
WHERE order_id = 6;

DELETE FROM orders
WHERE order_id = 6;

DELETE order_items, orders
FROM order_items
JOIN orders
ON order_items.order_id = orders.order_id
WHERE order_items.order_id = 6;

-- Task 5: List all customers who have more than 2,000 points. -- 
SELECT first_name AS 'First Name', last_name AS 'Surname', points AS 'Points' FROM customers
WHERE Points > 2000;

-- Task 6 Update the quantity in stock for the product with product_id 3 to 50. --
UPDATE products
SET quantity_in_stock = 50
WHERE product_id = 3;

SELECT * FROM products;

-- Task 7: Get the order details for a specific customer (e.g., customer ID 5). Include the order date, status, and shipped date (if available). -- 
SELECT customers.customer_id AS 'ID Number', 
customers.first_name AS 'First Name', 
customers.last_name AS 'Surname', 
orders.order_date AS 'Date of Order', 
orders.status AS 'Status', 
orders.shipped_date AS 'Date of Shipment'
FROM customers JOIN orders 
ON customers.customer_id = orders.customer_id
WHERE customers.customer_id = 6;

-- Task 8: List the products and their prices for products that are out of stock (quantity_in_stock is 0). --
SELECT name, unit_price, quantity_in_stock 
FROM products
WHERE quantity_in_stock = 0;

SELECT * from products;

-- Extra Task: Calculate the total Revenue for each order, display the Order ID and Order Date --
SELECT order_id, SUM(unit_price*quantity) FROM order_items
GROUP BY order_id;

SELECT * from order_items;