with cte as (
select proj.title, proj.budget, DATE_PART('day', proj.end_date::timestamp - proj.start_date::timestamp) as duration
, emp.salary
from linkedin_projects proj
inner join linkedin_emp_projects proj_emp on proj_emp.project_id = proj.id
inner join linkedin_employees emp on emp.id = proj_emp.emp_id
)
, cte2 as (
select title, budget, duration, (budget / duration) as budgetDay, sum(salary) / 365 as salaryDay
from cte
group by title, budget, duration
)
select title, budget, ceiling(salaryday * duration) as totalEmpExpense from cte2 
where budgetday < salaryday
order by title
