with cte as(
select *, row_number() over(order by msg desc) as rn
from (
select user1 as name, sum(msg_count) as msg 
from fb_messages
group by user1
union all
select user2 as name, sum(msg_count) as msg 
from fb_messages
group by user2
)x
)
select * from cte where rn < 11
