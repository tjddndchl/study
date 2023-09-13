ALTER SESSION SET "_ORACLE_SCRIPT"=true;
-- spring 쪽 계정생성
CREATE USER test IDENTIFIED BY test;
-- id: jdbc pw: jdbc
GRANT CONNECT, RESOURCE TO test;
--권한 설정
GRANT UNLIMITED TABLESPACE TO test;
--테이블 스페이스 권한설정

--------------------------------------------------------------
-- jdbc계정 회원 테이블 생성
CREATE TABLE QUIZ(
        quiz_num NUMBER
     ,quiz_pb VARCHAR2(100) 
    ,quiz_ans VARCHAR2(100)
    
);

