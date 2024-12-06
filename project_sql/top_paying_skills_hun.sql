
SELECT 
     skills,
     ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM 
    job_postings_fact
    INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        (job_title_short LIKE '%Analyst%') AND
        (salary_year_avg IS NOT NULL) AND
        (job_country = 'Hungary')
    GROUP BY 
        skills
    ORDER BY
        avg_salary DESC
  ;

/*

Comparing the global data on the highest-paying Data Analyst skills with the Hungarian local job market salaries, here are some notable observations:

1. Cloud Technologies
Global: Skills like GCP (122,500), AWS (113,950), and Azure (155,000) are prominent and show high salaries in the global market.
Hungary: Local salaries for Azure, Snowflake, and GCP are higher than AWS in Hungary, with all three averaging 155,000, reflecting the value of cloud platforms in Hungary as well.
Observation: The Hungarian market shows a similar emphasis on cloud platforms, with competitive salaries, particularly for Azure, Snowflake, and GCP.
2. Big Data & Data Processing
Global: Databricks (141,907) and PySpark (208,172) feature prominently in the global market.
Hungary: Databricks (113,950) and Spark (72900) have a notable presence, but salaries are lower for these big data tools compared to the global market.
Observation: Big data skills in Hungary still have demand, but salaries are significantly lower compared to the global market. This could reflect the lower cost of living and different market demands.
3. Programming Languages
Global: High-paying programming languages include Python (151,821) and PySpark (208,172), both critical for Data Analysts.
Hungary: Python (96,575) and R (98,500) are important skills in Hungary, though the salaries are lower compared to the global market.
Observation: Python remains a high-demand skill in Hungary, but the salary for this skill is more than 30% lower than the global average.
4. Data Visualization & Business Intelligence Tools
Global: Power BI, Tableau, and other BI tools like Looker are valued highly, with Tableau reaching 99,819 globally.
Hungary: Tableau (99,819) appears as one of the higher-paying skills in Hungary, similar to the global trend, though Power BI is absent from the Hungarian list.
Observation: Business intelligence tools are still highly valued in Hungary, with Tableau ranking similarly to the global market.
5. Machine Learning & AI
Global: Tools like Watson (160,515), Datarobot (155,486), and scikit-learn (125,781) are high-paying, signaling the global trend toward machine learning expertise.
Hungary: Scikit-learn (72,900) and Hugging Face (72,900) appear in Hungary, but salaries are significantly lower, indicating less demand for AI skills compared to the global market.
Observation: The Hungarian market shows lower salaries for machine learning tools and AI frameworks, suggesting that the local demand for these specialized skills might not be as strong or the market is still developing.
6. SQL & Database Technologies
Global: PostgreSQL (123,879), SQL (varied between 80,000 - 150,000) are core skills.
Hungary: SQL (90,641), SQL Server (49,567), Oracle (56,700) are widely used, but with lower salaries, especially for SQL Server and Oracle.
Observation: SQL remains a fundamental skill in Hungary, though salaries for specific database technologies like SQL Server and Oracle are lower than in the global market.
7. General Business Tools (Excel, Word, PowerPoint)
Global: These tools are typically not seen as high-paying but are still required.
Hungary: Excel (83,035), Word (72,900), and PowerPoint (72,900) are listed as standard tools with moderate salaries.
Observation: The Hungarian job market places slightly more emphasis on these common business tools than the global market, though their salaries are lower in both regions.
Summary of Key Differences:
Higher Salaries in Hungary for Cloud Skills: Azure, Snowflake, and GCP all have a strong salary presence in Hungary, which matches global trends, with Azure and Snowflake being particularly high.
Lower Salaries for Big Data and Programming Languages: Databricks, PySpark, Python, and R are in demand but at much lower salary levels compared to the global market.
More Moderate Salaries in Machine Learning: AI-related tools like Scikit-learn and Hugging Face are much lower in Hungary.
SQL and BI Tools Are Consistent: SQL remains valuable, but salaries are generally lower than the global average. Tableau is also highly valued in both markets.
The Hungarian market shows lower overall salaries for advanced data analytics skills (e.g., machine learning, big data tools), while cloud computing platforms and business intelligence tools are more similarly valued across both markets.

*/