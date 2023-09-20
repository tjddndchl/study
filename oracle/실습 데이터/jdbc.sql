ALTER SESSION SET "_ORACLE_SCRIPT"=true;
-- spring 쪽 계정생성
CREATE USER jdbc IDENTIFIED BY jdbc;
-- id: jdbc pw: jdbc
GRANT CONNECT, RESOURCE TO jdbc;
--권한 

SELECT * FROM member;
GRANT UNLIMITED TABLESPACE TO jdbc;
--테이블 스페이스 권한설정

--------------------------------------------------------------
-- jdbc계정 회원 테이블 생성
CREATE TABLE member(
    mem_id VARCHAR2(100) PRIMARY KEY
    ,mem_pw VARCHAR2(100)
    ,mem_nm VARCHAR2(100)
);

INSERT INTO member (mem_id, mem_pw, mem_nm)

VALUES('admin', 'admin', '관리자');

COMMIT;



CREATE TABLE board(
    board_no NUMBER(10) PRIMARY KEY
    ,board_title VARCHAR2(1000)
    ,board_content VARCHAR2(4000)
    ,mem_id VARCHAR2(100)
    ,create_date DATE DEFAULT SYSDATE
    ,update_date DATE DEFAULT SYSDATE
);


ALTER TABLE board 
ADD CONSTRAINT fk_board FOREIGN KEY(mem_id) REFERENCES member (mem_id);






INSERT INTO board(board_no, board_title, board_content, mem_id)
VALUES ((SELECT NVL(MAX(board_no), 0) + 1
            FROM board)
            ,'공지사항'
            ,'첫번째 글'
            ,'a001');
SELECT a.board_no
            ,a.board_title
            ,a.board_content
            ,b.mem_id
            ,b.mem_nm
            ,a.create_date
            ,a.update_date
FROM board a
        , member b
WHERE a.mem_id = b.mem_id
ORDER BY a.update_date DESC;

SELECT NVL(MAX(board_no), 0) + 1
FROM board;

commit;
 SELECT a.board_no
         ,a.board_title
         ,a.board_content
         ,b.mem_id
         ,b.mem_nm
         ,a.create_date
         ,a.update_date
	FROM board a
     	 , member b
	WHERE a.mem_id = b.mem_id
	ORDER BY a.update_date DESC;
    
    
 SELECT a.board_no
         ,a.board_title
         ,a.board_content
         ,b.mem_id
         ,b.mem_nm
         ,a.create_date
         ,a.update_date
	FROM board a
     	 , member b
	WHERE a.mem_id = b.mem_id
	AND a.board_no = 1;
    
    
select *
FROM reserv;
   
   
   
SELECT TO_CHAR(sysdate, 'YYYYMMDD') as today
    ,TO_CHAR(TO_DATE('06:00', 'HH24:MI') + (level-1)*(1/48), 'HH24:MI') as st_dt
    ,TO_CHAR(TO_DATE('06:30', 'HH24:MI')+ (level-1)*(1/48), 'HH24:MI') as en_dt
    ,level
FROM dual
CONNECT BY level <= 37;
)a,
    reserv b
WHERE a.today = b.reserv_date(+)
AND a.st_dt = b.start_date(+);
CREATE TABLE RESERV(
    reserv_no NUMBER
    ,reserv_date varchar2(8)
    ,start_date VARCHAR2(5)
    ,end_date varchar2(5)
    ,reserv_yn varchar2(1) default 'Y'
    ,update_date date default sysdate
    
);

INSERT INTO RESERV(reserv_no, reserv_date, start_date, end_date)
VALUES (1, '20230920', '18:00', '18:30');
