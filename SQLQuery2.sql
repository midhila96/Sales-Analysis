SELECT * FROM pizza_sales

--CALCULATION OF KPI REQUIREMENTS

--calculation of total revenue
SELECT SUM(total_price) AS Total_revenue
FROM pizza_sales 

--calculation of average order value
SELECT SUM (total_price)/ COUNT(DISTINCT order_id) AS average_order_value
FROM pizza_sales

--calculation of total pizza sold
SELECT SUM(quantity) AS total_pizza_sold
From pizza_sales

--calculation of total orders placed
SELECT COUNT(DISTINCT order_id) AS total_order_placed 
FROM pizza_sales

--calculation of average pizza per order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL (10,2))/CAST (COUNT(DISTINCT order_id) AS DECIMAL (10,2)) AS DECIMAL (10,2)) AS Avg_pizza_per_order
FROM pizza_sales


--CHART REQUIREMENTS

--Daily trend for total orders
SELECT DATENAME(DW,order_date) AS order_day,COUNT(DISTINCT order_id) AS total_orders_per_day
FROM pizza_sales
GROUP BY DATENAME(DW,order_date)

--Montly trends for total orders
SELECT DATENAME(MM,order_date) AS order_month,COUNT(DISTINCT order_id) AS total_orders_per_month
FROM pizza_sales
GROUP BY DATENAME(MM,order_date) 
ORDER BY total_orders_per_month DESC

--Percentage of sales by pizza category
SELECT pizza_category, SUM (total_price) * 100/(SELECT SUM (total_price) FROM pizza_sales) AS PCT, SUM(total_price) As Total_sales
FROM pizza_sales
GROUP BY pizza_category

--Percentage of sales by pizza size
SELECT pizza_size, SUM (total_price) * 100/(SELECT SUM (total_price) FROM pizza_sales) AS PCT, SUM(total_price) As Total_sales
FROM pizza_sales
GROUP BY pizza_size
