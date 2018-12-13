-- 문제241.
create table emp56
(empno number(10),
ename varchar2(10),
sal number(10),
job varchar2(10),
hiredate date);

-- 문제242.
insert into emp56(empno,ename,sal, job, hiredate)
values(7788,'SCOTT',3000,'ANALYST',to_date('2018/12/12','RRRR/MM/DD'));

commit;

*설명: 모든 컬럼에 대해 insert할 때는 컬럼명을 안 써도 된다.

-- 문제243.
drop table emp59;

create table emp59
(empno number(10),
ename varchar2(20),
mobile varchar2(20),
telecom varchar2(10),
email varchar2(30),
address varchar2(200));

-- 문제244.
insert into emp59
values(1, '이윤정', '010-2929-2200', 'sk', 'kimyoung@naver.com', '서울시 성북구 남가좌동');

-- 문제245.
alter table emp
add email varchar2(50);

-- 문제246.
update emp
set email = 'oracle1234@gmail.com'
where ename = 'KING';

-- 문제247.
alter table emp
drop column sal;

desc emp

-- 문제248.
rename emp900 to emp;

select * from emp900;

select * from emp;

-- 문제249.
drop table emp;

-- 문제250.
rename emp_backup to emp;

-- 문제251.
connect scott/tiger

grant create table to king;
connect king/tiger

-- 문제252.
connect scott/tiger

revoke create table from king;
connect king/tiger