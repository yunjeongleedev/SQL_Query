-- 문제152

- JONES의 월급을 구한다
select sal 
from emp
where ename='JONES';

- 2975 보다 더 많은 월급을 받는 사원들의 이름과 월급을 출력한다.

select ename, sal 
from emp
where sal>             --> 메인쿼리
(select sal
from emp
where ename='JONES');  --> 서브쿼리

-- 문제153
select ename, sal 
from emp
where sal=(select sal 
from emp 
where ename='SCOTT')
and ename!='SCOTT';

-- 문제154
select ename, deptno 
from emp 
where deptno=(select deptno 
from emp 
where ename='KING')
and ename!='KING';

-- 문제155
select ename, hiredate
from emp
where hiredate>(select hiredate
from emp
where ename='ALLEN');

-- 문제156
select ename, sal 
from emp
where sal=(select max(sal)
from emp);

-- 문제157
select deptno 
from dept 
where loc='DALLAS';

-- 문제158
select ename, sal 
from emp e
where deptno=(select deptno
from dept
where loc='DALLAS');

-- 문제159
select to_char(birth, 'DAY')
from emp_sql
where ename='이윤정';

-- 문제160
select ename, age
from emp_sql
where to_char(birth, 'DAY')=(select to_char(birth, 'DAY')
from emp_sql
where ename='이윤정');

-- 문제161
select empno
from emp
where ename='KING';

-- 문제162
select mgr 
from emp
where ename='JONES';

-- 문제163
select ename
from emp
where mgr=(select empno
from emp
where ename='KING');

-- 문제164
select ename, sal 
from emp
where sal in (select sal
from emp
where job='SALESMAN');

* 서브쿼리 종류 3가지

1. single row subquery
: 서브쿼리에서 메인쿼리로 하나의 값이 리턴되는 경우
연산자: =, <>, !=, ^=, >, <, >=, <=
2. multiple row subquery
: 서브쿼리에서 메인쿼리로 여러 개의 값이 리턴되는 경우
연산자: in, not in, >all, <all, >any, <any
3. multiple column subquery
: 서브쿼리에서 메인쿼리로 여러 개의 컬럼 값이 리턴되는 경우
연산자: in, not in

-- 문제165
select ename, sal 
from emp
where sal not in (select sal
from emp
where job='SALESMAN');

-- 문제166
select ename
from emp
where empno in (select mgr
from emp);

-- 문제167
select ename
from emp
where empno not in (select mgr
from emp
where mgr is not null);

* 설명: mgr에 null이 포함되어있어서 결과가 출력되지 않았다.

* 중요!! 서브쿼리에서 not in 연산자를 사용할 때는 null 처리를 잘 해야한다.

-- 문제168
select ename, sal 
from emp
where sal>(select max(sal)
from emp
where job='SALESMAN');

* 설명: 서브쿼리부터 수행

select ename, sal 
from emp
where sal >all (select sal
from emp
where job='SALESMAN');

* 설명: 메인쿼리부터 수행

-- 문제169

select ename, sal 
from emp
where sal>(select min(sal)
from emp
where job='SALESMAN');

select ename, sal 
from emp
where sal>any(select sal
from emp
where job='SALESMAN');

--> 가장 작은 값과 비교

-- 문제170

1. non pair wise 방식
select ename, sal, comm, job
from emp
where sal in (select sal
from emp
where job='SALESMAN')
and comm in (select comm
from emp
where job='SALESMAN');

2. pair wise 방식 --> 짝을 이룬다.
select ename, sal, comm, job
from emp
where (sal, comm) in (select sal, comm
from emp
where job='SALESMAN');

update emp
set sal=1600,
comm=1400
where ename='KING';

업데이트문을 수행하고 두 문장을 실행하면 결과값이 다르게 나온다.
sal: 1250, 1600, 1500, 1250
comm: 1400, 300, 0, 500
non pair wise는 한 쪽만 맞아도 결과값으로 출력하지만
pair wise는 양 쪽이 맞아야만 결과값으로 출력한다.
따라서 non pair wise는 sal만 일치하는 KING을
결과값으로 출력하지만, pair wise는 출력하지 않는다.

-- 문제171
select avg(sal)
from emp;

-- 문제172
select ename, sal, (select avg(sal)
from emp) 평균
from emp;

-- 문제173
튜닝 전:
select ename, sal,
(select avg(sal) from emp) 평균월급,
(select max(sal) from emp) 최대월급,
(select min(sal) from emp) 최소월급,
(select sum(sal) from emp) 토탈월급
from emp;

튜닝 후:
select ename, sal,
avg(sal) over () 평균월급,
max(sal) over() 최대월급,
min(sal) over() 최소월급,
sum(sal) over() 토탈월급
from emp;