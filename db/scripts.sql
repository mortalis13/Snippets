select user_id from registrations group by user_id;
select user_id from registrations order by user_id;
select count(distinct user_id) from registrations;
select user_id, count(*) from registrations group by user_id having count(*)>1 order by count(*);

select * from user where rownum between 1 and 1;
