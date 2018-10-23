■ trim 함수

 " 특정 철자나 공백문자 등을 문자열에서 잘라내는 함수"

예:
	insert into emp(empno, ename, sal)
		values(2929, 'JACK   ', 3400);

	commit;

	select ename, sal from emp;

문제47. 이름이 JACK인 사원의 이름과 월급을 출력하시오.

	이름을 입력할 때 공백을 넣었기 때문에 조회가 안 된다.
	* 설명: rtrim(ename) --> 오른쪽에 있는 공백문자를 잘라내겠다.
	           ltrim(ename) --> 왼쪽에 있는 공백문자들을 잘라내겠다.
	            trim(ename) --> 양쪽에 있는 공백문자들을 잘라내겠다.

■ pad 함수

	"특정 철자나 공백문자를 채워넣는 함수"

	예: select ename, lpad(sal, 10, '*')
		from emp;

	예: select ename, rpad(sal, 10, '*')
		from emp;

문제48. 이름과 월급을 출력하는데 월급을 출력할 때 전체 10자리로 잡고 
	나머지 왼쪽에 공백을 채워넣어서 출력하시오!

*설명: lpad(sal, 10, ' ') --> 월급을 출력하는데 전체 10자리로 잡고
	나머지 왼쪽에 공백을 채워넣어라~
          rpad(sal, 10, ' ') --> 월급을 출력하는데 전체 10자리로 잡고
	나머지 오른쪽에 공백을 채워넣어라~

■ replace 함수

	"특정 철자를 다른 철자로 출력하는 함수"

예: 월급을 출력하는데 월급을 암호화 해서 출력하시오~
	(숫자 0 을 * 로 출력하시오)

	select ename, replace(sal, 0, '*')
	from emp;

문제49. 이름과 월급을 출력하는데 월급을 출력할 때 숫자 0부터 3까지를 *로 출력하시오.

	*설명: regular expression (정규 표현식)
		[0-3] --> 숫자 0~3까지

	*설명: col salary for a10
		column salary의 길이를 10으로 format한다.

■ round 함수

	"반올림하는 함수"

	예: select ename, sal, sal * 1.82 as bonus
		from emp;

	예: select ename, sal, round(sal*1.82, 0) as bonus
		from emp;

	*설명: 1자리에서 0자리로 반올림한다.

       숫자:  5  4  1  4  .  5
    자릿수: -3 -2 -1 0     1

	예: select ename, sal, round(sal, -1) as bonus
		from emp;

	예: select ename, sal, round(sal) bonus
		from emp;

■ trunc

	"반올림이 아니라 버리는 함수"

	예: select ename, sal*1.82 as bonus, trunc(sal*1.82) as bonus2
	from emp;

■ mod 함수

	"나눈 나머지 값을 출력하는 함수"

	예: select mod(10, 3) from dual;

	* dual: 결과만 보기 위한 가상의 테이블

문제50. 이름과 나이를 출력하는데 나이가 짝수이면 0을 출력하고
	나이가 홀수이면 1을 출력하시오. (우리반 테이블)

■ months_between 함수

	"날짜와 날짜 사이의 개월수를 출력하는 함수"

	예: 날짜 - 숫자 = 날짜
	     날짜 + 숫자 = 날짜
	     날짜 - 날짜 = 숫자

■ 오늘 날짜 확인하는 키워드

	select sysdate from dual;

문제51. 이름, 입사한 날짜부터 오늘까지 총 몇 일 근무했는지 출력하시오.

문제52. 이름, 입사한 날짜부터 오늘까지 총 몇 달 근무했는지 출력하시오.

문제53. 이름, 입사한 날짜부터 오늘까지 총 몇 년 근무했는지 출력하시오.

■ add_months 함수

	"날짜에서 개월 수를 더한 날짜를 출력하는 함수"

	예: select sysdate, add_months(sysdate, 100)
		from dual;

	*설명: 오늘 날짜에서 100달을 더한 날짜

■ next_day 함수

	"특정 날짜에서 미래에 돌아올 특정 요일의 날짜를 출력하는 함수"

	예: select sysdate, next_day(sysdate, '금')
		from dual;

문제54. 오늘부터 100달 뒤에 돌아올 월요일의 날짜를 출력하시오.

■ last_day 함수

	"해당 날짜의 달의 마지막 날짜(말일)를 출력하는 함수"

	예: select sysdate, last_day(sysdate)
		from dual;

문제55. 오늘부터 이번 달 말일까지 총 몇 일 남았는가?

■ to_char 함수

	날짜형 데이터 -----------------------> 문자형 데이터
			변환
	숫자형 데이터 -----------------------> 문자형 데이터
			변환

	예: 오늘이 무슨 요일인지 출력하시오.

	select sysdate, to_char(sysdate, 'day') from dual;

문제56. 내가 무슨 요일에 태어났는지 알아내시오.(emp_sql 테이블 이용)

문제57. 이름과 내가 태어난 요일을 출력하는데 일월화수목금토로
	정렬이 되어서 출력하시오.

문제58. 이름과 내가 태어난 요일을 출력하는데 월화수목금토일로
	정렬이 되어서 출력하시오.