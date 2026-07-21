USE amazon;

/*═══════════════════════════════════════════════════════════════════════
 📊 Q1 .
───────────────────────────────────────────────────────────────────────
 Find the total number of orders fulfilled by each seller state.
═══════════════════════════════════════════════════════════════════════*/
SELECT 
    seller_state, COUNT(DISTINCT order_id) AS total_orders
FROM
    sellers
        JOIN
    order_items USING (seller_id)
GROUP BY seller_state
ORDER BY total_orders DESC;



/*═══════════════════════════════════════════════════════════════════════
 📈 Q2 .
───────────────────────────────────────────────────────────────────────
 For each product category, calculate the cumulative revenue generated
 as orders come in over time.
═══════════════════════════════════════════════════════════════════════*/

select 
    product_category_name_english as category_name,
    order_purchase_timestamp as purchase_time,
    price as item_price,
    sum(price)over(partition by product_category_name_english order by order_purchase_timestamp) as total_revenue
from order_items
join 
orders 
using (order_id)
join 
products 
using (product_id)
join 
product_category_name_translation 
using (product_category_name);



/*═══════════════════════════════════════════════════════════════════════
 💳 Q3 .
───────────────────────────────────────────────────────────────────────
 Which payment method do customers use the most, and what is the
 average order value for each payment type?
═══════════════════════════════════════════════════════════════════════*/
select 
    payment_type, 
    count(payment_sequential) as type_of_pay_use, 
    avg(payment_value) as average_order
from order_payments
group by payment_type
order by type_of_pay_use desc;



/*═══════════════════════════════════════════════════════════════════════
 👑 Q4 .
───────────────────────────────────────────────────────────────────────
 Find the customer who has spent the most money across all their orders.
═══════════════════════════════════════════════════════════════════════*/

select 
    customer_unique_id, 
    sum(payment_value) as money_spent
from customers
join 
orders 
using (customer_id)
join 
order_payments 
using (order_id)
group by customer_unique_id
order by money_spent desc
limit 10;




/*═══════════════════════════════════════════════════════════════════════
 ⭐ Q5 .
───────────────────────────────────────────────────────────────────────
 Find the average review score for each product category.
═══════════════════════════════════════════════════════════════════════*/
select 
    product_category_name_english as category, 
    avg(review_score)as avg_rating
from order_reviews
join 
order_items 
using (order_id)
join 
products 
using (product_id)
join 
product_category_name_translation 
using (product_category_name)
group by product_category_name_english
order by avg_rating desc;

/*═══════════════════════════════════════════════════════════════════════
 📍 Q6 .
───────────────────────────────────────────────────────────────────────
 Find the total number of orders placed by each customer, broken down
 by the state they live in.
═══════════════════════════════════════════════════════════════════════*/
select 
    customer_unique_id, 
    customer_state, 
    count(order_id) as total_orders
from customers
join 
orders 
using (customer_id)
group by customer_unique_id,customer_state;

/*═══════════════════════════════════════════════════════════════════════
 🏪 Q7 .
───────────────────────────────────────────────────────────────────────
 Identify sellers who registered on the platform but have never
 fulfilled a single order.
═══════════════════════════════════════════════════════════════════════*/
select
    seller_id
from sellers
left join
order_items
using(seller_id) where order_id is null;

/*═══════════════════════════════════════════════════════════════════════
 💰 Q8 .
───────────────────────────────────────────────────────────────────────
 Find the top 5 product categories by total revenue.
═══════════════════════════════════════════════════════════════════════*/
select
    product_category_name_english as category,
    SUM(price) as total_sales
from order_items
join products
join product_category_name_translation
using(product_category_name)
group by product_category_name_english
order by total_sales desc
limit 5;

/*═══════════════════════════════════════════════════════════════════════
 🚚 Q9 .
───────────────────────────────────────────────────────────────────────
 Find the median delivery time (in days) between order placement and
 actual delivery.
═══════════════════════════════════════════════════════════════════════*/
WITH delivery_time AS (
    SELECT
        DATEDIFF(order_delivered_customer_date,
                 order_purchase_timestamp) AS delivery_days
    FROM orders
    WHERE order_delivered_customer_date IS NOT NULL
)

SELECT
    AVG(delivery_days) AS median_delivery_days
FROM (
    SELECT
        delivery_days,
        ROW_NUMBER() OVER (ORDER BY delivery_days) AS rn,
        COUNT(*) OVER () AS total_rows
    FROM delivery_time
) AS t
WHERE rn IN (
    FLOOR((total_rows + 1) / 2),
    FLOOR((total_rows + 2) / 2)
);
/*═══════════════════════════════════════════════════════════════════════
 📦 Q10 .
───────────────────────────────────────────────────────────────────────
 Find all products that have never been ordered.
═══════════════════════════════════════════════════════════════════════*/
select
    product_id,
    product_category_name_english
from products
left join  order_items
using (product_id)
left join  product_category_name_translation
using (product_category_name)
where order_id IS NULL;
/*═══════════════════════════════════════════════════════════════════════
 🏆 Q11 .
───────────────────────────────────────────────────────────────────────
 Find sellers who have fulfilled more orders than the average seller
 on the platform.
═══════════════════════════════════════════════════════════════════════*/
with t1 as(
select
  seller_id,
  count(distinct order_id)as total_order
from order_items
group by seller_id)
select 
    seller_id,
    total_order
from t1
where total_order>
(select avg(total_order)from t1);

/*═══════════════════════════════════════════════════════════════════════
 🌎 Q12 .
───────────────────────────────────────────────────────────────────────
 Find which Brazilian states have the highest average customer review
 score for orders delivered there.
═══════════════════════════════════════════════════════════════════════*/
select 
    customer_state, 
    avg(review_score) as avg_review_score
from customers
join 
orders 
using (customer_id)
join 
order_reviews 
using (order_id)
group by customer_state
order by avg_review_score desc;


 /*═══════════════════════════════════════════════════════════════════════
 📝 Q13 .
───────────────────────────────────────────────────────────────────────
 Identify customers who have placed orders but never left a review.
═══════════════════════════════════════════════════════════════════════*/
select distinct 
    customer_unique_id
from customers
join 
orders 
using (customer_id)
left join 
order_reviews 
using (order_id)
where review_id is null;

/*═══════════════════════════════════════════════════════════════════════
 📅 Q14.
───────────────────────────────────────────────────────────────────────
 Find the month with the highest number of orders placed across the
 entire platform.
═══════════════════════════════════════════════════════════════════════*/
select 
    monthname(order_purchase_timestamp) as months_order, 
    count(order_id) as total_orders
from orders
group by months_order
order by total_orders desc
limit 1;













   
  


















