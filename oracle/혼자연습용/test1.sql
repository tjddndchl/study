ALTER SESSION SET "_ORACLE_SCRIPT"=true;
-- spring �� ��������
CREATE USER test IDENTIFIED BY test;
-- id: jdbc pw: jdbc
GRANT CONNECT, RESOURCE TO test;
--���� ����
GRANT UNLIMITED TABLESPACE TO test;
--���̺� �����̽� ���Ѽ���

--------------------------------------------------------------
-- jdbc���� ȸ�� ���̺� ����
CREATE TABLE QUIZ(
        quiz_num NUMBER
     ,quiz_pb VARCHAR2(100) 
    ,quiz_ans VARCHAR2(100)
    
);

