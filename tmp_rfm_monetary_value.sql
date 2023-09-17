insert into analysis.tmp_rfm_monetary_value
select
	usr.id as user_id,
	ntile(5) over (order by sum(ord.payment) nulls first) as monetary_value 
from analysis.v_users as usr
left join analysis.v_orders  as ord
	on usr.id = ord.user_id 
    and ord.status = (select id 
    				  from analysis.v_orderstatuses 
    				  where key = 'Closed')
    and extract(year from ord.order_ts) >= 2022	
GROUP BY usr.id;

/* check
select sum(cost)
from production.orders 
where user_id  = 243
	  and status  = 4
group by user_id;

select *
from production.orders 
where user_id  = 684
	  and status  = 4
;

select*
from production.orders 
where user_id  = 211
;

select sum(cost)
from production.orders 
where user_id  = 224
and status  = 4
group by user_id;

select *
from production.orders 
where user_id  = 224
	  and status  = 4
;

select*
from production.orders 
where user_id  = 224;
*/
