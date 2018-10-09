/*
 ■오라클 접속방법

 ▷권한이 불충분하다는 오류가 발생할 때
 SQL> connect sys/oracle as sysdba
sys: 사용자명, oracle: 비밀번호, as sysdba: 관리자 권한으로 접속

 ■ SQL (Structure Query Language)

" 데이터베이스의 데이터를 검색하거나 저장하거나 조작하는 언어 "

1. Query --> 데이터를 검색하는 문장
2. DML문 --> 데이터를 조작하는 문장
3. DDL문 --> 데이터를 저장하기 위한 구조를 관리하는 문장
4. DCL문 --> 데이터의 엑세스 권한을 관리하는 문장
5. TCL문 --> 데이터의 영구저장 또는 영구저장 취소 문장

 ▷테이블에 대한 정보를 알고 싶을 때
SQL> describe emp
*/