-- =========================
-- HR ATTRITION | SETUP FILE
-- =========================

-- 1. Raw table (already loaded via CSV)
-- (for reference)

-- 2. Clean analysis table
DROP TABLE IF EXISTS hr_attrition;

CREATE TABLE hr_attrition AS
SELECT
    *,
    CASE 
        WHEN attrition = 'Yes' THEN 1 
        ELSE 0 
    END AS attrition_flag
FROM hr_attrition_raw;

-- 3. Basic validation
SELECT 
    COUNT(*) AS total_rows,
    SUM(attrition_flag) AS attrition_count
FROM hr_attrition;
