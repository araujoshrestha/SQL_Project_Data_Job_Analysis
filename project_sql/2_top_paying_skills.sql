-- What skills are required for the top-paying roles?


with top_paying_jobs as (
    SELECT
    job_id,
    job_title,
    salary_year_avg,
    name as company_name
FROM job_postings_fact
left join company_dim on job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND 
    salary_year_avg is not null 
order by salary_year_avg DESC
limit 10
)

SELECT DISTINCT top_paying_jobs.*, skills
from top_paying_jobs
inner join skills_job_dim on top_paying_jobs.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
order by salary_year_avg DESC

/* 
🔎 1. Most In-Demand Skills (Frequency)

From your dataset, these skills show up the most:

🥇 Core Skills (appear in almost every job)
SQL → 🔥 MOST important
Python
Tableau

👉 Translation:
If you don’t have these 3, you’re not competitive for high-paying roles.

🥈 Very High Demand
R
Excel
Pandas (Python library)

👉 These are extremely common but slightly less universal than SQL/Python.

🥉 High-Value (but more specialized)
Power BI
Snowflake
AWS / Azure
Databricks

👉 These show up more in higher salary / senior roles.

🧠 Engineering / Advanced Stack
PySpark
Hadoop
Git / GitLab
Jupyter

👉 These lean toward:

Data Engineering
Advanced analytics roles
🏢 Business / Collaboration Tools
PowerPoint
Atlassian (Jira, Confluence, Bitbucket)

👉 These matter more than people think—especially for senior roles.

💰 2. Skills vs Salary Insight
🚀 Highest salary job (~$255K)

Skills include:

Cloud: AWS, Azure
Big Data: Databricks, PySpark
Programming: Python, R
BI: Tableau, Power BI
Core: SQL, Excel

👉 Insight:

The highest-paying roles require a combination of EVERYTHING:

Data analysis
Data engineering
Cloud
📊 Mid-high salaries (~$180K–$205K)

Common stack:

Python + SQL + Tableau
Snowflake
Pandas / NumPy

👉 Insight:

These are Senior Data Analyst / Principal roles

📉 Lower (still high) salaries (~$180K)

Simpler stack:

Python
R
SQL

👉 Insight:

You can still reach high pay with just core analytics skills, but growth caps earlier.

🧩 3. Skill Clusters (What goes together)
📊 Classic Data Analyst Stack
SQL
Excel
Tableau / Power BI

👉 Entry-level friendly

🐍 Data Analyst + Programming
Python
Pandas / NumPy
SQL

👉 This is where salaries jump

☁️ Modern Data Stack (High-paying)
Snowflake
AWS / Azure
Databricks
PySpark

👉 This is top-tier salary territory

🎯 4. What THIS Means for You (Very Important)

Based on your background (Python, SQL, Power BI already in progress):

✅ You’re already on the right track

But to maximize salary potential, your next moves should be:

🚀 Priority Roadmap
Step 1 (Must-have)
SQL (advanced: joins, CTEs, window functions)
Python (pandas, data cleaning)
Power BI or Tableau
Step 2 (To stand out)
Snowflake
Excel (advanced)
Git
Step 3 (High salary unlock)
AWS or Azure
Databricks OR PySpark
⚠️ 5. Reality Check

Most jobs in your dataset are:

Senior / Director level
Not entry-level

👉 That’s why salaries are so high.

So your goal:

Build toward this stack over time, not all at once.

🧠 Final Insight (Most Important)

The real pattern isn’t just “which skills”

It’s this:

💡 The higher the salary → the more your role blends:

Data Analysis
Data Engineering
Cloud
*/ 