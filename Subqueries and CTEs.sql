-- SUBQUERY 
/*
SELECT 
    company_id,
    name AS company_name
FROM company_dim
where company_id IN (
    SELECT 
        company_id
    FROM    
        job_postings_fact
    WHERE
        job_no_degree_mention = TRUE
)
*/

-- CTE: using WITH ... AS () ... 

/*

1. Total number of job postings / company (job_posting_fact)
2. Return the total number of jobs with the company name (company_dim)


Final project:

size category - s, m, l - number of job postings
*/

WITH company_job_count AS (
SELECT
company_id,
COUNT(*) as total_jobs
FROM
job_postings_fact
GROUP BY
    company_id)


SELECT 
    subquery.company_name,
    subquery.total_jobs,
    CASE
        WHEN total_jobs BETWEEN 0 AND 9 THEN 'Small'
        WHEN total_jobs BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Large'
    END AS company_size
FROM (
SELECT 
    company_dim.name as company_name,
    company_job_count.total_jobs
FROM 
    company_dim
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id) AS subquery;



/*


SELECT
    company_size 
FROM job_postings_fact
WHERE COUNT(job_id) IN (
    COUNT(job_id), 
    CASE
        WHEN COUNT(job_id) BETWEEN 0 AND 9 THEN 'Small'
        WHEN COUNT(job_id) BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Large'
    END AS company_size
FROM job_postings_fact) */




--GROUP BY 
--    company_size;