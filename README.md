# AMAZON_BRAZIL-Olist-Brazilian-E-Commerce-Analysis
This project leverages MySQL to perform a deep-dive Exploratory Data Analysis (EDA) on the Olist Brazilian E-Commerce dataset. By querying thousands of orders, products, and customer reviews across 11 normalized tables, this repository translates raw database records into strategic business intelligence. 
# 🛒 Amazon Brazil E-commerce SQL Portfolio

A collection of SQL case studies performed on the **Brazilian E-commerce Public Dataset by Olist**. This project demonstrates SQL skills including joins, aggregation, window functions, Common Table Expressions (CTEs), subqueries, and business insights.

---

## 📌 Project Overview

This project analyzes the Amazon Brazil (Olist) dataset to answer real-world business questions related to:

- Sales Analysis
- Customer Behavior
- Seller Performance
- Product Performance
- Payment Analysis
- Customer Reviews
- Delivery Performance

The objective is to demonstrate practical SQL skills that are commonly required in Data Analyst and Business Intelligence roles.

---

## 🗂 Dataset

**Dataset:** Olist Brazilian E-commerce Dataset

Tables Used:

- customers
- orders
- order_items
- order_payments
- order_reviews
- products
- product_category_name_translation
- sellers

---

## 🛠 SQL Concepts Used

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- INNER JOIN
- LEFT JOIN
- USING
- Aggregate Functions
- Window Functions
- Common Table Expressions (CTEs)
- Subqueries
- ROW_NUMBER()
- COUNT()
- SUM()
- AVG()
- DATEDIFF()
- LIMIT

---

# 📊 SQL Case Studies

## Q1
Find the total number of orders fulfilled by each seller state.

**Concepts Used**

- JOIN
- GROUP BY
- COUNT(DISTINCT)

---

## Q2
Calculate cumulative revenue generated for each product category over time.

**Concepts Used**

- Window Functions
- SUM() OVER()
- PARTITION BY
- ORDER BY

---

## Q3
Identify the most frequently used payment method and calculate the average payment value for each payment type.

**Concepts Used**

- GROUP BY
- COUNT()
- AVG()

---

## Q4
Find the customers who spent the most money across all orders.

**Concepts Used**

- Multiple JOINs
- SUM()
- ORDER BY
- LIMIT

---

## Q5
Calculate the average customer review score for each product category.

**Concepts Used**

- Multiple JOINs
- AVG()
- GROUP BY

---

## Q6
Find the total number of orders placed by each customer grouped by their state.

**Concepts Used**

- JOIN
- COUNT()
- GROUP BY

---

## Q7
Identify sellers who registered but never fulfilled a single order.

**Concepts Used**

- LEFT JOIN
- NULL Filtering

---

## Q8
Find the Top 5 product categories based on total revenue.

**Concepts Used**

- SUM()
- GROUP BY
- ORDER BY
- LIMIT

---

## Q9
Calculate the median delivery time between purchase and delivery.

**Concepts Used**

- CTE
- ROW_NUMBER()
- Window Functions
- DATEDIFF()

---

## Q10
Find products that have never been ordered.

**Concepts Used**

- LEFT JOIN
- NULL Filtering

---

## Q11
Identify sellers who fulfilled more orders than the average seller.

**Concepts Used**

- CTE
- Aggregate Functions
- Subqueries

---

## Q12
Determine which Brazilian states have the highest average customer review score.

**Concepts Used**

- AVG()
- Multiple JOINs
- ORDER BY

---

## Q13
Find customers who placed orders but never submitted a review.

**Concepts Used**

- LEFT JOIN
- DISTINCT
- NULL Filtering

---

## Q14
Find the month with the highest number of orders.

**Concepts Used**

- MONTHNAME()
- COUNT()
- GROUP BY

---

# 📈 Business Insights

- São Paulo (SP) has the highest seller activity.
- Credit Card is the most preferred payment method.
- A few customers contribute significantly to total revenue.
- Some registered sellers have never fulfilled an order.
- Several products have never been purchased.
- Customer review scores vary across different states.
- Monthly order trends reveal seasonal sales patterns.

---

# 💻 Technologies Used

- MySQL 8.0
- MySQL Workbench
- SQL
- Git
- GitHub

---

# 📂 Project Structure

```
Amazon-Brazil-SQL-Portfolio/
│
├── SQL Queries.sql
├── README.md
├── Portfolio Presentation.pptx

---

# 🎯 Skills Demonstrated

- Data Cleaning
- SQL Query Writing
- Business Analysis
- Window Functions
- Analytical Thinking
- Relational Database Concepts
- Query Optimization
- Reporting

---

# 👨‍💻 Author

**SUDIKSHA SINGHVI**



---

## ⭐ If you found this project helpful, don't forget to Star the repository!
