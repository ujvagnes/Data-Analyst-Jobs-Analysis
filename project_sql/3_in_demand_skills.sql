SELECT
    skills,
    count(*) as demand_count
FROM
    skills_dim
    LEFT JOIN  skills_job_dim ON skills_dim.skill_id = skills_job_dim.skill_id 
    LEFT JOIN  job_postings_fact ON skills_job_dim.job_id = job_postings_fact.job_id 
WHERE
    job_postings_fact.job_title_short = 'Data Analyst' AND
    job_postings_fact.job_work_from_home = true
GROUP BY
    skills_dim.skills,
    job_postings_fact.job_work_from_home
ORDER BY
    demand_count DESC
LIMIT 
    5
