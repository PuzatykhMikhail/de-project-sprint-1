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
