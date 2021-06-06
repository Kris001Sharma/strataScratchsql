with cte as(
select count(result_id) from fb_search_results 
where position < 4
)
select ((select count from cte)/count(result_id)::float) * 100 from fb_search_results
