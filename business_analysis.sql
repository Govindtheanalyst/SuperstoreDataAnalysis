
CREATE TABLE superstore (
    row_id INT,
    order_id VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales DECIMAL(10,2),
	shipping_days INT,
	order_year INT,
	order_month VARCHAR(50),
	order_quarter INT
);



--Which customers generated the highest revenue by sales?
SELECT customer_name,ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

--How do Sales compare across different categories
SELECT category, ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;

--What are the Monthly sales trends?
SELECT order_year, order_month, SUM(sales) AS revenue
FROM superstore
GROUP BY order_year, order_month
ORDER BY order_year, order_month DESC;

--Which Regions contribute the most to total sales
SELECT region, ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;

--Which states generate the highest sales revenue?
SELECT state, ROUND(SUM(sales),2) AS sales_revenue
FROM superstore
GROUP BY state
ORDER BY sales_revenue DESC;

--How do sales differ across customer segments?
SELECT segment AS customer_segment, ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY customer_segment
ORDER BY total_sales DESC;

--Which Products are the Top 10 Best sellers by Revenue?
SELECT product_name AS Products, ROUND(SUM(sales),2) AS Sales
FROM superstore
GROUP BY Products
ORDER BY Sales DESC
LIMIT 10;

--What is the average order value?
SELECT ROUND(SUM(sales) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM superstore;

-- Which shipping mode is used most often?
SELECT ship_mode, COUNT(*) AS total_orders
FROM superstore
GROUP BY ship_mode
ORDER BY total_orders DESC;

--Which quarter Generates the highest Revenue?
SELECT order_quarter,ROUND(SUM(sales),2) AS Revenue
FROM superstore
GROUP BY order_quarter
ORDER BY Revenue DESC;

--Which cities generate the highest sales Revenue?
SELECT city, ROUND(SUM(sales),2) AS Revenue
FROM superstore
GROUP BY city
ORDER BY Revenue DESC;

