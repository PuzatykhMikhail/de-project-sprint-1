# Витрина RFM

## 1.1. Выясните требования к целевой витрине.

{См. задание на платформе}
-----------

1. Задача — построить витрину для RFM-классификации. Для анализа нужно отобрать только успешно выполненные заказы( статус заказа Closed).
2. Название витрины - dm_rfm_segments.
3. Расположение - в схеме analysis.
4. Витрина должна состоять из таких полей:
   
        user_id
        recency (число от 1 до 5)
        frequency (число от 1 до 5)
        monetary_value (число от 1 до 5)

5. В витрине нужны данные с начала 2022 года; обновления не нужны.
6. В таблице users 1000 записей, поэтому  в каждую категорию попадает 200 пользователей. Если количество заказов одинаковое, то неважно, кого поставить выше, а кого ниже. Аналогично и с другими показателями.
7. Описание метрик:

        Recency — сколько времени прошло с момента последнего заказа. Фактор Recency измеряется по последнему заказу. Распределите клиентов по шкале от одного до пяти, где значение 1 получат те, кто либо вообще не делал заказов, либо делал их очень    давно, а 5 — те, кто заказывал относительно недавно.
        
        Frequency — количество заказов. Фактор Frequency оценивается по количеству заказов. Распределите клиентов по шкале от одного до пяти, где значение 1 получат клиенты с наименьшим количеством заказов, а 5 — с наибольшим.
        
        Monetary Value — сумма затрат клиента. Фактор Monetary Value оценивается по потраченной сумме. Распределите клиентов по шкале от одного до пяти, где значение 1 получат клиенты с наименьшей суммой, а 5 — с наибольшей.


## 1.2. Изучите структуру исходных данных.

{См. задание на платформе}

-----------
Смотреть requirements.md

## 1.3. Проанализируйте качество данных

Смотреть data_quality.md


## 1.4. Подготовьте витрину данных

{См. задание на платформе}
### 1.4.1. Сделайте VIEW для таблиц из базы production.**

{См. задание на платформе}
```SQL
--Впишите сюда ваш ответ
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

```

### 1.4.2. Напишите DDL-запрос для создания витрины.**

{См. задание на платформе}
```SQL
--Впишите сюда ваш ответ
drop table if exists analysis.dm_rfm_segments;

create table analysis.dm_rfm_segments (
	user_id 	   bigint,
	recency 	   smallint not null,
	frequency 	   smallint not null,
	monetary_value smallint not null,
	primary key(user_id),
	constraint recency_check check(recency > 0 and recency < 6 ),
	constraint frequency_check check(frequency > 0 and frequency < 6 ),
	constraint monetary_value_check check(monetary_value > 0 and monetary_value < 6 )
);



```

### 1.4.3. Напишите SQL запрос для заполнения витрины

{См. задание на платформе}
```SQL
--Впишите сюда ваш ответ

truncate table analysis.dm_rfm_segments;
insert into analysis.dm_rfm_segments 
(user_id, recency, frequency, monetary_value)
select 
	rc.user_id        as user_id,
	rc.recency        as recency ,
	fq.frequency 	  as frequency ,
	mv.monetary_value as monetary_value 
from analysis.tmp_rfm_recency  as rc
left join analysis.tmp_rfm_frequency  as fq 
	on rc.user_id = fq.user_id 
left  join  analysis.tmp_rfm_monetary_value  as mv 
	on rc.user_id = mv.user_id ;
```



