select us_alta from inscripciones group by us_alta;
select us_alta from inscripciones order by us_alta;
select count(distinct us_alta) from inscripciones;
select us_alta,count(*) from inscripciones group by us_alta having count(*)>1 order by count(*);

select * from usuario where rownum between 1 and 1;
