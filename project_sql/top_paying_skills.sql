
SELECT 
     skills,
     ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM 
    job_postings_fact
    INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        (job_title_short = 'Data Analyst') AND
        (salary_year_avg IS NOT NULL) AND
        (job_work_from_home IS TRUE)
    GROUP BY 
        skills
    ORDER BY
        avg_salary DESC
    LIMIT
        25
  ;

/*

High demand for cloud and big data technologies:

Skills like Databricks (141,907), GCP (122,500), Kubernetes (132,500), and Linux (136,508) suggest a strong demand for cloud platforms and big data tools.
Programming languages:

High-paying programming languages such as Python (pandas) (151,821), PySpark (208,172), and Go (golang) (145,000) highlight their importance in data analysis and processing.
Machine learning & AI:

Tools related to machine learning and AI, like Watson (160,515), Databricks (141,907), scikit-learn (125,781), and Datarobot (155,486), indicate that machine learning and AI expertise is highly valued.
Version control and collaboration tools:

Bitbucket (189,155) and GitLab (154,500) suggest that skills in version control and collaboration platforms are in demand.
Data visualization & reporting tools:

MicroStrategy (121,619) shows the importance of advanced data visualization and reporting tools.
These trends reflect a strong emphasis on cloud computing, big data technologies, machine learning, and advanced data processing in the high-paying Data Analyst roles.
*/