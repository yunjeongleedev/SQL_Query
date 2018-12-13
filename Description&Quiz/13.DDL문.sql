■ SQL 배운 내용 총 복습
1. SQL을 왜 배워야 하는지?
 “경영 데이터를 분석하기 위해서”
2. SQL이 무엇인지?
 “데이터를 검색하고, 조작하는 언어”
3. SQL의 종류
 - Query 문 : 함수, 조인, 서브쿼리, 데이터 분석함수, 집합연산자, 레포팅 함수
 - DML문 : insert, update, delete, merge
 - DDL문 : create, alter, drop, turncate, rename
 - DCL문 : grant, revork
 - TCL문 : commit, rollback, savepoint

■ DDL문 (Data Definition Language)
 “데이터를 저장하고 관리하는 object를 생성하고 수정, 삭제하는 언어”
* 테이블 생성 방법

create table emp55
(empno number(10),
ename varchar2(10),
sal number(10));

select * from emp55;

※ 설명 : 1. 테이블명과 컬럼명 지을 때 주의 사항? 반드시 문자로 시작해야 한다. 20자 이내여야 한다.
emp55 (테이블명) | empno,ename, sal (컬럼명) | number(10), .. (데이터 타입)
2. 데이터 타입 3가지 : 문자형 : varchar2, char, long(긴 텍스트), clob(이미지), dlob(영상)
         숫자형: number
         날짜형 : date
                ()은 몇자리
- 긴 텍스트(ex.자기소개서)를 테이블에 저장할 때
- lob(clob, blob) : 이미지(clob), 영상(blob)을 저장할 때

문제241. 아래의 테이블을 생성하시오.

    테이블명 :emp56
    컬럼명 : empno, ename, sal, job, hiredate

문제242. 위에서 만든 emp56 테이블에 임의로 데이터를 입력하시오.

■ long 데이터 타입

 "아주 긴 텍스트를 저장할 때 사용하는 문자형 데이터 타입” 4GB 바이트까지 데이터를 저장할 수 있다."

 예제 :  create table emp57
        (ename varchar2(20),
        intro_senario long);

        insert into emp57(ename, intro_senario)
        values(‘강용규’, ‘어렸을때부터 우리집은 가난했었고 어머니는 짜장면이 싫다고 하셨어, 야이 야이야’);
        set long 5000

문제243. 아래의 테이블을 생성하시오.
 
 테이블명 : emp59
  컬럼명 :  empno
            ename
            mobile
            telecom
            email
            address

문제244. 위의 테이블에 여러분 개인 정보를 입력하시오~

■ 컬럼 변경

- 컬럼 변경: 컬럼의 데이터 타입의 길이를 늘리거나 줄이는 작업

    alter table emp59
    modify address varchar2(300);

    desc emp59

- 컬럼 추가

    alter table emp59
    add sal number(10);

    desc emp59

- 컬럼 삭제: 

    alter table emp59
    drop column mobile;

    desc emp59

- 내가 만든 테이블 보기

    select *
    from tab;

문제245. emp 테이블에 email 컬럼을 추가하시오.

alter table emp
add email varchar2(50);

문제246. emp 테이블에서 KING의 이메일을 oracle1234@gmail.com으로 변경하시오.

문제247. emp 테이블에 sal 컬럼을 삭제하시오. (rollback 불가)
sqlplus scott/tiger
connect scott/tiger

alter table emp
drop column sal;

desc emp

* DDL 명령어: create, alter, drop, truncate, rename

※ 오라클에서 데이터를 삭제하는 명령어 3가지

    1. delete from emp
    2. truncate table emp
    3. drop table emp

                delete     truncate        drop 

1. 데이터        삭제        삭제            삭제
2. 저장공간      유지        삭제            삭제
3. 저장구조      유지        유지            삭제
4. 롤백 여부     가능        불가능          불가능


■ rename 명령어

emp 테이블의 이름을 emp900 으로 변경해라.

rename emp to emp900;

문제248. emp900 테이블의 이름을 emp 로 변경해라.

■ 서브쿼리문을 사용한 create 문

create table emp_backup
as select *
from emp;

select * from emp_backup;

문제250. emp_backup 테이블명을 emp로 변경하시오.

■ DCL 문 (Data Control Language)

1. grant: 권한을 부여하는 명령어
2. revoke: 권한을 취소하는 명령어

▷ 유져 생성

sys는 최고 권한자

create user scott
identified by tiger;

grant dba to scott;

connect scott/tiger

create user king 
identified by tiger;

grant connect to king;

connect king/tiger

처음에 db 접속 시: sqlplus king/tiger

문제251. 다시 scott 유져로 접속해서 king에게 테이블을 생성할 수 있는
        권한을 부여하시오.

문제252. 다시 scott 유져로 접속해서 king에게 테이블을 생성할 수 있는
        권한을 취소하시오.

* 기말고사 문제 유형

유형1: 컬럼을 추가하고 추가한 컬럼에 값을 갱신한다.
유형2: 레포팅 함수(rollup, cube, grouping sets)
        결과 보여주고 쿼리를 짜는 문제
유형3: 조인, 서브쿼리, 집합연산자 등을 가지고 결과 보여주고
        쿼리를 짜는 문제
유형4: 여러분이 만든 창의적 문제를 다음주 월요일까지 메일로 보내주면
        이름과 같이 시험문제로 출제 (시험).

    10 ~ 15문제 사이
다음주 수요일 (12월 19일) 저녁 7시 30분

가장 좋은 시험공부법: DDL과 DML을 연결하는 것 같은 방식으로 문제를 만들어보기