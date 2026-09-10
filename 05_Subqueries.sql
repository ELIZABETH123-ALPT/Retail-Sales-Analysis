#------Sub Queary

#52. Find products whose price is greater than the average product price.
select product_name from product_details
where price>(select avg(price) from product_details);

#53. Find the product with the highest price.
select product_name from product_details
where price=(select max(price) from product_details);

#54. Find products whose price is greater than the average price of products in the Electronics category.
select product_name from product_details
where price>(select avg(price) from product_details where category="Electronics");

#55. Find customers from the city that has the highest number of customers.
select customer_name from customer_details
where city=(select city from customer_details group by city order by count(customer_id) desc limit 1);

#56. Find the product(s) whose price is equal to the maximum product price.
select product_name from product_details where price = (select max(price) from product_details);

#57. Find customers whose total spending is greater than the average customer spending
select c.customer_id,c.customer_name,sum(o.quantity*p.price) as total
from customer_details c inner join order_details o inner join product_details as p
on c.customer_id=o.customer_id and o.product_id= p.product_id group by c.customer_id,c.customer_name
having total>(select avg(cust_total) from
(select c.customer_id,c.customer_name,sum(o.quantity*p.price) as cust_total
from customer_details c inner join order_details o inner join product_details as p
on c.customer_id=o.customer_id and o.product_id= p.product_id 
group by c.customer_id,c.customer_name) as q);



