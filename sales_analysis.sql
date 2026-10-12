USE sales_analysis;

SELECT *
FROM sales_data;

SELECT order_id, customer_name, total_price
FROM sales_data
WHERE total_price > 1000;

SELECT order_id, customer_name, total_price
FROM sales_data
ORDER BY total_price DESC;

SELECT category,
       SUM(total_price) AS total_revenue
FROM sales_data
GROUP BY category
ORDER BY total_revenue DESC;

SELECT
    SUM(total_price) AS total_revenue,
    AVG(total_price) AS average_sale_value,
    COUNT(*) AS total_records
FROM sales_data;

SELECT
    customer_name,
    SUM(total_price) AS total_spent,
    COUNT(DISTINCT order_id) AS total_orders
FROM sales_data
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 10;

SELECT AVG(order_total) AS average_order_value
FROM (
    SELECT order_id,
           SUM(total_price) AS order_total
    FROM sales_data
    GROUP BY order_id
) AS order_summary;

USE sales_analysis;

CREATE TABLE customer_summary AS
SELECT DISTINCT customer_name, region
FROM sales_data;


-- Count sales and revenue by sales category
SELECT
    CASE
        WHEN total_price >= 5000 THEN 'High'
        WHEN total_price >= 1000 THEN 'Medium'
        ELSE 'Low'
    END AS sales_category,
    COUNT(*) AS number_of_sales,
    SUM(total_price) AS total_revenue
FROM sales_data
GROUP BY sales_category
ORDER BY total_revenue DESC;


-- Sales analysis by region
SELECT
    region,
    SUM(total_price) AS total_revenue,
    AVG(total_price) AS average_sale,
    COUNT(DISTINCT order_id) AS total_orders
FROM sales_data
GROUP BY region
ORDER BY total_revenue DESC;
