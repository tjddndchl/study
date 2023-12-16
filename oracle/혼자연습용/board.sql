ALTER SESSION SET "_ORACLE_SCRIPT"=true;
-- spring 쪽 계정생성
CREATE USER site IDENTIFIED BY site;
-- id: jdbc pw: jdbc
GRANT CONNECT, RESOURCE TO site;
--권한 설정
GRANT UNLIMITED TABLESPACE TO site;
--테이블 스페이스 권한설정