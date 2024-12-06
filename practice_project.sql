SELECT
    job_title,
    ROUND(AVG(salary_year_avg), 0) as avg_salary,
    AVG(salary_hour_avg) as avg_h_salary,
    job_schedule_type,
    --job_title_short AS title,
    --job_location AS location,
    --job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date,
    EXTRACT(MONTH FROM job_posted_date) AS date_month
FROM   
    job_postings_fact

GROUP BY 
    job_title,
    job_schedule_type,
    EXTRACT(MONTH FROM job_posted_date)
HAVING 
    EXTRACT(MONTH FROM job_posted_date) > 5 AND
    ROUND(AVG(salary_year_avg), 0) IS NOT NULL AND
    AVG(salary_hour_avg) IS NOT NULL
ORDER BY
    avg_h_salary;
