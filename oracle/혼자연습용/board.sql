ALTER SESSION SET "_ORACLE_SCRIPT"=true;
-- spring �� ��������
CREATE USER site IDENTIFIED BY site;
-- id: jdbc pw: jdbc
GRANT CONNECT, RESOURCE TO site;
--���� ����
GRANT UNLIMITED TABLESPACE TO site;
--���̺� �����̽� ���Ѽ���