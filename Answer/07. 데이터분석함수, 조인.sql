-- 문제107
select ename, hiredate, rank() over (order by hiredate asc) 순위
from emp;

* 설명: over ~이상

-- 문제108
select dense_rank(2850) within group (order by sal desc) 순위
from emp;

* 설명: within ~이내 --> 월급이 높은 순서대로 정렬한 구룹 내에서 2850의 순위를 구하라

-- 문제109
select rank(to_date('82/01/11', 'RR/MM/DD')) within group (order by hiredate asc)
from emp;

-- 문제110
select deptno, ename, sal, dense_rank() over (partition by deptno
order by sal desc) 순위
from emp;

-- 문제111
select job, ename, hiredate,
dense_rank() over (partition by job order by hiredate asc) 순위
from emp;

-- 문제112
col employee for a45

select deptno, listagg(ename,',') within group (order by ename) as employee
from emp
group by deptno;

-- 문제113
select job, listagg(ename,',') within group (order by ename) as employee
from emp
group by job;

-- 문제114
select age, listagg(ename, ',') within group (order by ename) as aaa
from emp_sql
group by age;

-- 문제115
select job, listagg(ename||'('||sal||')',',') within group (order by ename) as bbb
from emp
group by job;

-- 문제116
select ename, sal, ntile(4) over (order by sal desc) 등급
from emp;

-- 문제117
col ename for a10

select ename, age, ntile(5) over (order by age desc) 등급
from emp_sql;

-- 문제118
select avg(sal)
from emp;

-- 문제119
select ename, sal, avg(sal) over() 평균
from emp;

-- 문제120
select ename, sal, sum(sal) over () 토탈
from emp;

-- 문제121
select deptno, sum(sal)
from emp
group by deptno;

-- 문제122
select deptno, ename, sal,
sum(sal) over (partition by deptno) 부서토탈
from emp;

-- 문제123
select deptno, ename, sal, avg(sal) over (partition by deptno) 평균월급
from emp;

-- 문제124
select deptno, ename, sal, avg(sal) over (partition by deptno) 평균월급
from emp
where sal>avg(sal)(partition by deptno);

* 설명: where 절에는 분석함수를 쓸 수 없다. 분석함수는 select 절에만 쓸 수 있다.

select *                                                                    --5
from (                                                                      --1
    select deptno, ename, sal, avg(sal) over (partition by deptno) 평균월급  --3
    from emp                                                                --2
)
where sal>평균월급;                                                          --4

-- 문제125
select *
from(
    select ename, sal, dense_rank() over (order by sal desc) 순위
    from emp
)
where 순위 between 1 and 3;

-- 문제126
select job, ename, sal, count(*) over (partition by job) 인원수
from emp;

-- 문제127
select *
from (
    select job, ename, sal, count(*) over (partition by job) 인원수
    from emp
)
where 인원수>=4;

-- 문제128
select empno, ename, sal,
        lag(sal, 1) over (order by empno asc) 그전행,
        lead(sal, 1) over (order by empno asc) 그다음행
from emp;

-- 문제129
select deptno, ename, sal,
        lag(sal, 1) over (partition by deptno
            order by empno asc) 그전행,
        lead(sal, 1) over (partition by deptno
            order by empno asc) 그다음행
from emp;

-- 문제130
select ename, loc
from emp, dept
where emp.deptno=dept.deptno;

-- 문제131
select emp.ename, dept.loc, emp.sal, emp.deptno
from emp, dept
where emp.deptno=dept.deptno;

* 설명: 같은 칼럼이 여러 테이블에 있을 경우,
    어느 테이블의 칼럼을 선택할지 명시해야 한다.
    조인했을 때 칼럼의 출처를 각각 명시하면
    데이터 추출이 빨라진다.

-- 문제132
select emp.ename, dept.loc, emp.sal, emp.deptno
from emp, dept
where emp.deptno=dept.deptno --> 조인을 하기 위한 연결고리 조건
and dept.loc='DALLAS';       --> 검색조건