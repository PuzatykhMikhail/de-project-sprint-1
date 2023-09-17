create or replace view analysis.v_orders as 
with cte as(
	select order_id, max(dttm) as max_dttm
	from production.orderstatuslog
	group by order_id
)
select
	ord.order_id,
	ord.order_ts,
	ord.user_id,
	ord.bonus_payment,
	ord.payment,
	ord."cost",
	ord.bonus_grant,
	ors.status_id as status
from production.orders as ord
inner join production.orderstatuslog   as ors 
	on ors.order_id = ord.order_id 
inner join cte as mdttm
	on mdttm.order_id = ors.order_id and mdttm.max_dttm = ors.dttm;