
SELECT 
     --top_paying_jobs.job_id,
   --  top_paying_jobs.job_title_short,
    -- top_paying_jobs.salary_year_avg,
     COUNT(*) as nr_job_demanding_skills,
     skills_dim.skills,
     AVG(top_paying_jobs.salary_year_avg)
FROM 
    (
    SELECT 
        job_id,
        job_title_short,
        company_dim.name as company_name,
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
        10) AS top_paying_jobs
    LEFT JOIN skills_job_dim on top_paying_jobs.job_id = skills_job_dim.job_id
    LEFT JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    skills_dim.skills IS NOT NULL
GROUP BY 
    skills_dim.skills
ORDER BY
    AVG(top_paying_jobs.salary_year_avg) DESC;


/*
SELECT 
     job_id,
     job_title_short,
     company_dim.name as company_name,
     salary_year_avg,
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
    */


