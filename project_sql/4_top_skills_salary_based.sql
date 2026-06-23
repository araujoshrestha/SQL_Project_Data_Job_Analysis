SELECT skills, round(avg(salary_year_avg), 0) as avg_salary
from job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where 
    job_title_short = 'Data Analyst' 
    and salary_year_avg is not null 
    and job_work_from_home = true
group by skills
order by avg_salary DESC
limit 25

/*
💰 Highest pay = Data Analyst + Data Engineering + Cloud
Tools like PySpark, Databricks, Kubernetes, GCP show that top salaries go to analysts who can handle big data and cloud systems—not just dashboards.
🧠 Core tools (Python, pandas, Jupyter) are baseline—not differentiators
They’re required, but they don’t drive top salaries by themselves; they need to be combined with advanced tools.
🚀 Salary growth comes from specialization
Adding Airflow, Spark, cloud platforms, and DevOps tools is what moves you from mid-level (~$120K) to high-level ($150K–$200K+).
*/
