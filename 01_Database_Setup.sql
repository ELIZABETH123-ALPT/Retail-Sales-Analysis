create database sales_analysis;
use sales_analysis;

#table1 customer_detail
create table customer_details(
	   customer_id int,
       customer_name varchar(50),
       city varchar(50),
       state varchar(50)
);
select * from customer_details;

#table2 order_details
create table order_details(
	   order_id int,
       customer_id int,
       product_id int,
       quantity int,
       order_date date
);
select * from order_details;

#table3 product_details
create table product_details(
	   product_id int,
       product_name varchar(50),
       category varchar(50),
	   price int
);
select * from product_details;
describe customer_details;


-- 
-- alter table customer_details add salary int;
-- alter table customer_details add (age int,district text);
-- alter table customer_details drop column age;
-- alter table customer_details drop column district;
-- alter table customer_details add age int after city, add district text after age;
-- alter table customer_details add sl_no int first ;
-- alter table customer_details modify district varchar(50);
-- alter table customer_details rename column district to prof ;
-- alter table customer_details drop column sl_no,drop column age,drop column prof,drop column salary;
-- alter table customer_details drop column age;
-- alter table customer_details drop column prof;
-- alter table customer_details drop column salary;

-- insert values to table

#insert datas to table1
insert into customer_details (customer_id,customer_name,city,state)
value(1,'Arun','Kochi','Kerala'),
(2,'Meera','Chennai','Tamil Nadu'),
(3,'Rahul','Bangalore','Karnataka'),
(4,'Anu','Kochi','Kerala'),
(5,'Vishnu','Hyderabad','Telangana');
select * from customer_details;

#insert datas to table2
insert into product_details (product_id,product_name,category,price)
value(101,'laptop','Electronics',60000),
(102,'keyboard','Accessories',7000),
(103,'laptop','Electronics',65000),
(104,'phone','Electronics',55000),
(105,'keyboard','Accessories',5500);
select * from product_details;

#insert datas to table3
insert into order_details (order_id,customer_id,product_id,quantity,order_date)
value(1001,1,101,1,'2026-06-03'),
(1002,3,104,1,'2026-05-30'),
(1003,5,105,3,'2026-06-02'),
(1004,4,104,2,'2026-05-28'),
(1005,2,102,1,'2026-05-29'),
(1006,3,101,2,'2026-05-30'),
(1007,1,104,2,'2026-06-01'),
(1008,3,103,1,'2026-06-01');
select * from order_details;