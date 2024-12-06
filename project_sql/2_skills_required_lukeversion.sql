WITH top_paying_jobs AS (
    SELECT 
        job_id,
        job_title,
        name as company_name,
        salary_year_avg
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
        10)

SELECT 
    top_paying_jobs.*,
    skills
FROM 
    top_paying_jobs
    LEFT JOIN skills_job_dim on top_paying_jobs.job_id = skills_job_dim.job_id
    LEFT JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    skills_dim.skills IS NOT NULL
ORDER BY   
    salary_year_avg DESC