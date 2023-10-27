CREATE TABLE member(
    mem_id VARCHAR2(100) PRIMARY KEY
    ,mem_pw VARCHAR2(100)
    ,mem_nm VARCHAR2(100)
);

--member ���̺����
--board ���̺� del_yn �߰�

INSERT INTO member (mem_id, mem_pw, mem_nm)

VALUES('admin', 'admin', '������');

alter table board add del_yn varchar2(1) default 'N';

CREATE TABLE board(
    board_no NUMBER(10) PRIMARY KEY
    ,board_title VARCHAR2(1000)
    ,board_content VARCHAR2(4000)
    ,mem_id VARCHAR2(100)
    ,create_date DATE DEFAULT SYSDATE
    ,update_date DATE DEFAULT SYSDATE
);
INSERT INTO board(board_no, board_title, board_content, mem_id)
VALUES ((SELECT NVL(MAX(board_no), 0) + 1
            FROM board)
            ,'��������'
            ,'ù��° ��'
            ,'admin');
            
    
            
select *
from member;

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
	AND a.del_yn = 'N'
	ORDER BY a.update_date DESC;