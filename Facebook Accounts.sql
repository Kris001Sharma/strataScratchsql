with cte as(
select 
sum(case when status = 'open' then 1 end) as open_count
,sum(case when status = 'closed' then 1 end) as closed_count
from fb_account_status
where date = '2020-01-10'
)
select (cast(closed_count as Double precision)/ cast((open_count + closed_count) as Double precision)) * 100
from cte
