-- 문제11.
select ename, sal, job, deptno
from emp
where deptno=30;

-- 문제12.
select ename, comm
from emp
where comm=300;

-- 문제13.
select ename, sal
from emp
where ename='ALLEN';

-- 문제14.
select ename, sal
from emp
where sal>=2000;

-- 문제15.
select ename, job
from emp
where job!='SALESMAN';

select ename, job
from emp
where job<>'SALESMAN';

select ename, job
from emp
where job^='SALESMAN';

-- 문제16.
select ename, hiredate
from emp
where hiredate='81/11/17';

-- 문제17.
select ename, sal, job
from emp
where job='SALESMAN'
and sal>=1000;

-- 문제18.
select ename, sal, job, deptno
from emp
where sal>=1200
and deptno=20;

-- 문제19.
select ename, sal
from emp
where sal between 1000 and 3000;

-- 문제20.
select ename, sal
from emp
where sal not between 1000 and 3000;

-- 문제21.
select ename, hiredate
from emp
where hiredate between '81/01/01' and '81/12/31';

-- 문제22.
select ename, hiredate
from emp
where hiredate not between '82/01/01' and '82/12/31';

-- 문제23.
select ename, deptno
from emp
where deptno in (10, 20);

-- 문제24.
select ename, sal, job
from emp
where job in ('SALESMAN', 'ANALYST', 'CLERK');

-- 문제25.
select ename, sal, job
from emp
where job not in ('SALESMAN', 'ANALYST', 'CLERK');

-- 문제26.
select ename
from emp
where ename like 'S%';

-- 문제27.
select ename
from emp
where ename like '%T';

-- 문제28.
select ename
from emp
where ename like '_M%';

-- 문제29.
select ename
from emp
where ename like '__L%';

-- 문제30.
select ename, comm
from emp
where comm is null;

-- 문제31.
select ename, comm
from emp
where comm is not null;

-- 문제32.
select ename, hiredate
from emp
order by hiredate desc;

-- 문제33.
select ename, sal
from emp
where job='SALESMAN'
order by sal desc;

-- 문제34.
select ename, hiredate
from emp
where hiredate between '81/01/01' and '81/12/31'
order by hiredate desc;

select ename, hiredate
from emp
where hiredate like '81%'
order by hiredate desc;

-- 문제35.
select ename, sal
from emp
where job not in ('SALESMAN', 'ANALYST')
and sal>=1000
order by sal desc;