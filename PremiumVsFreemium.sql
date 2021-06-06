with cte
as(
select ad.paying_customer, 
 df.date, sum(df.downloads) as download
from ms_acc_dimension ad
inner join ms_user_dimension ud on ud.acc_id = ad.acc_id
left join ms_download_facts df on df.user_id = ud.user_id
group by ad.paying_customer, df.date
--order by  df.date
),
cteNo as(
select date, download
from cte
where paying_customer = 'no'
),
cteYes as(
select date, download
from cte
where paying_customer = 'yes'
)
select y.date, n.download as non_paying, y.download as paying
from cteNo n
inner join cteYes y on y.date = n.date
where n.download > y.download
order by y.date


