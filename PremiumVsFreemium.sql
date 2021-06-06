with cte
as(
select ad.paying_customer, 
 df.date, sum(df.downloads) as download
from ms_acc_dimension ad
inner join ms_user_dimension ud on ud.acc_id = ad.acc_id
left join ms_download_facts df on df.user_id = ud.user_id
group by ad.paying_customer, df.date
)
select y.date, n.download as non_paying, y.download as paying
from cte n
inner join cte y on y.date = n.date
where n.download > y.download and n.paying_customer = 'no' and y.paying_customer = 'yes'
order by y.date


