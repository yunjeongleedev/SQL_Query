-- 문제218.
insert into emp(empno, ename, sal, deptno, job)
values(2812, 'jane', 4000, 20, 'SALESMAN');

-- 문제219.
insert into emp(empno, ename, sal, hiredate)
values(3911, 'willf', 4000, sysdate);

-- 문제220.
select ename, hiredate
from emp
where hiredate = sysdate;

설명: sysdate로 날짜를 입력하면 날짜 뿐만 아니라 시분초까지 입력이 된다.

rollback;

insert into emp(empno, ename, sal, hiredate)
values(3911, 'willf', 4000, to_date('2018/12/05', 'RRRR/MM/DD'));

select ename, hiredate
from emp
where hiredate = '2018/12/05';

-- 문제221.
update emp
set deptno = 20
where ename = 'ALLEN';

-- 문제222.
update emp
set comm = 6000
where job = 'SALESMAN';

-- 문제223.
update emp
set comm = 9000
where sal >= 1000;

-- 문제224.
delete from emp
where deptno = 30;

-- 문제225.
delete from emp
where sal >= 3000;

-- 문제226.
create table dept_backup
as
select *
from dept;

-- 문제227.
delete from dept;

-- 문제228.
insert into dept
select *
from dept_backup;

-- 문제229.
update emp
set deptno = 40
where ename = 'KING';

-- 문제230.
update emp
set deptno = (select deptno 
from emp 
where ename = 'SCOTT')
where ename = 'KING';

-- 문제231.
update emp
set job = (select job
from emp
where ename = 'JONES')
where hiredate > (select hiredate
from emp
where ename = 'ALLEN');

-- 문제232.
delete from emp
where deptno = (select deptno
from emp
where ename = 'SCOTT');

-- 문제233.
delete from emp
where job = (select job
from emp
where ename = 'JONES');

-- 문제234.
select e.ename, d.loc 
from emp e, dept d 
where e.deptno = d.deptno;

-- 문제235.
merge into emp e 
using dept d 
on (e.deptno = d.deptno)
when matched then
update set e.loc = d.loc;

-- 문제236.
alter table emp
add dname varchar2(20);

-- 문제237.
merge into emp e 
using dept d 
on (e.deptno = d.deptno)
when matched then 
update set e.dname = d.dname;

-- 문제238.
select deptno, sum(sal)
from emp
group by deptno;

-- 문제239.
alter table dept 
add sumsal number(10);

-- 문제240.
merge into dept d
using (select deptno, sum(sal) sumsal
from emp
group by deptno) e
on (e.deptno = d.deptno)
when matched then
update set d.sumsal = e.sumsal;

select deptno, sumsal
from dept;