ALTER SESSION SET "_ORACLE_SCRIPT"=true;
-- spring �� ��������
CREATE USER test IDENTIFIED BY test;
-- id: jdbc pw: jdbc
GRANT CONNECT, RESOURCE TO test;
--���� ����
GRANT UNLIMITED TABLESPACE TO test;
--���̺� �����̽� ���Ѽ���

drop sequence seq_quiz_num;
drop table quiz;

--------------------------------------------------------------
-- jdbc���� ȸ�� ���̺� ����

drop table quiz;
CREATE TABLE QUIZ (
    quiz_num NUMBER PRIMARY KEY, -- ��Ű ����
    quiz_pb VARCHAR2(2000) UNIQUE, -- �ߺ��� ������� �ʴ� ���� ���� ���� ����
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


		SELECT   quiz_num
            	,quiz_pb
            	,quiz_ans
		FROM quiz
        WHERE quiz_num=7;

commit;




--member ���̺����


CREATE TABLE members(
     mem_id VARCHAR2(100) PRIMARY KEY
    ,mem_pw VARCHAR2(100)
    ,mem_name VARCHAR2(100)
);

INSERT INTO members(
    mem_id 
    ,mem_pw
    ,mem_name
) VALUES (
    'admin'
    ,'admin'
    ,'������'
);

SELECT 
    mem_id
    ,mem_pw
    ,mem_name
FROM members;



commit;
