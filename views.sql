create or replace view analysis.v_users as 
select *
from production.users;

create or replace view analysis.v_products as 
select *
from production.products;

create or replace view analysis.v_orderstatuses as 
select *
from production.orderstatuses;

create or replace view analysis.v_orders as 
select *
from production.orders;

create or replace view analysis.v_orderitems as 
select *
from production.orderitems;