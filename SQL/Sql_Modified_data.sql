CREATE DATABASE ai_job_market;
USE ai_job_market;
CREATE TABLE job_market (
    Job_ID VARCHAR(50),
    Job_Title VARCHAR(100),
    Company_Size VARCHAR(50),
    Industry VARCHAR(100),
    Country VARCHAR(100),
    Location VARCHAR(100),
    Experience_Level VARCHAR(50),
    Employment_Type VARCHAR(50),
    Work_Mode VARCHAR(50),
    Education VARCHAR(100),

    Salary_Min DECIMAL(12,2),
    Salary_Max DECIMAL(12,2),
    Years_Experience INT,

    Python VARCHAR(10),
    SQL_Skill VARCHAR(10),
    Power_BI VARCHAR(10),
    Excel VARCHAR(10),
    Tableau VARCHAR(10),
    Machine_Learning VARCHAR(10),
    Deep_Learning VARCHAR(10),
    TensorFlow VARCHAR(10),
    PyTorch VARCHAR(10),
    AWS VARCHAR(10),
    Azure VARCHAR(10),
    GCP VARCHAR(10),
    Statistics VARCHAR(10),
    NLP VARCHAR(10),
    Generative_AI VARCHAR(10),

    Posted_Date DATE,

    Average_Salary DECIMAL(12,2),
    Skill_Count INT,

    PRIMARY KEY (Job_ID)
);
ALTER TABLE job_market
ADD COLUMN Company VARCHAR(100) AFTER Job_Title;


DESCRIBE job_market;

USE ai_job_market;

ALTER TABLE job_market
ADD COLUMN Salary_Currency VARCHAR(20);

ALTER TABLE job_market
ADD COLUMN Job_Description VARCHAR(500);

DESCRIBE job_market;

USE ai_job_market;

ALTER TABLE job_market
ADD COLUMN Salary_Currency VARCHAR(20);

DESCRIBE job_market;


USE ai_job_market;

SELECT COUNT(*) AS total_jobs
FROM job_market;

SELECT *  -- Used to print the top 10 lines
FROM job_market
LIMIT 10;

USE ai_job_market;    -- Most demanded job roles.
SELECT 
    Job_Title,
    COUNT(*) AS Job_Count
FROM job_market
GROUP BY Job_Title
ORDER BY Job_Count DESC;   -- Most demanded job roles.

SELECT                     -- Top Highring Locations
    Location,				-- Answers:"Which locations have the highest demand for AI/Data professionals?"
    COUNT(*) AS Job_Count
FROM job_market
GROUP BY Location
ORDER BY Job_Count DESC;


SELECT 							-- Companies hiring the most
    Company,					-- THIS WILL GIVE TOP 10 HIGHRING COMPANIES
    COUNT(*) AS Job_Count
FROM job_market
GROUP BY Company
ORDER BY Job_Count DESC
LIMIT 10;



SELECT 							-- Average salary by job role
    Job_Title,					-- Answers:"Which AI/Data roles offer the highest average salary?"
    ROUND(AVG(Average_Salary), 2) AS Avg_Salary
FROM job_market
GROUP BY Job_Title
ORDER BY Avg_Salary DESC;


SELECT 							-- EXPERIENCE VS SALARY	
    Experience_Level,			-- It connects experience with compensation.
    COUNT(*) AS Job_Count,
    ROUND(AVG(Average_Salary), 2) AS Avg_Salary
FROM job_market
GROUP BY Experience_Level
ORDER BY Avg_Salary DESC;


SELECT							-- Employment Type Analysis
    Employment_Type,			-- Business question:What type of employment dominates the AI/Data job market?
    COUNT(*) AS Job_Count,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM job_market),
        2
    ) AS Percentage
FROM job_market
GROUP BY Employment_Type
ORDER BY Job_Count DESC;


             
SELECT							-- Work Mode Analysis
    Work_Mode,					-- This will tell job type Remote, Hybrid,On-site
    COUNT(*) AS Job_Count,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM job_market),
        2
    ) AS Percentage
FROM job_market
GROUP BY Work_Mode
ORDER BY Job_Count DESC;


															
SELECT 'Python' AS Skill, COUNT(*) AS Job_Count				-- TOP AI/Data Skills
FROM job_market
WHERE Python = 'Yes'

UNION ALL

SELECT 'SQL', COUNT(*)
FROM job_market
WHERE SQL_Skill = 'Yes'

UNION ALL

SELECT 'Power BI', COUNT(*)
FROM job_market
WHERE Power_BI = 'Yes'

UNION ALL

SELECT 'Excel', COUNT(*)
FROM job_market
WHERE Excel = 'Yes'

UNION ALL

SELECT 'Tableau', COUNT(*)
FROM job_market
WHERE Tableau = 'Yes'

UNION ALL

SELECT 'Machine Learning', COUNT(*)
FROM job_market
WHERE Machine_Learning = 'Yes'

UNION ALL

SELECT 'Deep Learning', COUNT(*)
FROM job_market
WHERE Deep_Learning = 'Yes'

UNION ALL

SELECT 'TensorFlow', COUNT(*)
FROM job_market
WHERE TensorFlow = 'Yes'

UNION ALL

SELECT 'PyTorch', COUNT(*)
FROM job_market
WHERE PyTorch = 'Yes'

UNION ALL

SELECT 'AWS', COUNT(*)
FROM job_market
WHERE AWS = 'Yes'

UNION ALL

SELECT 'Azure', COUNT(*)
FROM job_market
WHERE Azure = 'Yes'

UNION ALL

SELECT 'GCP', COUNT(*)
FROM job_market
WHERE GCP = 'Yes'

UNION ALL

SELECT 'Statistics', COUNT(*)
FROM job_market
WHERE Statistics = 'Yes'

UNION ALL

SELECT 'NLP', COUNT(*)
FROM job_market
WHERE NLP = 'Yes'

UNION ALL

SELECT 'Generative AI', COUNT(*)
FROM job_market
WHERE Generative_AI = 'Yes'

ORDER BY Job_Count DESC;



SELECT								-- Company Size vs Salary
    Company_Size,					-- This answers:Do larger companies offer higher salaries?
    COUNT(*) AS Job_Count,
    ROUND(AVG(Average_Salary), 2) AS Avg_Salary
FROM job_market
GROUP BY Company_Size
ORDER BY Avg_Salary DESC;


SELECT								-- Education Requirement vs Salary
    Education,						-- This gives you another useful business insight:How does education level relate to AI/Data salaries?
    COUNT(*) AS Job_Count,
    ROUND(AVG(Average_Salary), 2) AS Avg_Salary
FROM job_market
GROUP BY Education
ORDER BY Avg_Salary DESC;


                              