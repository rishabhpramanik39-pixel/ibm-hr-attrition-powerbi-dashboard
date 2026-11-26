use nexus1;

SELECT COUNT(*) AS total_employees,
SUM(CASE
WHEN Attrition ="Yes" THEN 1
ELSE 0
END) AS employees_left,
SUM(CASE
WHEN Attrition ="NO" THEN 1
ELSE 0
END) AS employees_retined,
ROUND(
100.0 * SUM(CASE
WHEN Attrition ="Yes" THEN 1
ELSE 0
END)/COUNT(*),2
) AS attrition_rate_pct,
ROUND(AVG(Age), 1) AS average_age,
ROUND(AVG(MonthlyIncome), 2) AS avg_monthly_income,
ROUND(AVG(YearsAtCompany), 2) AS avg_yrs_at_company
FROM hr2;

SELECT 
Department,
COUNT(*) AS total_employees,
SUM(CASE 
WHEN Attrition = "Yes" THEN 1
ELSE 0
END) AS employees_left,
ROUND(100.0 * SUM(CASE
WHEN Attrition ="YES" THEN 1
ELSE 0
END)/COUNT(*),2
)AS attrition_rate_pct
FROM hr2
group by Department
order by attrition_rate_pct DESC;

SELECT
JobRole,
COUNT(*) AS total_employees,
SUM(CASE
WHEN Attrition = 'Yes' THEN 1
ELSE 0
END) AS employees_left,
ROUND(
100.0 * SUM(CASE
WHEN Attrition = 'Yes' THEN 1
ELSE 0
END) / COUNT(*), 2
) AS attrition_rate_pct
FROM hr2
GROUP BY JobRole
ORDER BY attrition_rate_pct DESC;

SELECT
Overtime,
COUNT(*) AS total_employees,
SUM(CASE
WHEN Attrition = 'Yes' THEN 1
ELSE 0
END) AS employees_left,
ROUND(
100.0 * SUM(CASE
WHEN Attrition = 'Yes' THEN 1
ELSE 0
END) / COUNT(*), 2
) AS attrition_rate_pct
FROM hr2
GROUP BY Overtime
ORDER BY attrition_rate_pct DESC;

SELECT
CASE
WHEN Age < 25 THEN 'Under 25'
WHEN Age BETWEEN 25 AND 34 THEN '25-34'
WHEN Age BETWEEN 35 AND 44 THEN '35-44'
WHEN Age BETWEEN 45 AND 54 THEN '45-54'
ELSE '55+'
END AS age_group,
COUNT(*) AS total_employees,
SUM(CASE
WHEN Attrition ='YES' THEN 1
ELSE 0
END) AS employees_left,
ROUND(100.0 * SUM(CASE
WHEN Attrition ='YES'THEN 1 
ELSE 0
END)/ COUNT(*) ,2
)AS attrition_rate_pct
FROM hr2
GROUP BY age_group
Order by MIN(age);


SELECT
CASE
WHEN MonthlyIncome <3000 THEN 'Under 3000'
WHEN MonthlyIncome <5000 THEN '3000-4999'
WHEN MonthlyIncome <8000 THEN '5000-7999'
ELSE '8000+'
END AS income_band,
COUNT(*) AS total_employees,
SUM(Case
WHEN Attrition ='YES' THEN 1
ELSE 0
END) AS employee_left,
ROUND(AVG(MonthlyIncome), 2) as avg_monthly_income,
ROUND(100.0 * SUM(CASE
WHEN Attrition ='YES' THEN 1
ELSE 0
END)/ COUNT(*),2
) AS attrition_rate_pct
FROM hr2
GROUP BY income_band
ORDER BY MIN(MonthlyIncome);

SELECT 
JobSatisfaction,
COUNT(*) AS total_employees,
 SUM(CASE
 WHEN Attrition ='YES' THEN 1
 ELSE 0
 END) AS employees_left,
 ROUND(
 100.0 * SUM(CASE
 WHEN Attrition ='YES' THEN 1
 ELSE 0
 END)/COUNT(*), 2
 ) AS attrition_rate_pct
 FROM HR2
 GROUP BY JobSatisfaction
 ORDER BY JobSatisfaction;

SELECT
CASE
WHEN YearsATCompany <2 THEN 'Under 2 years'
WHEN YearsATCompany BETWEEN 2 AND 5 THEN '2-5 years'
WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '6-10 years'
ELSE 'Over 10 Yrs'
END AS tenure_group,
COUNT(*) AS total_employees,
SUM(CASE
WHEN Attrition ='YES' then 1
ELSE 0
END) AS employees_left,
ROUND(
100.0 * SUM(CASE
WHEN Attrition ='YES'THEN 1
ELSE 0
END)/COUNT(*),2
) AS attrition_rate_pct
FROM hr2
GROUP BY tenure_group
order by MIN(YearsATCompany);

SELECT
BusinessTravel,
COUNT(*) AS total_employees,
SUM(CASE
WHEN Attrition = 'Yes' THEN 1
ELSE 0
END) AS employees_left,
ROUND(
100.0 * SUM(CASE
WHEN Attrition = 'Yes' THEN 1
ELSE 0
END) / COUNT(*), 2
) AS attrition_rate_pct
FROM hr2
GROUP BY BusinessTravel
ORDER BY attrition_rate_pct DESC;

SELECT
StockOptionLevel,
COUNT(*) AS total_employees,
SUM(CASE
WHEN Attrition = 'Yes' THEN 1
ELSE 0
END) AS employees_left,
ROUND(
100.0 * SUM(CASE
WHEN Attrition = 'Yes' THEN 1
ELSE 0
END) / COUNT(*), 2
) AS attrition_rate_pct
FROM hr2
GROUP BY StockOptionLevel
ORDER BY attrition_rate_pct DESC;

SELECT
MaritalStatus,
COUNT(*) AS total_employees,
SUM(CASE
WHEN Attrition = 'Yes' THEN 1
ELSE 0
END) AS employees_left,
ROUND(
100.0 * SUM(CASE
WHEN Attrition = 'Yes' THEN 1
ELSE 0
END) / COUNT(*), 2
) AS attrition_rate_pct
FROM hr2
GROUP BY MaritalStatus
ORDER BY attrition_rate_pct DESC;

SELECT
CASE
WHEN YearsSinceLastPromotion =0 THEN 'Promoted in current'
WHEN YearsSinceLastPromotion BETWEEN 1 AND 2 THEN '1-2 Years'
WHEN YearsSinceLastPromotion BETWEEN 3 AND 5 THEN '3-5 Years'
ELSE 'Over 5 Yrs'
END AS promotion_gap,
COUNT(*) AS total_employees,
SUM(CASE
WHEN Attrition ='YES' then 1
ELSE 0
END) AS employees_left,
ROUND(
100.0 * SUM(CASE
WHEN Attrition ='YES'THEN 1
ELSE 0
END)/COUNT(*),2
) AS attrition_rate_pct
FROM hr2
GROUP BY promotion_gap
order by MIN(YearsSinceLastPromotion);


SELECT
Department,
CASE
WHEN MonthlyIncome < 2000 THEN 'Below 2000'
WhEN MonthlyIncome BETWEEN 2000 AND 4000 THEN '2000-4000'
WHEN MonthlyIncome BETWEEN 4001 AND 6000 THEN '4001-6000'
WHEN MonthlyIncome BETWEEN 6001 AND 8000 THEN '6001-8000'
ELSE 'Above 8000'
END AS salary_slab,
COUNT(*) AS total_employees,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
ROUND(
100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
/ COUNT(*), 2
) AS attrition_rate
FROM hr2
GROUP BY Department, salary_slab
ORDER BY Department, attrition_rate DESC;


SELECT
Education,
COUNT(*) AS total_employees,
SUM(CASE
WHEN Attrition = 'Yes' THEN 1
ELSE 0
END) AS employees_left,
ROUND(
100.0 * SUM(CASE
WHEN Attrition = 'Yes' THEN 1
ELSE 0
END) / COUNT(*),2
) AS attrition_rate_pct
FROM hr2
GROUP BY education
ORDER BY attrition_rate_pct DESC;