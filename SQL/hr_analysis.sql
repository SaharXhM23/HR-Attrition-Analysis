-- =============================
-- HR ATTRITION | ANALYSIS FILE
-- =============================

-- 1. Overall attrition rate
SELECT 
  ROUND(AVG(attrition_flag)::numeric * 100, 2) AS attrition_rate_pct
FROM hr_attrition;

-- 2. Attrition by department
SELECT
  department,
  COUNT(*) AS total_employees,
  SUM(attrition_flag) AS attrition_count,
  ROUND(AVG(attrition_flag)::numeric * 100, 2) AS attrition_rate_pct
FROM hr_attrition
GROUP BY department
ORDER BY attrition_rate_pct DESC;

-- 3. Attrition by job role
SELECT
  job_role,
  COUNT(*) AS total_employees,
  ROUND(AVG(attrition_flag)::numeric * 100, 2) AS attrition_rate_pct
FROM hr_attrition
GROUP BY job_role
ORDER BY attrition_rate_pct DESC;

-- 4. Overtime impact
SELECT
  overtime,
  ROUND(AVG(attrition_flag)::numeric * 100, 2) AS attrition_rate_pct
FROM hr_attrition
GROUP BY overtime;

-- 5. Salary vs attrition
SELECT
  CASE 
    WHEN monthly_income < 3000 THEN 'Low Income'
    WHEN monthly_income BETWEEN 3000 AND 7000 THEN 'Mid Income'
    ELSE 'High Income'
  END AS income_band,
  ROUND(AVG(attrition_flag)::numeric * 100, 2) AS attrition_rate_pct
FROM hr_attrition
GROUP BY income_band
ORDER BY attrition_rate_pct DESC;
