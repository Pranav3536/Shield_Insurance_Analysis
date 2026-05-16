-- =========================================
-- BASIC INSIGHTFUL SQL QUERIES
-- =========================================

-- 1. Total revenue generated from each city
SELECT 
    city,
    SUM(premium_amount) AS total_revenue
FROM fact_premiums fp
JOIN dim_customer dc
ON fp.customer_code = dc.customer_code
GROUP BY city
ORDER BY total_revenue DESC;


-- 2. Total revenue by sales mode
SELECT 
    sales_mode,
    SUM(premium_amount) AS total_revenue
FROM fact_premiums
GROUP BY sales_mode
ORDER BY total_revenue DESC;


-- 3. Total customers in each age group
SELECT 
    age_group,
    COUNT(customer_code) AS total_customers
FROM dim_customer
GROUP BY age_group
ORDER BY total_customers DESC;


-- 4. Top policies based on premium amount
SELECT 
    policy_id,
    SUM(premium_amount) AS total_premium
FROM fact_premiums
GROUP BY policy_id
ORDER BY total_premium DESC;


-- 5. Monthly premium collection
SELECT 
    month_name,
    SUM(premium_amount) AS total_collection
FROM fact_premiums fp
JOIN dim_date dd
ON fp.date = dd.date
GROUP BY month_name
ORDER BY total_collection DESC;


-- =========================================
-- JOIN QUERIES
-- =========================================

-- 6. Customer city and premium details
SELECT 
    dc.customer_code,
    dc.city,
    fp.premium_amount
FROM dim_customer dc
JOIN fact_premiums fp
ON dc.customer_code = fp.customer_code;


-- 7. Policy details with premium amount
SELECT 
    dp.policy_name,
    fp.premium_amount
FROM dim_policies dp
JOIN fact_premiums fp
ON dp.policy_id = fp.policy_id;


-- 8. Age group with settlement percentage
SELECT 
    dc.age_group,
    fs.settlement_percentage
FROM dim_customer dc
JOIN fact_settlements fs
ON dc.age_group = fs.age_group;


-- =========================================
-- ADVANCED QUERIES
-- =========================================

-- 9. Average premium amount by sales mode
SELECT 
    sales_mode,
    AVG(premium_amount) AS average_premium
FROM fact_premiums
GROUP BY sales_mode;


-- 10. Top 5 customers with highest premium amount
SELECT 
    customer_code,
    SUM(premium_amount) AS total_premium
FROM fact_premiums
GROUP BY customer_code
ORDER BY total_premium DESC
LIMIT 5;
