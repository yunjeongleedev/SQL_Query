■ 지난 주에 배웠던 내용 복습

1. from 절의 서브쿼리
2. having 절의 서브쿼리
3. 집합 연산지 
	- union all
	- union
	- minus
	- intersect

■ minus (차집합 연산자)

A{1, 2, 3, 4, 5}
B{2, 4}

A-B ={1, 3, 5}


drop table emp10;
drop table emp20;   --> drop은 아래 테이블 잘못 입력했을 때

create table emp10
(empno number(10));

create table emp20
(empno number(10));

insert into emp10 values(1);
insert into emp10 values(2);
insert into emp10 values(3);
insert into emp10 values(4);
insert into emp10 values(5);

commit;

insert into emp20 values(2);
insert into emp20 values(4);
commit;
---------
seletct * from emp10;
select * from emp20;
select empno
from emp10
minus
select empno
from emp20;

※ minus 연산자를 주로 사용하는 때는 두 테이블 사이의 데이터의 차이를 확인할때 사용함.

테스트2.　*부서번호 20번인 사원들의 데이터를 가지고 emp30 테이블을 생성해라
create table emp30
as
select *
from emp
where deptno = 20;
---------------------> 외우기! as 한 대로 테이블 생성
select * from emp30;

문제197. emp 테이블과 emp30 테이블 간의 데이터 차이를 구하시오.
        (emp테이블에는 존재하는데 emp30에는 존재하지 않는 데이터를 출력하시오.)

문제198. 반대로, emp30에는 존재하는데 emp에는 없는 데이터를 출력하시오.

문제199. 아래의 emp와 emp30간의 차이가 숫자 9라고 출력될 수 있도록 from 절의 서브쿼리 in line view를 사용해서 구현하시오.

문제200. emp와 emp30의 두 개의 테이블간의 공통된 데이터가 무엇인지 출력하시오.

문제201. emp와 emp30 간의 공통된 데이터가 몇 건인지 숫자로 출력되게 하시오.

문제202. 이름과 부서위치를 출력하시오.

문제203. outer join을 사용해서 부서위치는 있는데 사원이 없는 결과도 출력하시오.

문제204. full outer 조인 사용하지 말고 집합 연산자와 아래의 두 개의 쿼리를 이용해서
        위의 full outer join한 결과와 똑같은 결과가 출력되게 하시오.

    select e.ename, d.loc
    from emp e, dept d
    where e.deptno(+) = d.deptno;

    select e.ename, d.loc
    from emp e, dept d
    where e.deptno = d.deptno(+);

■ SQL 종류
1. Query 문
--> select 문의 6가지 절, 조인, 서브쿼리, 집합연산자, 데이터 분석함수, 레포팅 함수
2. DML 문
3. DDL 문
4. DCL 문
5. TCL 문

■ 레포팅 함수 4가지
1. rollup
2. cube
3. grouping sets
4. grouping

문제205. 부서번허, 부서번호별 토탈월급을 출력하시오.

문제206. 전체 토탈 월급을 출력하시오.

문제207. 위의 두 개의 퉈리와 union을 이용해서 아래의 결과를 출력하시오.

  DEPTNO   SUM(SAL)
---------- ---------- 
  10        5350
  20        10875
  30        9400
	        25625

문제208. 직업, 직업별 토탈월급을 출력하는데 맨 밑에 전체 토탈 월급을 출력하시오.

문제209. 직업과 직업별 토탈월급을 출력하는데 전체 토탈월급이 맨 위에 출력되게 하시오.

문제210. 아래와 같이 출력되게 하시오.

JOB                  SUM(SAL)
------------------ ----------
전체토탈                 25625
CLERK                    4150
ANALYST                  6000
MANAGER                  8275
SALESMAN                 5600
PRESIDENT                1600

문제211. 아래와 같이 결과를 출력하시오.

년도		토탈월급
---------	--------
1980		800
1983		1100
1982		4300
1981	    22825
전체토탈     29025

문제212. ★(기말 예시) 아래와 같이 결과를 출력하시오.
년도                       	토탈
------------------------ ----------
1980                            800
1981                          19,425
1982                           4,300
1983                           1,100
전체토탈                      25,625

■ groupin sets 함수 (를 실무에서 더 많이 씀)
select deptno, sum(sal)
from emp			
group by grouping sets (deptno  ,()); --부서번호별로 그룹핑 (10 8750/20 10875...)

select deptno, job, sum(sal)
from emp
group by grouping sets( (deptno), (job), () );
-------------------------------------------> union도 가능하지만 쿼리가 길어짐.

문제213. 아래의 union all 이 결과를 grouping sets로 구현하시오.

문제214. 이름, 월급을 출력하는데 맨 아래쪽에 전체 토탈 월급을 출력하시오.

문제215. 위의 결과를 union all로 구현하시오.

■ rollup 

------------★★★★★★★★★★★★★
select deptno, job, sum(sal)
from emp
group by rollup(deptno,job);

 DEPTNO JOB                  SUM(SAL)
---------- ------------------ ----------
        10 CLERK                    1300
        10 MANAGER                  2450
        10 PRESIDENT                1600
        10                          5350
        20 CLERK                    1900
        20 ANALYST                  6000
        20 MANAGER                  2975
        20                         10875
        30 CLERK                     950
        30 MANAGER                  2850
        30 SALESMAN                 5600
        30                          9400
                                   25625

    ※ 공식 --------- rollup(deptno,job)
    1. deptno, job
    2. deptno
    3. ()

문제216. 위의 결과를 grouping sets 로 수행하시오

문제217. 위의 결과를 union all 또는 union으로 구현하시오.