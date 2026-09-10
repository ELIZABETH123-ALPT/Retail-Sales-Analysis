#------Ranking/Dense ranking

#68.  Rank products based on total sales amount using RANK()..
select p.product_id,p.product_name,sum(p.price*o.quantity),rank() 
over (order by sum(p.price*o.quantity) desc) ranking
from order_details o inner join product_details p on  p.product_id=o.product_id
group by p.product_id,p.product_name ;

-- 69. Rank customers based on their total purchase amount, from highest to lowest, using DENSE_RANK().
select c.customer_id,c.customer_name,sum(p.price * o.quantity) total_purchase,
dense_rank() over (order by SUM(p.price * o.quantity) desc) ranking
from customer_details c inner join order_details o on c.customer_id = o.customer_id 
inner join product_details p on p.product_id = o.product_id group by c.customer_id, c.customer_name;

-- 70. Find the highest-selling product in each category using RANK().
with ranked_products as
(
    select p.product_id,p.product_name,p.category,SUM(p.price * o.quantity) total_sales,
	rank() over (partition by p.category order by SUM(p.price * o.quantity) desc) ranking
    from product_details p inner join order_details o on p.product_id = o.product_id
    group by p.product_id, p.product_name, p.category
)
select * from ranked_products where ranking = 1;

-- 71. Find the top 2 customers from each city based on total sales using DENSE_RANK().
with customer_sales as
(
    select c.customer_id,c.customer_name,c.city,sum(p.price * o.quantity) total_sales,
	dense_rank() over (partition by c.city order by sum(p.price * o.quantity) desc) ranking
    from customer_details c inner join order_details o on c.customer_id = o.customer_id
    inner join product_details p on p.product_id = o.product_id group by c.customer_id, c.customer_name, c.city
)
select * from customer_sales where ranking <= 2;




-- 72. Display all orders placed in June 2026.
select * from order_details
where order_date between '2026-06-01' and '2026-06-30';

-- 73. Find the earliest order date.
select min(order_date) from order_details;

-- 74. Find the latest order date.
select max(order_date) from order_details;

-- 75. Count the number of orders placed on each date.
select order_date,count(order_date) from order_details
group by order_date;

-- 76. Find the customer who spent the most money.
select c.customer_id,c.customer_name,sum(p.price*o.quantity) as total_sales_amount
from customer_details c  inner join order_details o inner join product_details p
on c.customer_id=o.customer_id and p.product_id=o.product_id group by c.customer_id,c.customer_name
order by total_sales_amount desc limit 1;

-- 77. Find the second-highest priced product.
select product_id,product_name from product_details where price<(select max(price) as pr
from product_details) order by price desc limit 1;

-- 78. Find the city with the highest number of customers.
select city,count(customer_id) no_cus from customer_details group by city order by no_cus desc limit 1;

-- 79. Find the product with the highest total quantity sold.
select p.product_id,p.product_name,sum(o.quantity) as total_sales_amount
from customer_details c  inner join order_details o inner join product_details p
on c.customer_id=o.customer_id and p.product_id=o.product_id group by p.product_id,p.product_name
order by total_sales_amount desc limit 1;

-- 80. Find customers who purchased more than one different product.
select c.customer_id,c.customer_name,count(distinct(o.product_id)) different_products
from customer_details c inner join order_details o on c.customer_id=o.customer_id
group by c.customer_id,c.customer_name having different_products > 1;

-- 81. Find the category that generated the highest sales.
select p.category,sum(p.price*o.quantity) as total_sales from order_details o
inner join product_details p on p.product_id=o.product_id group by p.category order by total_sales desc limit 1;

-- 82. Find the most frequently ordered product.
select p.product_id,p.product_name,count(o.order_id) as no_of_orders from product_details p inner join order_details o
on p.product_id=o.product_id group by p.product_id,p.product_name order by no_of_orders desc limit 1;

-- 83. Find the customer who placed the most recent order.
select c.customer_id,c.customer_name,o.order_date from customer_details c inner join order_details o on c.customer_id=o.customer_id
where o.order_date = (select max(order_date) from order_details);

-- 84. Find products that have been purchased by more than one customer.
select p.product_id,p.product_name,count(distinct o.customer_id) as no_of_customers 
from product_details p inner join order_details o on p.product_id=o.product_id group by p.product_id,p.product_name
having no_of_customers > 1;

-- 85. Find the customer(s) who purchased the most expensive product.
select distinct c.customer_id,c.customer_name 
from customer_details c inner join order_details o on c.customer_id=o.customer_id inner join product_details p on p.product_id=o.product_id
where p.price = (select max(price)from product_details);
