/* count of the number of remote job postings per skill 
    - display top 5 skills by their demand in remote jobs
    - include skill id, name, count of postings requiring the skill */

/*

1. Total number of job postings / company (job_posting_fact)
2. Return the total number of jobs with the company name (company_dim)


Final project:

size category - s, m, l - number of job postings
*/


SELECT
skills_dim.skills,
count(*) as skill_count,
job_postings_fact.job_work_from_home
FROM
skills_dim
LEFT JOIN  skills_job_dim ON skills_dim.skill_id = skills_job_dim.skill_id 
LEFT JOIN  job_postings_fact ON skills_job_dim.job_id = job_postings_fact.job_id 
WHERE
    job_postings_fact.job_title_short = 'Data Analyst'
GROUP BY
    skills_dim.skills,
    job_postings_fact.job_work_from_home
HAVING
    job_postings_fact.job_work_from_home = true
ORDER BY
    count(job_postings_fact.job_work_from_home) desc
LIMIT 
    5

/*

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

*/