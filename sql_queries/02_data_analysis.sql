-- !Total Revenue
SELECT
    SUM(total_amount) as total_revenue
FROM
    orders;

-- !Average Order Deliver Time (Days)
SELECT
    ROUND(AVG(time_taken_to_deliver), 2) as avg_order_delivery_time
FROM
    orders;

-- !Month Wise Revenue
SELECT
    order_month,
    SUM(total_amount) as total_revenue
FROM
    orders
GROUP BY
    order_month;

-- !Average of Total_amount
SELECT
    ROUND(AVG(total_amount), 2) AS avg_total_amount
FROM
    orders;

-- !Top 5 Best Selling Products Revenue Wise
SELECT
    products.product_name,
    SUM(orders.total_amount) as total_revenue,
    COUNT(orders.order_id) as items_sold
FROM
    orders
JOIN
    products ON products.product_id = orders.product_id
GROUP BY
    products.product_name
ORDER BY
    total_revenue DESC
LIMIT 5;


-- !Top 5 Best Selling Products Quantity Wise
SELECT
    products.product_name,
    SUM(orders.total_amount) as total_revenue,
    COUNT(orders.order_id) as items_sold
FROM
    orders
JOIN
    products ON products.product_id = orders.product_id
GROUP BY
    products.product_name
ORDER BY
    items_sold DESC
LIMIT 5;


-- !Top 10 Cities by Number of Orders
SELECT
    customers.city,
    COUNT(orders.order_id) as orders_count
FROM
    orders
JOIN
    customers ON customers.customer_id = orders.customer_id
GROUP BY
    customers.city
ORDER BY
    orders_count DESC
LIMIT 10;

-- !Occasion Wise Revenue
SELECT
    SUM(total_amount) as revenue,
    occasion
FROM
    orders
GROUP BY
    occasion
ORDER BY
    revenue DESC;

-- !Hour Wise Revenue
SELECT
    SUM(total_amount) as revenue,
    order_hour
FROM
    orders
GROUP BY
    order_hour
ORDER BY
    order_hour;

-- !Product Category Wise Revenue
SELECT
    SUM(total_amount) as revenue,
    products.category
FROM
    orders
JOIN
    products ON orders.product_id = products.product_id
GROUP BY
    products.category
ORDER BY
    revenue DESC;

-- !Total Number of Orders
SELECT
    COUNT(order_id) as total_number_of_orders
FROM
    orders;



    
