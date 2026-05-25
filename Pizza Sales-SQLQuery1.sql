select * from pizza_sales

#Total_Revenue
select sum(total_price) as Total_Revenue from pizza_sales;

#Average_OrderValue
select sum(total_price)/count(distinct order_id) as Average_order_value from pizza_sales;

#Total pizza sold
select sum(quantity) as Total_pizza_sold from pizza_sales;

#Total orders
select count(distinct order_id) as Total_order from pizza_sales;

#Average_pizza_per_order
select cast(cast(sum(quantity) as decimal(10,2))/cast(count(distinct order_id)as decimal(10,2)) as decimal(10,2)) as Average_pizza_per_order from pizza_sales

#Daily_Trend_for_total_orders
select datename(dw,order_date) as order_day,
count(distinct order_id) as Total_orders
from pizza_sales
group by datename(dw,order_date)

#Monthly_trend_for_total_orders
select datename(month,order_date) as Month_name,
count(distinct order_id) as Total_orders
from pizza_sales
group by datename(month,order_date)
order by Total_orders desc

#Percentage of sales by pizza Category
select pizza_category,sum(total_price)*100/(select sum(total_price) from pizza_sales) as PCT
from pizza_sales
group by pizza_category; 

select pizza_category,sum(total_price) as Total_sales,sum(total_price)*100/(select sum(total_price) from pizza_sales where month(order_date)=1) as PCT
from pizza_sales
where month(order_date)=1 
group by pizza_category; 

#Percentage of sales by pizza size
select pizza_size,sum(total_price) as Total_sales,sum(total_price)*100/(select sum(total_price) from pizza_sales) as PCT
from pizza_sales
group by pizza_size; 

#Top 5 best sellers by total pizzas sold
select top 5 pizza_name, sum(total_price) as Total_Revenue from pizza_sales
group by pizza_name
order by Total_Revenue desc

#Bottom 5 worst sellers by total pizzas sold
select top 5 pizza_name, sum(total_price) as Total_Revenue from pizza_sales
group by pizza_name
order by Total_Revenue asc





