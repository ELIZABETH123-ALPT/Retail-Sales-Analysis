#-------Case

-- 58. Display every product with a price category:

-- High → price ≥ 50,000
-- Medium → price between 10,000 and 49,999
-- Low → price < 10,000
select product_id,product_name,category,price,
case
when price>=50000 then "High"
when price between 10000 and 49999 then "Medium"
else "Low" 
end ranking
from product_details;

-- 59. Display each order and classify the quantity:
-- Large Order → quantity ≥ 2
-- Small Order → quantity < 2
select *, 
case 
when quantity>=2 then "large order" 
else "small order" 
end as order_scale from order_details;

-- 60. Display each product with "Expensive" or "Affordable" based on its price.
select product_id,product_name,category,price, 
case 
when price>=50000 then "Expensive" 
else "Affordable" 
end as price_category from product_details;


#---------common table expression

#61.Using a CTE, find the customers whose total sales are greater than ₹50,000.
with temp as
(
    select c.customer_id,c.customer_name,sum(p.price*o.quantity) total_sales_amount 
    from customer_details c inner join order_details o inner join product_details p
    on c.customer_id=o.customer_id and p.product_id=o.product_id group by c.customer_id,c.customer_name
)
select customer_id,customer_name from temp where total_sales_amount>50000;

#62.Using a CTE, find the average product price for each category, 
#and display categories where the average price is greater than ₹10,000
with copy as
(
    select category,avg(price) avg_price from product_details
    group by category
)
select category,avg_price from copy where avg_price>10000;
