■ 지난 내용 복습

1. 오라클 설치
2. SQL의 종류
3. 기본 Query문 --> 데이터 검색능력 향상

문제11. 부서번호가 30번인 사람들의 이름과 월급과
          직업과 부서번호를 출력하시오.

문제12. 커미션이 300인 사원들의 이름과 커미션을 출력하시오.

select ename, comm  --- 컬럼명
from emp               --- 테이블명
where comm = 300;  ---검색조건

문제13. 이름이 ALLEN인 사원의 이름과 월급을 출력하시오.

* 설명: 문자 데이터를 검색할 때는 'ALLEN' 양쪽에 싱글 쿼테이션
          마크를 사용해야 하고 문자가 대문자로 저장되어 있으면
          대문자로 검색해야 한다.

# 연산자 3가지 종류

1. 산술연산자: * / + -
2. 비교연산자: >, <, >=, <=, =, !=, <>, ^=

문제14. 월급이 2000이상인 사원들의 이름과 월급을 출력하시오.

문제15. 직업이 SALESMAN이 아닌 사원들의 이름과 직업을 출력하시오.

문제16. 입사일이 81년 11월 17일인 사원의 이름과 입사일을 출력하시오.

* 설명: 날짜를 검색할 때는 년도/월/일 로 작성하고 양쪽에
         싱글 쿼테이션 마크를 써줘야 한다.

          문자와 날짜는 양쪽에 싱글 쿼테이션 마크를 써줘야 한다.

문제17. 직업이 SALESMAN이고 월급이 1000이상인 사원들의 이름과 월급과 직업을 출력하시오.

문제18. 월급이 1200 이상이고 부서번호가 20번인 사원들의 이름과 월급과 직업과 부서번호를 출력하시오.

문제19. 월급이 1000에서 3000 사이인 사원들의 이름과 월급을 출력하시오.

# 기타 비교 연산자

1. between .. and
2. in
3. is null
4. like

문제20. 월급이 1000에서 3000 사이가 아닌 사원들의 이름과 월급을 출력하시오.

문제21. 81년 1월 1일에서 81년 12월 31일 사이에 입사한 사원들의 이름과 입사일을 출력하시오.

문제22. 82년도에 입사하지 않은 사원들의 이름과 입사일을 출력하시오.

문제23. 부서번호가 10번, 20번인 사원들의 이름과 부서번호를 출력하시오.

문제24. 직업이 SALESMAN, ANALYST, CLERK인 사원들의 이름과 월급과 직업을 출력하시오.

문제25. 직업이 SALESMAN, ANALYST, CLERK가 아닌 사원들의 이름과 월급과 직업을 출력하시오.

문제26. 이름의 첫글자가 S로 시작하는 사원들의 이름을 출력하시오.

like: ~일 것 같은
%: 와일드카드(이 자리에 어떠한 문자나 숫자가 와도 관계없고 그 갯수가 몇 개이든 관계없다.

문제27. 이름의 끝글자가 T로 끝나는 사원들의 이름을 출력하시오.

문제28. 이름의 두 번째 철자가 M인 사원들의 이름을 출력하시오.

* 설명: like와 같이 쓸 수 있는 옵션 2가지
	1. %(와일드카드)
	2. _(언더바): 이 자리에 뭐가 와도 관계없는데 갯수는 
		한 개여야 한다.

문제29. 이름의 세 번째 철자가 L인 사원들의 이름을 출력하시오.

문제30. 커미션이 null인 사원들의 이름과 커미션을 출력하시오.

문제31. 커미션이 null이 아닌 사원들의 이름과 커미션을 출력하시오.

# 데이터 정렬

 "order by 절"

예제: 이름과 월급을 출력하는데 월급이 낮은 사원부터 높은 사원 순으로 정렬해서 출력하시오.

select ename, sal
from emp
order by sal asc; --- 컬럼명 반드시 작성

옵션: 1. asc: 낮은값부터 높은값 순으로 정렬하라.
       2. desc: 높은값부터 낮은값 순으로 정렬하라.

문제32. 이름과 입사일을 출력하는데 최근에 입사한 사원부터 출력하시오.

* 하나의 페이지에 데이터를 출력하고 싶을 때
	set pages 4000
	set lines 4000
	/                   --- 직전에 실행한 sql문을 실행

문제33. 직업이 SALESMAN인 사원들의 이름과 월급을 출력하는데 월급이 높은 사원부터 출력하시오.

힌트: order by절은 select문 맨 마지막에 쓴다.

* sql문을 수정하고 싶을 때
	ed           --- 단축키: alt+F4
	파일저장
	/

문제34. 81년도에 입사한 사원들의 이름과 입사일을 출력하는데 최근에 입사한 사원부터 출력하시오.

문제35. 직업이 SALESMAN과 ANALYST가 아닌 사원들 중에서 월급이 1000 이상인 사원들의 이름과 월급을 출력하는데 월급이 높은 사원부터 출력하시오.