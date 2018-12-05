■ DML문 (Data Manipulation Language)

    1. insert --> 데이터 입력
    2. update --> 데이터 수정
    3. delete --> 데이터 삭제
    4. merge  --> 데이터 입력, 수정, 삭제를 한 번에 수행하는 명령어

■ insert문

    문법:   insert into emp(empno, ename, sal)
            values(1122, 'jack', 3000);

            ※ 문자와 날짜는 양쪽에 싱글 쿼테이션 마크를 사용해야 한다.

문제218. 아래의 데이터를 사원 테이블에 입력하시오.

    사원번호 : 2812
    사원이름 : jane
    월급    : 4000
    부서번호 : 20
    직업    : SALESMAN

문제219. 아래의 데이터를 사원 테이블에 입력하시오.

    사원번호 3911
    사원이름 willf
    월급     4000
    입사일   오늘날짜

문제220. 오늘 입사한 사원의 이름과 입사일을 출력하시오.

■ update 문

    " SCOTT의 월급을 9000으로 수정하시오~ "

    update emp
    set sal = 9000
    where ename = 'SCOTT';

문제221. ALLEN의 부서번호를 20번으로 변경하시오.

문제222. 직업이 SALESAN인 사원들의 커미션을 6000 으로 변경하시오.

문제223. 월급이 1000 이상인 사원들의 커미션을 9000으로 수정하시오.

■ delete 문

    "직업이 CLERK인 사원들을 삭제하시오~"

    delete from emp
    where job = 'CLERK';

    rollback; -- 마지막으로 commit한 시점으로 돌아감

문제224. 30번 부서번호인 사원들의 데이터를 지우시오.

문제225. 월급이 3000 이상인 사원들의 데이터를 지우시오.

■ emp 테이블의 데이터를 백업하는 방법

create table emp_backup
as 
select *
from emp;

■ 서브쿼리를 사용한 DML 문

1. 서브쿼리를 사용한 insert 문

insert into emp
select *
from emp_backup;

commit;

select * from emp;

문제226. dept 테이블을 백업받으시오.

문제227. dept 테이블의 모든 데이터를 삭제하시오.

문제228. 백업받은 dept_backup 테이블의 데이터로 dept 테이블을 복구하시오.

■ 서브쿼리문을 사용한 update문
 “JONES 보다 많은 월급을 받는 사원들의 커미션을 9000으로 수정하시오.”
update emp
set comm = 9000
where sal > (select sal
      from emp
      where ename = ‘JONES’):

문제229. KING 의 부서번호를 40번으로 변경하시오.

문제230. KING 의 부서번호를 SCOTT의 부서번호로 변경하시오.

문제231. ALLEN 보다 늦게 입사한 사원들의 직업을 JONES의 직업으로 변경하시오.

■ 서브쿼리문을 사용한 delete 문

    " ALLEN 보다 늦게 입사한 사원들을 지우시오 "

    delete from emp
    where hiredate > (select hiredate
    from emp
    where ename = 'ALLEN');

문제232. SCOTT과 같은 부서번호에서 근무하는 사원들을 삭제하시오.

문제233. JONES와 같은 직업을 갖는 사원들을 지우시오.

■ DML문: insert, update, delete, merge 

■ merge 문

    "insert, update, delete를 한 번에 수행할 수 있는 문장"

문제234. 이름과 부서위치를 출력하시오.

* 사원테이블에 부서위치(loc) 컬럼을 추가하시오.

alter table emp
add loc varchar2(20);

select ename, loc 
from emp;

문제235. merge 문을 이용해서 사원 테이블에 loc 컬럼의 데이터를 해당 사원의 부서위치로 변경하시오.

문제236. 사원테이블에 dname(부서명) 컬럼을 추가하시오.

문제237. 사원테이블에 추가한 dname 컬럼의 데이터를 해당 사원의 부서명으로 값을 갱신하시오.

문제238. 부서번호, 부서번호별 토탈월급을 출력하시오.

문제239. 부서테이블에 sumsal 이라는 컬럼을 추가하시오.

문제240. (7번 째 과제 토요일까지 제출, merge 사용, using 절에 서브쿼리 사용가능)
        dept테이블에 추가한 sumsal 컬럼에 값을 해당 부서번호의 토탈월급으로 갱신하시오.

  DEPTNO    SUMSAL
--------- ----------
    10
    20
    30
    40