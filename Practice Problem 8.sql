/*

Job postings from 
- the 1st quarter
- that have a salary greater than $70K.

*/

SELECT 
    job_title_short,
    job_location,
    company.name AS company_name,
    ROUND((salary_year_avg / 12), 0) AS salary_month_avg_$
    FROM job_postings_fact AS job_postings
    LEFT JOIN company_dim AS company ON company.company_id = job_postings.company_id
    WHERE 
    (EXTRACT(MONTH FROM job_posted_date) BETWEEN 1 AND 3) AND
    (salary_year_avg IS NOT NULL) AND
    (salary_year_avg > 70000) AND
    job_title_short = 'Data Analyst'
    ORDER BY 
    salary_month_avg_$ DESC
    ;



