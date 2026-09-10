#1. Display all customer details.
select * from customer_details;

#2. Display only the customer_name and city of all customers.
select customer_name,city from customer_details;

#3. Find all customers who are from Kochi.
select * from customer_details where city='Kochi';

#4. Find all products whose price is greater than 10,000.
select * from product_details where price>10000;

#5. Display all products belonging to the Electronics category.
select * from product_details where category='Electronics';

#6. Display all products whose price is between 5,000 and 60,000.
select * from product_details where price between 5000 and 60000;

#7. Display products in descending order of price.
select * from product_details order by price desc;

#8. Display the three most expensive products.
select * from product_details order by price desc limit 3;

#9. Display all customers who are from either Kerala or Karnataka.
select * from customer_details where state in ("Kerala","Karnataka");

#10. Display all different cities represented in the customer table.
select distinct(city) from customer_details;

#11. Find the total number of customers.
select count(*) count_of_customers from customer_details;

#12. Find the total number of products.
select count(*) count_of_products from product_details;

#13. Find the average product price.
select avg(price) average_of_price from product_details;

#14. Find the highest product price.
select max(price) from product_details ;

#15. Find the lowest product price.
select min(price) from product_details ;

#16. Find the total quantity of products ordered.
select sum(quantity) from order_details;

#17. Find the total number of orders.
select count(*) from order_details;

#18. Find the total quantity ordered by each customer.
select customer_id,sum(quantity) from order_details group by customer_id;

#19.Find all customers whose names start with 'A'
select customer_id,customer_name from customer_details where customer_name like 'A%';

#20.Find all customers whose names contain 'nu'
select customer_id,customer_name from customer_details where customer_name like '%nu%';

#21.Find customers whose names have exactly 5 characters
select customer_id,customer_name from customer_details where customer_name like '_____';

