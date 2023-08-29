select * from all_users;
alter session set "_ORACLE_SCRIPT"=true;
--1��
create user java2 IDENTIFIED BY oracle;

--2��
grant CONNECT, RESOURCE, dba to java2;





--����3��
CREATE TABLE EX_MEM ( 
	MEM_ID		  VARCHAR2(10) NOT NULL,
	MEM_NAME	  VARCHAR2(20) NOT NULL,
	MEM_JOB	  VARCHAR2(30),
	MEM_MILEAGE	NUMBER(2,8),
	MEM_REG_DATE  DATE default SYSDATE
    );
    
ALTER TABLE EX_MEM ADD CONSTRAINT pk_EX_MEM PRIMARY KEY (MEM_ID);

--����4��
ALTER TABLE EX_MEM MODIFY (MEM_NAME VARCHAR2(50));

--����5�� 1000���� �����Ͽ� 9999���� ��ȯ�ϴ� SEQ_CODE ����������
CREATE SEQUENCE seq_code
    START WITH 1000
    INCREMENT BY 1
    MAXVALUE 9999
    CYCLE
    NOCACHE
    NOORDER;
    
    --6�� ex_mem ���̺� ���� ������ �Է��ϴ� SQL�� �ۼ��Ͻÿ�
    
    INSERT INTO EX_MEM VALUES ('hong','ȫ�浿','�ֺ�',null,sysdate);
    

--7��
select * from member;

SELECT mem_id
            ,mem_name
            ,mem_job
            ,mem_mileage
FROM member
where mem_like in ('���', '����', '�ٵ�');


--8��
SELECT * from ex_mem;
delete from ex_mem 
WHERE mem_name LIKE '��%';


--9��

select mem_id
        ,mem_name
        ,mem_job
        ,mem_mileage
from member
WHERE mem_job = '�ֺ�'
AND mem_mileage>= 1000 
AND mem_mileage <= 3000;


--11��

SELECT prod_id,prod_name,prod_sale
FROM prod
WHERE prod_sale = 23000 
or prod_sale = 26000
or prod_sale =33000;


--12��

SELECT mem_job
            ,COUNT(mem_job) MEM_CNT
            ,TO_CHAR(MAX(mem_mileage),'9,999') MAX_MLG
            ,TO_CHAR(AVG(mem_mileage),'9,999') AVG_MLG
FROM member

GROUP BY mem_job
HAVING COUNT(mem_job) >= 3;

--13��

SELECT mem_id
            ,mem_name
            ,mem_job
            ,cart_prod
            ,cart_qty
from member a,cart b
WHERE a.mem_id = b.cart_member
AND SUBSTR(b.cart_no,1,8) = '20050728';


--14��

SELECT mem_id
            ,mem_name
            ,mem_job
            ,cart_prod
            ,cart_qty
from member a
INNER JOIN cart b
ON a.mem_id = b.cart_member
WHERE SUBSTR(b.cart_no,1,8) = '20050728';


--15��

SELECT mem_id
            ,mem_name
            ,mem_job
            ,mem_mileage
            ,RANK() OVER(PARTITION BY mem_job ORDER BY mem_mileage DESC) as MEM_RANK
FROM member;