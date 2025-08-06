select current_date();
select current_time();
select current_timestamp();

select date('2025-08-06 19:29:58');
select time('2025-08-06 19:29:58');

select time(current_timestamp());

select year('2025-08-06 19:29:58');
select month('2025-08-06 19:29:58');
select day('2025-08-06 19:29:58');

select hour('2025-08-06 19:29:58');
select minute('2025-08-06 19:29:58');
select second('2025-08-06 19:29:58');


select extract(hour from '2025-08-06 19:29:58');
select extract(day from '2025-08-06 19:29:58');

select datediff('2025-08-06 19:29:58','2024-12-08 16:38:09');
select timediff('2025-08-06 19:29:58','2024-12-08 16:38:09') as timedifference;

select date_add('2025-08-06 19:29:58' ,interval 1 month);
select date_sub('2025-08-06 19:29:58' ,interval 1 month);

select date_format('2023-08-09','%D %b %Y');


