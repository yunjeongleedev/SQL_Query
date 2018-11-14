-- 문제133
select e.ename, e.sal, d.loc
from emp e, dept d
where e.deptno = d.deptno     --> 조인조건
and e.sal >= 2000;            --> 검색조건

-- 문제134
select e.ename, d.dname
from emp e, dept d          --> 테이블 별칭
where e.deptno = d.deptno 
and d.dname = 'SALES';

* 설명: 테이블 이름을 테이블 별칭으로 바꾸면
        원래 이름은 사용하지 못 한다.

-- 문제135
select e.ename, e.sal, d.loc
from emp e, dept d
where e.deptno = d.deptno and e.ename like 'S%';

-- 문제136
select deptno, sum(sal)
from emp
group by deptno;

-- 문제137
select d.loc, sum(e.sal)
from emp e, dept d
where e.deptno(+) = d.deptno 
group by d.loc;

* 설명
outer join: equi join으로는 볼 수 없는 결과를 볼 때 사용

-- 문제138
select e.ename, d.loc
from emp e, dept d 
where e.deptno(+) = d.deptno;

※  아웃터 조인 사인(+)은 모자란 쪽에 붙인다.

insert into emp(empno, ename, sal, deptno)
values(1929, 'JACK', 3400, 70);

commit;

select ename, deptno from emp;

select e.ename, d.loc
from emp e, dept d 
where e.deptno(+) = d.deptno(+);

위의 조인 문장은 에러가 발생한다. 만약 양쪽에 다
outer join 사인을 사용한 결과를 보고싶다면?

1991 ANSI 조인문법의 Full outer join을 사용해야 한다.

select e.ename, d.loc 
from emp e full outer join dept d 
on (e.deptno = d.deptno);


-- 문제139

drop  table  salgrade;

create table salgrade
( grade   number(10),
  losal   number(10),
  hisal   number(10) );

insert into salgrade  values(1,700,1200);
insert into salgrade  values(2,1201,1400);
insert into salgrade  values(3,1401,2000);
insert into salgrade  values(4,2001,3000);
insert into salgrade  values(5,3001,9999);

commit;

-- 문제140
select e.ename, e.sal, s.grade
from emp e, salgrade s
where e.sal between s.losal and s.hisal;

* 설명: 위와 같은 조인문법을 non equi join이라고 한다.

-- 문제141
select e.ename, e.sal, s.grade
from emp e, salgrade s
where e.sal between s.losal and s.hisal
and s.grade >= 5;

-- 문제142
select s.grade 등급,
listagg(ename, ',') within group (order by ename) 이름
from emp e, salgrade s
where e.sal between s.losal and s.hisal
group by s.grade;

-- 문제143
select empno, ename, mgr 
from emp;

-- 문제144
select 사원.ename, 관리자.ename
from emp 사원, emp 관리자 
where 사원.mgr = 관리자.empno;

※ 위와 같은 조인 방법을 self join이라고 한다.

-- 문제145
select 사원.ename, 관리자.ename, 관리자.sal 
from emp 사원, emp 관리자 
where 사원.empno = 관리자.empno;

-- 문제146
select 사원.ename, 사원.sal, 관리자.ename, 관리자.sal
from emp 사원, emp 관리자
where 사원.mgr = 관리자.empno
and 사원.sal > 관리자.sal;

-- 문제147
select 사원.ename, 사원.hiredate, 관리자.ename, 관리자.hiredate
from emp 사원, emp 관리자
where 사원.mgr = 관리자.empno
and 사원.hiredate < 관리자.hiredate;

-- 문제148
select 관리자.ename 관리자,
listagg(사원.ename, ',') within group (order by 사원.ename) 사원
from emp 사원, emp 관리자
where 사원.mgr = 관리자.empno
group by 관리자.ename;

-- 문제149
select e.ename, d.loc
from emp e join dept d 
on (e.deptno = d.deptno)   --> 조인조건은 on
where d.loc = 'DALLAS';    --> 검색조건은 where 절에 사용 

-- 문제150
select e.ename, e.sal, s.grade 
from emp e join salgrade s 
on (e.sal between s.losal and s.hisal)
where s.grade=3;

-- 문제151
select e.ename, e.sal, d.loc, s.grade
from emp e, dept d, salgrade s
where e.deptno = d.deptno
and e.sal between s.losal and s.hisal;

-- 5번째 과제
SQL 문장을 복사 붙여넣기하면 'SP2-0734' 에러가 발생합니다.
에러를 해결하기 위해 'set sqlblanklines on'을 추가했습니다.
감사합니다 :)

set sqlblanklines on
select e.ename, e.sal, d.loc, s.grade
from emp e join dept d
on (e.deptno = d.deptno)
join salgrade s
on (e.sal between s.losal and s.hisal);