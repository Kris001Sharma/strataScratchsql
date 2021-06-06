with cte
as
(
select user_id, count(1) as count_comments from fb_users u
inner join fb_comments c on c.user_id = u.id
where u.joined_at >= '2018-01-01' and u.joined_at <= '2020-12-31'
and c.created_at >= '2020-01-01' and c.created_at < '2020-02-01'
and c.created_at >= u.joined_at
group by user_id
)
select count_comments, count(user_id) users_count
from cte
group by count_comments
order by count_comments
