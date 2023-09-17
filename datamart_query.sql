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

select *
from analysis.dm_rfm_segments drs 
order by user_id 
limit 10;

/*
user_id recency frequency monetary_value
	0		1		3		4
	1		4		3		3
	2		2		3		5
	3		2		3		3
	4		4		3		3
	5		5		5		5
	6		1		3		5
	7		4		2		2
	8		1		2		3
	9		1		3		2


	
