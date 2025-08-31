CREATE TABLE pizza_sales (
    pizza_id SERIAL PRIMARY KEY,
    order_id INT,
    pizza_name_id VARCHAR(50),
    quantity INT,
    order_date DATE,
    order_time TIME,
    unit_price NUMERIC(10,2),
    total_price NUMERIC(10,2),
    pizza_size VARCHAR(10),
    pizza_category VARCHAR(50),
    pizza_ingredients TEXT,
    pizza_name VARCHAR(100)
);

select * from pizza_sales
-- Q1 Total revenue - 817860.05
SELECT SUM(total_price) AS total_revenue
FROM pizza_sales

--Q2 average order value  - 38.31
select round(sum(total_price)/ count(distinct order_id), 2) as avg_order_value
from Pizza_sales

---Q3 total pizza sold - 49574
select sum(quantity) AS total_pizza_sold from pizza_sales

---Q4 total number of order placed - 21350
select count(distinct order_id) as total_order from pizza_sales;

--Q5 Average pizzas per order -2.32
select 
round(cast(sum(quantity) as decimal(10,2) )/ 
cast (count(distinct order_id) as decimal(10,2)), 2) 
as avg_pizza_per_order 
from pizza_sales

select* from pizza_sales
--- Q6- Daily Trend for Total Orders or Count orders per day as week name like sunday , monday etc

SELECT 
    EXTRACT(DOW FROM order_date) AS weekday_num,   -- 0 = Sunday, 1 = Monday ...
    TO_CHAR(order_date, 'Day') AS order_day,       -- Day ka naam
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY EXTRACT(DOW FROM order_date), TO_CHAR(order_date, 'Day')
ORDER BY total_orders DESC;

--- Q7- Daily Trend for Total Orders or Count orders per month as week name like jan, feb  etc
SELECT 
    TO_CHAR(order_date, 'Month') AS order_month, 
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY TO_CHAR(order_date, 'Month')
ORDER BY total_orders DESC;

select * from pizza_sales
--- 8Percentage of Sales by Pizza Category”

SELECT 
    pizza_category,
    ROUND(SUM(total_price), 2) AS category_sales,
    ROUND(SUM(total_price) * 100.0 / SUM(SUM(total_price)) OVER(), 2) AS sales_percentage
FROM pizza_sales
GROUP BY pizza_category
ORDER BY category_sales DESC;

--- using filtors in query for to check specific month percentage of different category

SELECT 
    pizza_category,
    ROUND(SUM(total_price), 2) AS category_sales,
    ROUND(SUM(total_price) * 100.0 / SUM(SUM(total_price)) OVER(), 2) AS sales_percentage
FROM pizza_sales
WHERE EXTRACT(MONTH FROM order_date) = 2   -- february
GROUP BY pizza_category
ORDER BY category_sales DESC;

---9 Percentage of Sales by Pizza Size

SELECT 
    pizza_size,
    ROUND(SUM(total_price),2) AS total_sales,
    ROUND(SUM(total_price) * 100.0 / SUM(SUM(total_price)) OVER(),2) AS sales_percentage
FROM pizza_sales
GROUP BY pizza_size
ORDER BY sales_percentage DESC;

--- Count how many pizzas were sold in each category (Classic, Supreme, Veggie, Chicken).

select pizza_category,
 sum(quantity) as total_pizza_sold
 from pizza_sales
 group by pizza_category
 order by total_pizza_sold desc


--- Top 5 Best Sellers by Revenue, Total Quantity and Total Orders
SELECT 
    pizza_name,
    SUM(total_price) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC
limit 5;

SELECT 
    pizza_name,
    SUM(quantity) AS total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity DESC
limit 5;

select * from pizza_sales
SELECT 
    pizza_name,
    count(distinct order_id) AS total_order
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_order DESC
limit 5;


-- Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders

SELECT 
    pizza_name,
    SUM(total_price) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue ASC
LIMIT 5;

SELECT 
    pizza_name,
    SUM(quantity) AS total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity ASC
LIMIT 5;

SELECT 
    pizza_name,
    count(distinct order_id) AS total_order
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_order ASC
LIMIT 5;


