-- !Extracting order_month column from order_date
ALTER Table orders ADD COLUMN order_month VARCHAR(20);

UPDATE orders
SET order_month = TO_CHAR(order_date,'Month');

SELECT DISTINCT
    order_month
FROM
    orders;

-- !Extracting order_day column from order_date

ALTER TABLE orders ADD COLUMN order_day VARCHAR(20);

SELECT order_day FROM orders;

UPDATE orders
SET order_day = TO_CHAR(order_date, 'Day');

SELECT order_day FROM orders;

-- !Extracting order_hour from order_time column
ALTER TABLE orders ADD COLUMN order_hour INT;

SELECT order_hour FROM orders;

UPDATE orders
SET order_hour = EXTRACT(HOUR FROM order_time);

SELECT order_hour FROM orders;

-- !Extracting delivery_hour from delivery_time
ALTER TABLE orders ADD COLUMN delivery_hour INT;

SELECT delivery_hour FROM orders;

UPDATE orders
SET delivery_hour = EXTRACT(HOUR FROM delivery_time);

SELECT delivery_hour FROM orders;

-- !Adding total_amount column in orders table
ALTER TABLE orders ADD COLUMN total_amount DECIMAL(10,2);

SELECT total_amount FROM orders;

UPDATE orders
SET total_amount = orders.quantity * products.price
FROM products
WHERE orders.product_id = products.product_id;

SELECT total_amount FROM orders;

-- !Adding time_taken_to_deliver column 
ALTER TABLE orders ADD COLUMN time_taken_to_deliver INT;

UPDATE orders
SET time_taken_to_deliver = (delivery_date - order_date);

SELECT time_taken_to_deliver FROM orders;

