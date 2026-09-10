#------Stored Procedure

-- 63. Create a procedure that displays all customers.
delimiter //
create procedure customers()
begin
select * from customer_details;
end //
delimiter ;
call customers();

-- 64. Create a procedure that accepts a customer_id and displays that customer's details.
delimiter //
create procedure customer(in customerid int)
begin
select * from customer_details
where customer_id=customerid;
end //
delimiter ;
call customer(5);

-- 65. Create a procedure that accepts a category and displays all products belonging to that category.
delimiter //
create procedure product_cat(in new_category varchar(50))
begin
select product_name from product_details
where category=new_category;
end //
delimiter ;
call product_cat("Electronics");

-- 66. Create a procedure that accepts a minimum price and displays products whose price is greater than that amount.
select min(price) from product_details;
delimiter //
create procedure cus(in new_price int)
begin
select product_name from product_details
where price>new_price;
end //
delimiter ;
call cus(5500);

-- 67. Create a procedure that accepts a customer ID and displays all orders placed by that customer.
delimiter //
create procedure cu(in new_id int)
begin
select * from order_details
where customer_id=new_id;
end //
delimiter ;
call cu(3);
