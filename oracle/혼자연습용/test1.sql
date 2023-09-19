ALTER SESSION SET "_ORACLE_SCRIPT"=true;
-- spring 쪽 계정생성
CREATE USER test IDENTIFIED BY test;
-- id: jdbc pw: jdbc
GRANT CONNECT, RESOURCE TO test;
--권한 설정
GRANT UNLIMITED TABLESPACE TO test;
--테이블 스페이스 권한설정

drop sequence seq_quiz_num;
drop table quiz;

--------------------------------------------------------------
-- jdbc계정 회원 테이블 생성

drop table quiz;
CREATE TABLE QUIZ (
    quiz_num NUMBER PRIMARY KEY, -- 주키 설정
    quiz_pb VARCHAR2(2000) UNIQUE, -- 중복을 허용하지 않는 고유 제약 조건 설정
    quiz_ans VARCHAR2(2000)
);

CREATE SEQUENCE SEQ_QUIZ_NUM
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  CACHE 20;
  
select * FROM quiz;


INSERT INTO quiz (quiz_num, quiz_pb, quiz_ans)
VALUES (10, 10, 10);


SELECT quiz_num
            ,quiz_pb
            ,quiz_ans
FROM quiz;

commit;