with cte
as(
select  df.date,
sum(case when ad.paying_customer = 'yes' then df.downloads end) as paying_downloads,
sum(case when ad.paying_customer = 'no' then df.downloads end) as non_paying_downloads
from ms_acc_dimension ad
inner join ms_user_dimension ud on ud.acc_id = ad.acc_id
left join ms_download_facts df on df.user_id = ud.user_id
group by df.date
)
select date, non_paying_downloads, paying_downloads
from cte n
where non_paying_downloads > paying_downloads
order by date


