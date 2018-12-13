-- 문제174.
select ename, sal, dense_rank() over (order by sal desc) 순위
from emp;

-- 문제175.
5	select ename, 순위
1 	from 
2 	(select ename, sal, dense_rank() over (order by sal desc) 순위
3	from emp)
4	where 순위 = 2;

*설명: from 절에 서브쿼리(보조 쿼리)를 쓰면 됨
      (컴퓨터 메모리에 올라가서 마치 테이블처럼 됨)

3	select ename, sal, dense_rank() over (order by sal desc) 순위
1	from emp;
2	where 순위 = 2;

* 설명: 순서 때문에 안 됨.

3	select ename, sal, dense_rank() over (order by sal desc) 순위
1	from emp;
2	where dense_rank() over (order by sal desc) = 2;

*설명: 데이터 분석함수는 select 절에만 쓸 수 있음.
        (where 절에 쓸 수 없음. 에러)

-- 문제176.
select ename, sal, avg(sal) over () 평균월급
from emp;

-- 문제177.
5	select ename, sal, 평균월급
1	from
2	(select ename, sal, avg(sal) over () 평균월급
3	from emp)
4	where sal>평균월급;

-- 문제178.
select ename, sal, 평균월급, job
from (select ename, sal, job, avg(sal) over () 평균월급
from emp)
where sal>평균월급

-- 문제179.
select ename, sal, 평균월급, job
from (select ename, sal, job, avg(sal) over () 평균월급
from emp)
where sal<평균월급

-- 문제180.
select deptno, ename, sal, avg(sal) over (partition by deptno) 부서평균
from emp;

select deptno, avg(sal)
from emp
group by deptno;

-- 문제181.
5	select ename, sal, 부서평균
1	from
2	(select deptno, ename, sal, avg(sal) over (partition by deptno) 부서평균
3	from emp)
4	where sal > 부서평균;

-- 문제182.
select job, count(*)
from emp
group by job;

-- 문제183.
select ename, job, 인원수
from (select ename, job, count(*) over (partition by job) 인원수
from emp)
where 인원수 >= 3;

-- 문제184.
select job, sum(sal)
from emp
group by job
having sum(sal) >= 4000;

※ 설명 : 그룹함수로 조건을 줄 때는 having절을 사용해야 한다.

-- 문제185.
select job, sum(sal)
from emp
group by job;

delete from emp
where job is null;
 	commit;

select sum(sal) 
from emp 
group by job; --> 가능

-- 문제186.
select avg(sum(sal))
from emp
group by job;

-- 문제187.
select job, sum(sal)
from emp
group by job
having sum(sal) > (select avg(sum(sal))
from emp
group by job);

*설명: 가장 많이 쓰는 건 where절의 서브쿼리

-- 문제188.
select deptno, sum(sal)
from emp
group by deptno;

-- 문제189.
select sum(sal) from emp;

-- 문제190.
select deptno, sum(sal)
from emp
group by deptno
union all
select null as deptno, sum(sal)
from emp;

*설명: 집합연산자 사용시 주의할 사항

    1. 위아래의 쿼리의 컬럼의 개수가 동일해야 한다.
    2. 위아래의 쿼리의 컬럼명도 동일해야 맨 아래쪽 order by 절의 기능을 수행할 수 있게 된다. (컬럼의 갯수 뿐만 아니라 컬럼명도 동일!)
    3. order by 절은 맨 아래쪽 쿼리에만 쓸 수 있다.

-- 문제191.
select deptno, sum(sal)
from emp
group by deptno
union all
select null as deptno, sum(sal)
from emp
order by deptno asc;

※ order by 절은 맨 아래 쿼리(절)에만 사용해야 함!!!!
※ 컬럼 별칭이 (위아래) 다 같아야 함. (deptno)

-- 문제192.
select job, sum(sal)
from emp
group by job
union all
select '전체토탈' as job, sum(sal)
from emp
order by job;

-- 문제193.
select job, sum(sal)
from emp
group by job
union all
select null as job, sum(sal)
from emp
order by job asc nulls first;

-- 문제194.
select deptno, sum(sal)
from emp
group by deptno
union all
select null as deptno, sum(sal)
from emp
order by deptno asc nulls first;

-- 문제195.

-- 문제196.
select to_char(deptno) as deptno, sum(sal)
from emp
group by deptno
union
select '전체토탈' as deptno, sum(sal)
from emp;