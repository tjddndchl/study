/*���� ����*/
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
--���� ���� id:study/pw:study
CREATE USER study IDENTIFIED BY study;
--���� ����
GRANT CONNECT, RESOURCE TO study;
--���̺� �����̽� ���� ����
GRANT UNLIMITED TABLESPACE TO study;