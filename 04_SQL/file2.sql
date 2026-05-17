
-- 6. Top 3 Best-Selling Policies
SELECT 
    policy_id,
    COUNT(*) AS Total_Units_Sold
FROM fact_premiums
GROUP BY policy_id
ORDER BY Total_Units_Sold DESC
LIMIT 3;


-- 7. Average Revenue by Sales Medium
SELECT 
    `Mode:Through Mediun` AS Sales_Medium,
    ROUND(AVG(`final_premium_amt(INR)`), 2) AS Avg_Revenue_Per_Sale
FROM fact_premiums
GROUP BY `Mode:Through Mediun`
ORDER BY Avg_Revenue_Per_Sale DESC;


-- 8. Cities with More Than 500 Customers
SELECT 
    city,
    COUNT(*) AS Total_Customers
FROM dim_customer
GROUP BY city
HAVING COUNT(*) > 500
ORDER BY Total_Customers DESC;


-- 9. City-Wise Revenue Analysis
SELECT 
    c.city,
    SUM(p.`final_premium_amt(INR)`) AS Total_Revenue
FROM fact_premiums p
JOIN dim_customer c
ON p.customer_code = c.customer_code
GROUP BY c.city
ORDER BY Total_Revenue DESC;


-- 10. Monthly Sales Performance
SELECT 
    d.mmm_yy AS Month_Year,
    COUNT(p.customer_code) AS Policies_Sold,
    SUM(p.`final_premium_amt(INR)`) AS Monthly_Revenue
FROM fact_premiums p
JOIN dim_date d
ON p.date = d.date
GROUP BY d.mmm_yy
ORDER BY Monthly_Revenue DESC;
