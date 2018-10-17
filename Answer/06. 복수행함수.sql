-- 문제77.
select max(sal)       -- 3
from emp              -- 1
where job='SALESMAN'; -- 2

-- 문제78.
select max(age)
from emp_sql;

-- 문제79.
select max(sal)
from emp
where deptno=20;

-- 문제80.
select deptno, max(sal)
from emp
where deptno=20
group by deptno;

※ group by 절의 역할? grouping을 한다.

select deptno, max(sal)
from emp
group by deptno;

-- 문제81.
select job, max(sal)
from emp
group by job;

-- 문제82.
select job, max(sal) as 최대값 -- 3
from emp                       -- 1
group by job                   -- 2
order by 최대값 desc;           -- 4

-- 문제83.
select job, max(sal) as 최대값  -- 4
from emp                        -- 1
where job != 'SALESMAN'         -- 2
group by job                    -- 3
order by 최대값 desc;           -- 5

select job, max(sal) as 최대값
from emp
where job <> 'SALESMAN'
group by job
order by 2 desc;

set autot on

-- 문제84.
select ename, hiredate, to_char(hiredate, 'RRRR')
from emp;

-- 문제85.
select to_char(hiredate 'RRRR'), max(sal)
from emp
group by to_char(hiredate, 'RRRR');

-- 문제86.
select to_char(hiredate, 'RRRR'), max(sal)
from emp
where to_char(hiredate, 'RRRR') <> '1982'
group by to_char(hiredate, 'RRRR')
order by 2 desc;

-- 문제87.
select min(hiredate)
from emp;

-- 문제88.
select job, min(sal)
from emp
where job <> 'SALESMAN'
group by job
order by 2 desc;

-- 문제89.
select avg(comm)
from emp;

※ 커미션을 다 더해서 4로 나눠서 평균값을 출력함
※ " group 함수는 null 값을 무시한다!!! "

예: select sum(comm)
    from emp;

    select sum(nvl(comm, 0))
    from emp;

    위의 두 SQL은 결과가 같을까?  결과는 같다
    위의 두 SQL 중 어느 SQL이 더 성능이 좋을까?  첫 번째

-- 문제90.
select avg(nvl(comm, 0))
from emp;

-- 문제91.
select ename, to_char(birth, 'day'), age
from emp_sql;

-- 문제92.
select to_char(birth, 'day'), avg(age)
from emp_sql
group by to_char(birth, 'day');

-- 문제93.
select deptno, avg(sal)
from emp
group by deptno
order by 1;

-- 문제94.
select job, sum(sal)     -- 4
from emp                 -- 1
where job ^= 'SALESMAN'  -- 2
group by job             -- 3
order by 2 desc;         -- 5

-- 문제95
select job, sum(sal)
from emp
group by job
having sum(sal) >=5000;

※ 설명: group 함수로 검색조건을 줄 때는 having 절을 사용해야 한다.

* select 문의 6가지 절

5    select
1    from
2    where
3    group by
4    having
6    order by

-- 문제96.
select job, avg(sal)
from emp
where job <> 'SALESMAN'
group by job
having avg(sal)>=3000
order by avg(sal) desc;

-- 문제97.
select count(empno)
from emp
where job='SALESMAN';

-- 문제98.
select job, count(empno)
from emp
group by job;

-- 문제99.
select job, count(empno)
from emp
group by job
having count(empno)>=3;

-- 문제100.
select count(distinct job)
from emp;

-- 문제101.
select job, avg(sal)
from emp
group by job;

-- 문제102.
select min(avg(sal))
from emp
group by job;

-- 문제103.
select decode(deptno, 10, sal, 0) as "10"
from emp;

-- 문제104.
select sum(decode(deptno, 10, sal, 0)) as "10"
from emp;

-- 문제105.
select sum(decode(deptno, 10, sal, 0)) as "10",
sum(decode(deptno, 20, sal, 0)) as "20",
sum(decode(deptno, 30, sal, 0)) as "30"
from emp;

-- 문제106.
select sum(decode(job, 'ANALYST', sal, 0)) as ANALYST,
sum(decode(job, 'CLERK', sal, 0)) as CLERK,
sum(decode(job, 'MANAGER', sal, 0)) as MANAGER,
sum(decode(job, 'SALESMAN', sal, 0)) as SALESMAN,
sum(decode(job, 'PRESIDENT', sal, 0)) as PRESIDENT
from emp;

