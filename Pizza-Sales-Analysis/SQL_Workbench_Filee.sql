show databases;
create database pizza_DB;
use pizza_DB;
show tables;

select * from pizza_sales;

# total revenue

select sum(total_price) as Total_revenue from pizza_sales;

#  average order values

select sum(total_price) / count(distinct order_id) as Avg_order_value from pizza_sales; 

# total pizza sales

select sum(quantity) as total_pizza_sold from pizza_sales;

# Total order palced 

select count(distinct order_id) as Total_order_count from pizza_sales;

# Average pizza per order 

select sum(quantity) / count(distinct order_id) as Average_pizza_per_order from pizza_sales;

# daily trend for total orders


# percentage of sales by pizza category 

select pizza_category, sum(total_price) as total_sales,
sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as Percentage_Total_sales
from pizza_sales 
group by pizza_category;


# percentage of sales by pizza size 

select pizza_size, cast(sum(total_price) as decimal(10,2)) as total_sales, 
cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal(10,2)) as Percentage_total_sales
from pizza_sales
group by pizza_size
order by percentage_total_sales desc;

# top 5 best sellers by revenue

select pizza_name, sum(total_price) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue desc limit 5;

# bottom 5 wrost sellers by revenue

select pizza_name, cast(sum(total_price) as decimal(10,2)) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue asc limit 5;


# Top 5 best seller pizza by quantity 

select pizza_name, sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity desc limit 5;

# top 5 wrost selller pizza by quantity

select pizza_name, sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity asc limit 5;


# top 5 best seller pizza by order 

select pizza_name, count(distinct order_id) as total_orders from pizza_sales
group by pizza_name
order by total_orders desc limit 5;

# top 5 wrost sellers pizza by orders 

select pizza_name, count(distinct order_id) as total_orders from pizza_sales
group by pizza_name
order by total_orders asc limit 5;













