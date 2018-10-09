-- 문제47.
select ename, sal
from emp
where trim(ename)='JACK';

-- 문제48.
select ename, lpad(sal, 10, ' ')
from emp;

-- 문제49.
col sal for a10;

select ename, regexp_replace(sal, '[0-3]', '*') as sal
from emp;

-- 문제50.
select ename, mod(age, 2) as age
from emp_sql;

-- 문제51. (기업마다 기준 다름)
select ename, sysdate-hiredate
from emp;

select ename, round(sysdate-hiredate)
from emp;

select ename, trunc(sysdate-hiredate)
from emp;

-- 문제52. (기업마다 기준 다름)
select ename, months_between(sysdate, hiredate)
from emp;

select ename, round(months_between(sysdate, hiredate), -1)
from emp;

select ename, trunc(months_between(sysdate, hiredate), 1)
from emp;

-- 문제53. (기업마다 기준 다름)
select ename, trunc(months_between(sysdate-hiredate)/12)
from emp;

-- 문제54.
select next_day(add_months(sysdate, 100), '월')
from dual;

-- 문제55.
select last_day(sysdate)-sysdate
from dual;

-- 문제56.
select to_char(birth, 'day')
from emp_sql
where trim(ename)='이윤정';

-- 문제57.
select ename, to_char(birth, 'day'), to_char(birth, 'd') as birth_day
from emp_sql
order by birth_day;

-- 문제58.
select ename, to_char(birth, 'day'), replace(to_char(birth, 'd'), 1, 8) as birth_day
from emp_sql
order by birth_day;