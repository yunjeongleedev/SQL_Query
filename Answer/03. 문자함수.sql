-- 문제36.
select ename, sal
from emp
where sal between 1000 and 3000
order by sal desc;

-- 문제37.
select ename, sal
from emp
where lower(ename)='scott';

-- 문제38.
select lower(substr(ename, 1, 1))
from emp;

-- 문제39.
select lower(substr(ename, 2))
from emp;

-- 문제40.
select substr(ename, 1, 1) || lower(substr(ename, 2))
from emp;

-- 문제41.
drop table emp_sql;

create table emp_sql
( ename varchar2(30),
  age   number(10),
  birth date,
  email varchar2(80),
  address varchar2(50));

insert into emp_sql
values('개발자', 21, '90/07/15', 'gaebal@gmail.com', '경기도 일산서구');

-- 문제42.
select ename, age
from emp_sql
order by age desc;


-- 문제43.
select ename, address
from emp_sql
where substr(address, 1, 2) = '서울';

select ename, address
from emp_sql
where address like '서울%';

-- 문제44.
select ename, address
from emp_sql
where address not like '%서울%';

-- 문제45.
select ename, age
from emp_sql
where age between 25 and 28;

-- 문제46.
select email, instr(email, '@')
from emp_sql;

-- 문제47.
select ename, substr(email, instr(email, '@')+1, instr(email, '.')-instr(email, '@')-1)
from emp_sql;