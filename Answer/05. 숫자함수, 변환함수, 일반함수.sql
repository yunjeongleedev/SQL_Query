-- 문제59.
select sysdate
from dual;

-- 문제60.
select to_char(sysdate, 'RRRR/MM/DD HH24:MI:SS')
from dual;

-- 문제61.
select ename, birth, to_char(birth, 'RRRR')
from emp_sql
where to_char(birth, 'RRRR')='1991';

-- 문제62.
select ename, birth, to_char(birth, 'RRRR')
from emp_sql
where to_char(birth, 'RRRR') in ('1991', '1992');

-- 문제63.
select ename ,birth, to_char(birth, 'MM')
from emp_sql
where to_char(birth, 'MM')='08';

-- 문제64.
select ename, to_char(birth, 'MM') as birth_month
from emp_sql
order by birth_month;

실행순서: from절 --> select절 --> order by절

-- 문제65.
select ename, to_char(sal*12, '999,999')
from emp;

-- 문제66.
select ename, birth
from emp_sql
where birth = to_date('1995/08/09', 'RRRR/MM/DD');

      날짜형 = 날짜형

-- 문제67.
select ename, hiredate
from emp
where hiredate = to_date('81/05/01', 'RR/MM/DD');

-- 문제68.
select ename, hiredate
from emp
where hiredate between to_date('81/01/01', 'RR/MM/DD')
and to_date('81/12/31', 'RR/MM/DD');

select ename, hiredate
from emp
where to_char(hiredate, 'RRRR')='1981';

-- 문제69.
select ename, nvl(comm, 0)
from emp;

-- 문제70.
select ename, nvl(to_char(comm),'no comm')
from emp
--> 성공

select ename, nvl(comm, 'no comm')
from emp;         숫자     문자
--> 실패

예) select ename, nvl(job, 'no job')
    from emp;

-- 문제71.
select ename, job, decode(job, 'SALESMAN', 5000, 0) as bonus
from emp;

-- 문제72.
select ename, age, decode(age, 30, 'A', 28, 'B', 26, 'C', 'D') as 나이등급
from emp_sql;

-- 문제73.
select ename, age, case when age>=28 then 'A'
                        when age>=25 then 'B'
                        when age>=23 then 'C'
                        else 'D' end as 나이등급
from emp_sql;

    * 설명: decode는 등호(=) 비교만 가능하지만
            case는 등호(=), 부등호(>, <, >=, <=) 비교만

-- 문제74.
select ename, job, case when job='ANALYST' then 0.5*sal
                        when job='SALESMAN' then 0.8*sal
                        else 0 end as 보너스
from emp;

select ename, job, case job when 'ANALYST' then 0.5*sal
                        when 'SALESMAN' then 0.8*sal
                        else 0 end as 보너스
from emp;

select ename, job, decode(job, 'ANALYST', sal*0.5, 'SALESMAN', sal*0.8, 0) 보너스
from emp;

-- 문제75.
select ename, job, to_char(decode(job, 'ANALYST', sal*0.5, 'SALESMAN', sal*0.8, 0)
                            , '999,999') 보너스
from emp;

select ename, job, to_char(case job when 'ANALYST' then 0.5*sal
                                    when 'SALESMAN' then 0.8*sal
                                    else 0 end, '999,999') as bonus
from emp;

-- 문제76.
select ename, to_char(hiredate, 'RRRR'),
       decode(to_char(hiredate, 'RRRR'), '1981', 3000, '1982', 2000, 0) as 보너스
from emp;

-- 문제77.
select ename, to_char(birth, 'day'), address,
    case when to_char(birth, 'd') in (2, 3, 4) and address like '%서울%' then 9000
    when to_char(birth, 'd') in (5, 6, 7) and address like '%서울%' then 5000
    when to_char(birth, 'd')=1 and address like '%서울%' then 7000
    else 0 end as 보너스
from emp_sql;

select ename, to_char(birth, 'day'), address,
decode(substr(address, 1, 2), '서울', decode(to_char(birth, 'd'),
 1, 7000, 2, 9000, 3, 9000, 4, 9000, 5, 5000, 6, 5000, 7, 5000), 0) as bonus
from emp_sql;