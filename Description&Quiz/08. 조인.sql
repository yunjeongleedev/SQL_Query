■ 조인 문법의 종류 2가지

1. 오라클 조인 문법
    - equi join: 조인 조건이 =(등호) 조건인 경우의 조인문법
    - non equi join: 조인 조건이 =(등호) 조건이 아닌 경우의 조인문법
    - outer join: equi join으로는 볼 수 없는 결과를 볼 때 사용하는 조인문법
    - self join: 자기 자신의 테이블과 조인하는 조인 문법

2. 1999 ANSI 문법 (American National Standards Institute)

    - on 절을 사용한 조인
    - using 절을 사용한 조인
    - right/left/full outer 조인
    - natural 조인
    - cross 조인

■ equi join

문제133. 월급이 2000 이상인 사원들의 이름과 월급과 부서위치(loc)를 출력하시오.

문제134. SALES 부서명에서 근무하는 사원들의 이름과 월급과 부서명을 출력하시오.

문제135. 이름의 첫 글자가 ‘S’로 시작하는 사원들의 이름과 월급과 부서위치를 출력하시오.

문제136. 부서번호, 부서번호별 토탈 월급을 출력하시오.

문제137. 부서위치, 부서위치별 토탈월급을 출력하시오.

문제138. 이름과 부서위치를 출력하시오.

문제139. salgrade 테이블을 생성하시오.

http://cafe.daum.net/oracleoracle

문제140. emp와 salgrade 테이블을 조인해서 이름과 월급과 급여등급을 출력하시오.

문제141. 위의 결과에서 grade가 5등급인 것만 출력하시오.

문제142. 등급(grade), 등급별로 속한 사원들의 이름을 가로로 출력하시오.

      등급 이름
---------- ----------------------------------
         1 ADAMS,JAMES,SMITH
         2 MARTIN,MILLER,WARD
         3 ALLEN,TURNER
         4 BLAKE,CLARK,FORD,JONES,SCOTT
         5 JACK,KING

문제143. 사원번호, 이름, 자기의 관리자의 사원번호를 출력하시오.

문제144. 이름, 자기의 관리자의 이름을 출력하시오.

문제145. 이름, 월급, 자기의 관리자의 이름,
        자기의 관리자의 월급을 출력하시오.

문제146. 위의 결과를 다시 출력하는데 자기의 월급이 자기의 관리자의
        월급보다 많은 월급을 받는 사원들만 출력하시오.

문제147. 자기의 관리자보다 먼저 입사한 사원들의 이름과 입사일,
        관리자 이름, 관리자의 입사일을 출력하시오.

문제148. 관리자의 이름, 해당 관리자에게 속한 사원들의 이름을 가로로 출력하시오.

■ 1999 ANSI 문법

1. on 절을 사용한 조건이

select e.ename, d.loc
from emp e join dept d 
on (e.deptno = d.deptno);

문제149. 위의 결과에서 부서위치가 DALLAS인 사원들만 출력하시오.

문제150. emp와 salgrade를 조인해서 이름과 월급과 급여등급(grade)을
        출력하는데 3등급만 출력하시오. (on절을 사용한 조인으로 수행)

■ using 절을 사용한 조건 (사용 거의 안 함)

select e.ename, d.loc
from emp e join dept d 
using (deptno);

■ natural 조인 (사용 거의 안 함)

select e.ename, d.loc
from emp e natural join dept d;

■ right/left/full outer join (자주 사용)

select e.ename, d.loc
from emp e right outer join dept d 
on (e.deptno = d.deptno);

select e.ename, d.loc
from emp e left outer join dept d 
on (e.deptno = d.deptno);

select e.ename, d.loc
from emp e full outer join dept d 
on (e.deptno = d.deptno);

문제151. emp와 salgrade와 dept를 조인해서 이름과 월급과 부서위치와
        급여등급을 출력하시오.

5번째 과제: 위의 결과를 오라클 조인 말고 on절을 사용한 조인문으로 수행하시오.
            (토요일까지 제출)