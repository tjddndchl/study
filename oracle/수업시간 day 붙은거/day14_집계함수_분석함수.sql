
SELECT   b.*
            
FROM(
SELECT a.*
            ,DENSE_RANK() OVER(PARTITION BY a.����
                                                ORDER BY a.���� DESC) as DENSE_����
            ,DENSE_RANK() OVER(
                                                ORDER BY a.���� DESC) as DENSE_ALL_RANK
            ,COUNT(*) OVER() as ��ü�л���
            ,AVG(a.����) OVER() as ��ü���
FROM �л� a

)   b
WHERE DENSE_���� = 1;


/*
    �ο�ս� ���� ���谪 ����
    partition by ���� window ���� Ȱ���Ͽ� ���� ���踦 �� �� ����,
    AVG,SUM,MAX,MIN,COUNT,RANK,DENSE_RANK,LAG,ROW_NUMBER,,,,,
    PARTITION BY �� : ��� ��� �׷�
    ORDER BY      �� : ��� �׷쿡 ���� ����
    WINDOW        ��  : ��Ƽ������ ���ҵ� �׷쿡 ���� �� ���� �׷����� ����

*/


-- CART, PROD ��ǰ�� prod_sale �հ��� ���� 10�� ��ǰ�� ����Ͻÿ�






SELECT *
FROM(
SELECT  c.* 
            ,RANK() OVER(ORDER BY sale_sum DESC) as rnk
FROM(
SELECT  a.cart_prod
            , b.prod_name
         
            ,SUM(a.cart_qty*b.prod_sale)    as sale_sum        
              
FROM cart a,prod b
WHERE a.cart_prod = b.prod_id
GROUP BY  a.cart_prod
            , b.prod_name) c
)

WHERE RNK <= 10;


--�����Լ� + �м��Լ� (ǥ���ſ� �°� ����ϸ��)

SELECT * 
FROM(
SELECT  a.cart_prod
            , b.prod_name
            ,SUM(a.cart_qty*b.prod_sale)
            ,RANK() OVER(ORDER BY SUM(a.cart_qty*b.prod_sale) DESC)  as rnk  --�ѹ���      
              
FROM cart a,prod b
WHERE a.cart_prod = b.prod_id
GROUP BY  a.cart_prod
            , b.prod_name
)
WHERE rnk <= 10;


/*
    NTILE(exper) ��Ƽ�Ǻ��� expr ��õ� ����ŭ ������ ����� ��ȯ
    NTILE(3) 1~3 �� ���� ��ȯ(�����ϴ� ���� ��Ŷ �� �����);
    NTILE(4) -> 100/4 -> 25% �� ���� ����
*/
SELECT emp_name, salary, department_id
            ,NTILE(2) OVER(PARTITION BY department_id ORDER BY salary DESC) group_num
            ,COUNT(*) OVER(PARTITION BY department_id) as �μ�������
FROM employees
WHERE department_id IN(30,60);

--��ü ������ �޿��� 10������ ���������� 1������ ���ϴ� ������ ��ȸ�Ͻÿ�

SELECT emp_name, salary
            ,NTILE(10) OVER(ORDER BY salary DESC) as ����
FROM employees;




--����Ŭ ������
CREATE TABLE temp_team AS
SELECT nm
            ,NTILE(6)  OVER (ORDER BY DBMS_RANDOM.VALUE) as team
FROM tb_info;


SELECT DBMS_RANDOM.VALUE() as "0~1"--���� ��������
            ,ROUND(DBMS_RANDOM.VALUE() * 10) as "0~10" --���� ��������
FROM dual;


CREATE TABLE tb_sample AS
SELECT ROWNUM as seq
            ,'2023' || LPAD(CEIL(ROWNUM/1000), 2, '0') as month
            ,ROUND(DBMS_RANDOM.VALUE(100, 1000)) as amt
FROM dual
CONNECT BY LEVEL <= 10;
SELECT * FROM tb_sample;

SELECT DBMS_RANDOM.STRING('U', 5)--���ĺ� �빮�� 5�ڸ� ��������
            ,DBMS_RANDOM.STRING('L', 5)--�ҹ���
            ,DBMS_RANDOM.STRING('A', 5)--��ҹ���
            ,DBMS_RANDOM.STRING('X', 5)--���ĺ� �빮�� & ����
            ,DBMS_RANDOM.STRING('P', 10)--��ҹ���, ����,Ư������
FROM dual;



SELECT emp_name, department_id, salary
            ,LAG(emp_name, 1, '�������') OVER(PARTITION BY department_id
                                                                    ORDER BY salary DESC) as emp_lag
            ,LEAD(emp_name, 1, '���峷��') OVER(PARTITION BY department_id
                                                                    ORDER BY salary DESC) as emp_lead
FROM employees;



/*
    �л��� ������ �������� �Ѵܰ� ���� �л��� ������ ���̸� ����Ͻÿ�.
    ���� �̸� ����    ������������ ����
    1�� �ؼ� 4.5       0
    2�� �浿 4.3       0.2
    3�� ���� 3.0       1.3
*/



SELECT �̸�
            ,ROUND(����,2) as ������
            ,LAG(�̸�,1,'����') OVER(ORDER BY ���� DESC) �����л�
            ,ROUND(LAG(����,1,����) OVER(ORDER BY ���� DESC)- ����,2) ������������
FROM �л�;



SELECT * 
FROM tb_user;

/*
    1.ȸ���� �Խ��ǿ� �Խñ��� �ۼ��Ҽ��ִ�.
    2.ȸ���� �ۼ��� �Խñۿ� ����� �ۼ��Ҽ� �ִ�.
    �Խ��ǿ��� ����, �۳���, �ۼ���, �ۼ���,������ ������ �־���Ѵ�.
    
     ȸ�� -n �Խ���                    ���̺�
     
     
    �۹�ȣ                 bbs_no               NUMBER                         PK
    ���� �۹�ȣ          parent_no            NUMBER                         FK
    ����                    bbs_title              VARCHAR2(1000)                                 NOT NULL
    �۳���                 bbs_content        VARCHAR2(4000)                                  NOT NULL
    �ۼ���                 author_id             VARCHAR2(100)                                   NOT NULL
    ��������              create_dt             TIMESTAMP                                          DEFAULT
    ��������              update_dt            TIMESTAMP                                          DEFAULT
    
*/



CREATE TABLE bbs(
            bbs_no               NUMBER             PRIMARY KEY
            ,parent_no            NUMBER                         
            ,bbs_title              VARCHAR2(1000)     DEFAULT NULL --����� ��� null
            ,bbs_content        VARCHAR2(4000)     NOT NULL
             ,author_id             VARCHAR2(100)     
             ,create_dt             TIMESTAMP            DEFAULT CURRENT_TIMESTAMP--����� ������ �ð�
            ,update_dt            TIMESTAMP            DEFAULT CURRENT_TIMESTAMP
            ,CONSTRAINT fk_parent FOREIGN KEY(parent_no) 
            REFERENCES bbs(bbs_no) ON DELETE CASCADE
            --�Խñ��� no�� �����ϰ� ���� ������ ������ ���� ����
            ,CONSTRAINT fk_user FOREIGN KEY(author_id) 
             REFERENCES tb_user(user_id) ON DELETE CASCADE--���� Ż��� ���� ����


);

--�Խñ۹�ȣ ������

CREATE SEQUENCE bbs_seq START WITH 1 INCREMENT BY 1;

INSERT INTO bbs(bbs_no, bbs_title, bbs_content, author_id)
VALUES(bbs_seq.NEXTVAL,'��������','������ �ݿ��� �Դϴ�.!!!!!','a001');

INSERT INTO bbs(bbs_no, bbs_title, bbs_content, author_id)
VALUES(bbs_seq.NEXTVAL,'�Խñ�1','�Խñ� 1�Դϴ�.','b001');

INSERT INTO bbs(bbs_no, parent_no, bbs_content, author_id)
VALUES(bbs_seq.NEXTVAL, 1,'�� �������̿���.....','x001'); 


SELECT * FROM bbs;

SELECT 
          level
           , bbs_no            
            ,parent_no                               
            ,bbs_title             
            ,bbs_content       
             ,author_id          
             ,create_dt             
            ,update_dt         
            
FROM bbs
START WITH bbs_no = 1
CONNECT BY PRIOR bbs_no = parent_no ;


SELECT * FROM tb_user;


SELECT *
FROM user_tab_columns
WHERE table_name = 'TB_USER';

SELECT user_id
            ,user_nm
            ,user_pw
            ,user_mileage           
FROM tb_user
WHERE user_id = 'b001';

SELECT * FROM tb_user;
INSERT INTO  tb_user(user_id, user_nm, user_pw, update_dt)
VALUES(?, ?, ?, SYSDATE);

SELECT rownum                  as rnum
            ,COUNT(*) OVER() as all_cnt
            ,a.bbs_no               as bbs_no
            ,a.bbs_title              as bbs_title
            ,a.author_id             as  author_id
            ,a.update_dt            as  update_dt

FROM(   SELECT  bbs_no
            ,bbs_title
            ,author_id
            ,TO_CHAR(update_dt,'YYMMDD HH24:MI:SS') as update_dt
FROM bbs
WHERE parent_no IS NULL
ORDER BY update_dt DESC) a
;


SELECT *
FROM user_tab_columns
WHERE table_name = 'BBS';

select * FROM bbs;

SELECT bbs_no
            ,parent_no
            ,bbs_title
            ,bbs_content
            ,author_id
            ,create_dt
            ,update_dt
FROM bbs
 where bbs_no= 1;   
 
 
 
	SELECT 
 	   DECODE(level, 1, '���α�','���')
 	     , bbs_no    as bbs_no         
 		
         ,LPAD(' ',5 * (level-1))|| a.bbs_content    as bbs_content         
 	    ,author_id    as author_id      
 		 ,update_dt      as update_dt   
    	FROM bbs a
 		START WITH bbs_no = 1
 		CONNECT BY PRIOR bbs_no = parent_no 
 		ORDER SIBLINGS BY update_dt desc;
        
insert into bbs(bbs_no,bbs_title,bbs_content,author_id)
select bbs_seq.nextval,'�Խñ�'||level,'����'||level,'a001'
from dual
connect by level <=100;
commit;






