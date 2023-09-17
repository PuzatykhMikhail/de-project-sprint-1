insert into analysis.tmp_rfm_frequency
select
	usr.id as user_id,
	ntile(5) over (order by count(ord.order_id)) as frequency 
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
where user_id  = 837;

select *
from production.orders 
where user_id  = 684;
*/

