■ 지난주까지 배운 내용

1. 기본 SQL Query문

2. 연산자
	- 산술 연산자
	- 비교 연산자
	- 논리 연산자

3. 기타 비교연산자
	- between .. and
	- like
	- in
	- is null

4. 데이터 정렬
	- order by 절

문제36. 월급이 1000에서 3000 사이인 사원들의 이름과 월급을 출력하는데 월급이 높은 사원부터 출력하시오.

■ 함수

 * 함수가 왜 필요한가 ?

	"데이터 검색을 쉽게 하기 위해서 필요하다."

	"복잡한 데이터 속에서 어떤 패턴을 찾을 때 유용하다."

	데이터 (하나의 행) ---> 함수 ---> 결과 데이터

 * 함수의 종류 2가지

1. 단일행 함수

	데이터 (하나의 행) ---> 함수 ---> 결과

2. 복수행 함수

	데이터 (여러 개의 행) ---> 함수 ---> 결과

■ 단일행 함수

 1. 문자함수: upper, lower, initcap, substr(중요), replace, 
	      ltrim, rtrim,lpad, rpad, instr, length
 2. 숫자함수: round, trunc, mod
 3. 날짜함수: months_between(중요), add_months, next_day, last_day
 4. 변환함수: to_char(중요), to_number, to_date(중요)
 5. 일반함수: nvl(중요), nvl2, decode(중요), case(중요)

■ upper 함수

 " 대문자로 출력하는 함수 "

예) select ename, upper(ename)
	from emp;

■ lower 함수

 " 소문자로 출력하는 함수"

예) select ename, lower(ename)
	from emp;

■ initcap 함수

 " 첫 번째 철자는 대문자로 출력하고 나머지는 소문자로 출력하는 함수 "

예) select ename, initcap(ename)
	from emp;

문제37. 이름이 scott인 사원의 이름과 월급을 출력하시오.
	( scott 을 소문자로 검색해도 검색되게 하시오. )

■ substr 함수

 " 문자열에서 특정 자리의 철자만 출력하고자 할 때 사용하는 함수 "

예: select ename, substr(ename, 1, 3)
	from emp;

	첫 번째 자리부터 세 자리를 출력
        K(1) I(2) N(3) G(4)

문제38. 이름의 첫 번째 철자만 출력하는데 소문자로 출력하시오.

문제39. 이름의 두 번째 철자부터 끝까지를 소문자로 출력하시오.

■ 연결 연산자: ||

	예) select ename || sal
		from emp;

문제40. 아래의 initcap 함수를 쓴 결과를 initcap 사용하지 말고 upper, lower, substr, || 를 사용해서 출력하시오.

	select initcap(ename)
	from emp;

■ instr 함수

 " 특정 철자의 자리의 위치숫자(인덱스)를 출력하는 함수 "

예: select ename, instr( ename, 'A')
	from emp;

문제41. 우리반 테이블을 생성하고 하나의 데이터 열을 추가하시오.

문제42. 이름과 나이를 출력하는데 나이가 높은 학생부터 출력하시오.

문제43. 서울에 사는 학생들의 이름과 주소를 출력하시오.

문제44. 서울이 아닌 곳에서 사는 학생들의 이름과 주소를 출력하시오.

문제45. 나이가 25 에서 28 사이인 학생들의 이름과 나이를 출력하시오.

■ length

 " 철자의 갯수를 세는 함수 "

예: select ename, email, length(email)
	from emp_sql;

-----의 갯수를 줄이고 싶을 때

	col email for a30
	/

문제46. 이메일에서 @ 가 있는 위치의 인덱스를 출력하시오.
	(instr 이용해서)

문제47. 이름과 이메일에서 아래의 철자만 출력하시오.

○○○ gmail
○○○ naver
○○○ naver
○○○ daum

    :
    :

○○○ gmail