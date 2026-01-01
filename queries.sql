-- SQL FMCG Sales Analysis Queries

-- 1. Total Revenue by Product
SELECT
    product,
    SUM(revenue) AS total_revenue
FROM sales
GROUP BY product
ORDER BY total_revenue DESC;

-- 2. Monthly Sales Trend
SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(revenue) AS monthly_revenue
FROM sales
GROUP BY month
ORDER BY month;

-- 3. Top 5 Performing Regions by Revenue
SELECT
    region,
    SUM(revenue) AS total_revenue
FROM sales
GROUP BY region
ORDER BY total_revenue DESC
LIMIT 5;

-- 4. Bottom 5 Performing Regions by Revenue
SELECT
    region,
    SUM(revenue) AS total_revenue
FROM sales
GROUP BY region
ORDER BY total_revenue ASC
LIMIT 5;

-- 5. Category-wise Sales Contribution
SELECT
    category,
    SUM(revenue) AS category_revenue,
    ROUND(
        SUM(revenue) * 100.0 / SUM(SUM(revenue)) OVER (),
        2
    ) AS contribution_percentage
FROM sales
GROUP BY category
ORDER BY category_revenue DESC;

-- 6. Highest Value Customers
SELECT
    customer,
    SUM(revenue) AS total_spent
FROM sales
GROUP BY customer
ORDER BY total_spent DESC;

-- 7. Regional Performance by Category
SELECT
    region,
    category,
    SUM(revenue) AS total_revenue
FROM sales
GROUP BY region, category
ORDER BY region, total_revenue DESC;
