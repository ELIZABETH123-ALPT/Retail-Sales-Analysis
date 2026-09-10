#----------Group by---------

#22. Find the number of customers in each city.
select city,count(customer_id)count_of_customer from customer_details group by city;

#23. Find the number of customers in each state.
select state,count(*) count_of_customer from customer_details group by state;

#24. Find the number of products in each category.
select category,count(*) no_of_product from product_details group by category;

#25. Find the average price of products in each category.
select category,avg(price) price_of_product from product_details group by category;

#26. Find the maximum price in each category.
select category,max(price) max_price from product_details group by category;

#27. Find the total quantity ordered for each product.
select product_id,sum(quantity) total_quantity from order_details group by product_id;

#28. Find customers who have placed more than one order.
select customer_id,count(order_id) no_of_order 
from order_details group by customer_id having no_of_order>1;

#29. Find cities having more than one customer.
select city,count(customer_id) no_of_customer from customer_details 
group by city having no_of_customer>1;

#30. Find categories whose average product price is greater than 20,000.
select category,avg(price) product_price from product_details 
group by category having product_price>20000;
