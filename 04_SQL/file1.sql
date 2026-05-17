
-- 1. Total Revenue Generated
SELECT 
    SUM(`final_premium_amt(INR)`) AS Total_Revenue_INR
FROM fact_premiums;


-- 2. Average Premium Amount
SELECT 
    ROUND(AVG(`final_premium_amt(INR)`), 2) AS Avg_Premium_Per_Policy
FROM fact_premiums;


-- 3. Premium Category Classification
SELECT 
    policy_id,
    `final_premium_amt(INR)`,
    CASE 
        WHEN `final_premium_amt(INR)` > 15000 THEN 'High Premium'
        ELSE 'Standard Premium'
    END AS Premium_Category
FROM fact_premiums
LIMIT 10;


-- 4. Policies Sold by Sales Mode
SELECT 
    `Mode: Online/Offline` AS Sales_Mode,
    COUNT(*) AS Total_Policies_Sold
FROM fact_premiums
GROUP BY `Mode: Online/Offline`
ORDER BY Total_Policies_Sold DESC;


-- 5. Customer Distribution by Age Group
SELECT 
    AgeGroup,
    COUNT(*) AS Customer_Count
FROM dim_customer
GROUP BY AgeGroup
ORDER BY Customer_Count DESC;
