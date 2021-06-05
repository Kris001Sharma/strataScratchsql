select (
(select Max(e.salary)
from db_employee e
inner join db_dept d on e.department_id = d.Id
where d.department in ('marketing')
group by d.department)
-
(select Max(e.salary)
from db_employee e
inner join db_dept d on e.department_id = d.Id
where d.department in ('engineering')
group by d.department)
) as salary_difference
