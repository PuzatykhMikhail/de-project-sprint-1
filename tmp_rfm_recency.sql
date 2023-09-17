insert into analysis.tmp_rfm_recency
select
	usr.id as user_id,
	ntile(5) over (order by max(ord.order_ts)) as recency 
from analysis.v_users as usr
left join analysis.v_orders  as ord
	on usr.id = ord.user_id 
    and ord.status = (select id 
    				  from analysis.v_orderstatuses 
    				  where key = 'Closed')
    and extract(year from ord.order_ts) >= 2022	
GROUP BY usr.id;

/* check
select *
from production.orders 
where user_id  = 388;

select *
from production.orders 
where user_id  = 211;
*/

