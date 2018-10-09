-- CMD에서 SQL에 접속
sqlplus / as sysdba

-- 문제1.
select empno, ename
from emp;

-- 문제2.
set pages 1000
select ename, sal, job
from emp;

-- 문제3.
select ename, sal, comm, deptno
from emp;

-- 문제4.
select ename, sal, comm, sal+comm
from emp;

-- 문제5.
select ename, sal, nvl(comm, 0)
from emp;

-- 문제6.
select ename, sal, comm, sal+nvl(comm, 0)
from emp;

-- 문제7.
select ename, sal
from emp
where sal=3000;

-- 문제8.
select ename, sal
from emp
where sal>=1000;

-- 문제9.
select ename, job, sal
from emp
where ename='SCOTT';

-- 문제10.
select ename, job, deptno
from emp
where job='SALESMAN';