
SELECT 
     job_id,
     job_title,
     job_title_short,
     company_dim.name as company_name,
     job_schedule_type,
     salary_year_avg
     --job_posted_date
     
FROM 
    job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    (job_title_short LIKE ('Data Analyst')) AND
    (salary_year_avg IS NOT NULL) AND
    job_work_from_home IS TRUE
ORDER BY
    salary_year_avg DESC
LIMIT 
    10