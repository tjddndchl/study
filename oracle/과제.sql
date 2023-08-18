/*계정 생성*/
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
--계정 생성 id:study/pw:study
CREATE USER study IDENTIFIED BY study;
--권한 설정
GRANT CONNECT, RESOURCE TO study;
--테이블 스페이스 접근 권한
GRANT UNLIMITED TABLESPACE TO study;