-- 문제197.
select *
from emp
minus
select *
from emp30;

-- 문제198.
select *
from emp30
minus
select *
from emp;

-- 문제199.
select count(*)
from (select *
from emp
minus
select *
from emp30);

-- 문제200.
select *
from emp
intersect
select *
from emp30;

-- 문제201.
select count(*)
from (select * 
from emp 
intersect 
select * 
from emp30);

-- 문제202.
select e.ename, d.loc
from emp e, dept d
where e.deptno = d.deptno;

-- 문제203.
select e.ename, d.loc
from emp e, dept d
where e.deptno(+) = d.deptno;

insert into emp(empno,ename, sal, deptno)
values(1929,'JACK',3400,70);

select e.ename, d.loc
from emp e, dept d
where e.deptno = d.deptno(+);

양쪽 모두 보고 싶을 때
select e.ename, d.loc
from emp e full outer join dept d
on (e.deptno = d.deptno); 	

-- 문제204.
select e.ename, d.loc
from emp e, dept d
where e.deptno(+) = d.deptno
union 
select e.ename, d.loc
from emp e, dept d
where e.deptno = d.deptno(+);

-- 문제205.
delete from emp where job is null;

select deptno, sum(sal)
from emp
group by deptno;

-- 문제206.
select sum(sal) from emp;

-- 문제207.
튜닝 전 :
select deptno, sum(sal)
from emp
group by deptno
union
select null, sum(sal)
from emp;
----------------> emp 테이블 두 번 select (느린 SQL)
튜닝 후 (속도 개선):
select deptno, sum(sal)
from emp
group by rollup(deptno);

-- 문제208.
select job, sum(sal)
from emp
group by rollup(job);

-- 문제209.
select job, sum(sal)
from emp
group by cube(job);

-- 문제210.
select nvl(job, '전체토탈'), sum(sal)
from emp
group by cube(job);

nvl -->직업을 출력하는데 출력되는 결과에 null이 있으면 ‘전체토탈’이라는 글씨로 출력되게 하라!

-- 문제211.
select nvl(to_char(hiredate, 'RRRR'), '전체토탈: ') 년도, sum(sal) 토탈
from emp
group by rollup(to_char(hiredate, 'RRRR'));

-- 문제212.
select nvl(to_char(hiredate, 'RRRR'), '전체토탈') 년도, to_char(sum(sal), '999,999,999') as 토탈
from emp
group by rollup(to_char(hiredate, 'RRRR'))

-- 문제213.
select to_char(hiredate,‘RRRR’) as 년도, null as job, sum(sal) 
from emp
group by to_char(hiredate, ‘RRRR’)
union all
select null as 년도, job, sum(sal)
from emp
group by job;

select to_char(hiredate, ‘RRRR’) as 년도, job, sum(sal)
from emp
group by grouping sets( (to_char(hiredate, ‘RRRR’)), (job));

-- 문제214.
select ename, sum(sal)
from emp		
group by grouping sets( (ename), ());
---------------------> 동명이인 없어서 가능

-- 문제215.
select ename, sal
from emp
union all
select null, sum(sal) as sal
from emp;

*설명: 컬럼명, sal을 같게 해야 한다.

-- 문제216.
select deptno, job, sum(sal)
from emp
group by grouping sets( (deptno,job), (deptno), ());

-- 문제217.
select deptno, job, sal
from emp
union
select deptno, null as job, sum(sal)
from emp
group by deptno
union all
select null, null, sum(sal)
from emp;