■ 지금까지 배운 내용 총 복습
1. SQL을 왜 배워야 하는가?
  질문?         질문에 대한 답을 data에서 찾는다
				  ↓
역사를 보고도 어떤 패턴을 발견할 수 있듯이 회사의 data를 보고도 어떤 패턴을 발견할 수 있다. 예) 삼성 갤럭시 7이 왜 폭파했는가? - 분석) 배터리에서 나오는 데이터를 분석해서
						어떤 패턴 발견 -> 원인 파악 
							SQL과 R언어를 사용해서 분석
2. SQL 이란 무엇인가?
3. SQL의 종류
4. 기본 Query 문
5. 함수	- 단일행 함수, 복수행 함수
6. 조인
7. 서브쿼리
* 서브쿼리의 종류 3가지
1. single row subquery
2. multiple row subquery
3. multiple columm subquery
8. 집합 연산자

* select 문의 6가지 절에서 서브쿼리를 쓸 수 있는 절
select ----> scalar subquery
from -----> in line view
where
group by ---> X
having
order by

■ from 절의 서브쿼리

문제174. 데이터 분석함수를 이용하여 이름과 월급과 월급에 대한 순위를 출력하시오.

문제175. 위의 결과에서 순위가 2등인 사원의 이름과 월급을 출력하시오.

문제176. 이름, 월급, 사원테이블의 전체의 평균 월급을 출력하시오.

문제177. 위의 결과를 다시 출력하는데 자신의 월급이 사원테이블 전체의 평균 월급보다 더 큰 사원들만 출력하시오.

문제178. 위의 결과에서 평균월급보다 더 많은 월급을 받는 사원들의 직업은 주로 무엇인가? 
        (이 상태에서 job을 못 뽑음. from 절의 서브쿼리에 job이 없기 때문)

문제179. 반대로 평균월급보다 월급을 적게 받는 사원들의 직업은 어떻게 되는가?

문제180. 부서번호, 이름, 월급, 자기가 속한 부서번호의 평균월급을 출력하시오.

문제181. 위의 결과를 다시 출력하는데 자기의 월급이 자기가 속한 부서번호의 평균월급보다
         더 큰 사원들만 출력하시오.

문제182. 직업과 직업별 인원수를 출력하시오.

문제183. 이름, 직업, 자기가 속한 직업의 인원수를 출력하는데 자기가 속한 직업의 인원수가 3명 이상인 것만 출력하시오.

■ select 문 6가지절에 사용할 수 있는 서브쿼리

select 
from 
where
group by
having
order by (거의 안 씀)

문제184. 직업, 직업별 total월급을 출력하는데 직업별 total월급이 4000 이상인 것만 출력하시오.

문제185. 직업, 직업별 토탈월급을 출력하시오.

문제186. 위에서 출력된 데이터의 평균값을 구하시오. (직업별 토탈월급들의 평균값)

문제187. 직업과 직업별 토탈월급을 출력하는데 직업별 토탈월급들의 평균값보다 더 큰 것만 출력하시오.

■ 집합 연산자

“조인은 두 개의 서로 다름 컬럼을 양옆으로 붙여서 출력하는 것이었다면, 집합연산자는 위아래로 붙여서 출력하는 것”

*집합 연산자의 종류 4가지
    1. union all : 합집합 연산자
    2. union : 합집합 연산자 + 중복제거 및 데이터 제거
    3. intersect : 교집합 연산자
    4. minus : 차집합 연산자

문제188. 다음과 같이 부서번호, 부서번호별 토탈월급을 출력하시오.

 DEPTNO   SUM(SAL)
---------- ----------
        30       9400
        20      10875
        10       5350

문제189. 다음과 같이 사원테이블 전체의 토탈월급을 출력하시오.

 SUM(SAL)
----------
     25625

문제190. 위의 두 개의 결과를 아래와 같이 하나의 결과로 출력하시오.

 DEPTNO   SUM(SAL)
---------- ----------
        30       9400
        20      10875
        10       5350
                25625

문제191. 문제190 코드에 order by 절을 출력하여 아래와 같이 출력되게 하시오.

deptno sum(sal)
------ -------
10	    5350
20	    10875
30	    9400

문제192. 아래의 결과를 출력하시오. (현업에서 많이 사용)
JOB                  SUM(SAL)
------------------ ----------
SALESMAN                 5600
CLERK                    4150
PRESIDENT                1600
MANAGER                  8275
ANALYST                  6000
전체토탈			      25625

문제193. 아래의 결과를 출력하시오.

JOB                        SUM(SAL)
------------------------ ----------
				               25625
ANALYST                        6000
CLERK                          4150
MANAGER                        8275
PRESIDENT                      1600
SALESMAN                       5600

문제194. 아래와 같이 결과를 출력하시오.

    DEPTNO   SUM(SAL)
---------- ----------
                25625
        10       5350
        20      10875
        30       9400

문제195. 아래와 같이 결과를 출력하시오.

JOB                        SUM(SAL)
------------------------ ----------
전체 토탈 			           25625
ANALYST                        6000
CLERK                          4150
MANAGER                        8275
PRESIDENT                      1600
SALESMAN                       5600

■ UNION 연산자

“ 합집합 + 중복제거 그리고 데이터 정렬”

select deptno, sum(sal)
from emp
group by deptno
union
select null as deptno, sum(sal)
from emp;
order by deptno asc nulls first;

문제196. 아래와 같이 결과를 출력하시오.

 DEPTNO   SUM(SAL)
---------- ----------
        10       5350
        20      10875
        30       9400
  전체토탈       25625