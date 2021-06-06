with cte as (
select e.salary, d.name, d.department_id
,row_number() over(partition by d.department_id order by e.salary desc) as rn
from ms_employee e
inner join ms_department d on d.department_id = e.department_id
),
cteCount as (
select name, max(rn) as empCount, count(1) as overHCount
from cte 
where rn > 9 and salary > 100000
group by name
)

select name, (cast(overHCount AS DOUBLE PRECISION) / cast(empCount AS DOUBLE PRECISION) * 100) as percent
from cteCount
order by percent desc
limit 3
