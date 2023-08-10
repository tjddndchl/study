/*
���̺� ���� ALTER


*/
drop TABLE ex4_1;
CREATE TABLE ex4_1(
    irum VARCHAR2(100) NOT NULL
    ,point NUMBER(5)
    ,gender CHAR(1)
    ,reg_date DATE
);
--Į���� ����
ALTER TABLE ex4_1 RENAME COLUMN irum TO nm;
--Ÿ�� ����(Ÿ�� ������ ���̺� �����Ͱ� �ִٸ� �����ؾ���)
ALTER TABLE ex4_1 MODIFY point NUMBER(10) ;
--���� ���� �߰�
ALTER TABLE ex4_1 ADD CONSTRAINT pk_ex4 PRIMARY KEY(nm);
--�÷� �߰�
ALTER TABLE ex4_1 ADD hp VARCHAR2(20);
--�÷� ����
ALTER TABLE ex4_1 DROP COLUMN hp;

COMMENT ON TABLE TB_INFO IS '�츮��';
COMMENT ON COLUMN tb_info.info_no IS '�⼮��ȣ';
COMMENT ON COLUMN tb_info.pc_no IS '��ǻ�͹�ȣ';
COMMENT ON COLUMN tb_info.nm IS '�̸�';
COMMENT ON COLUMN tb_info.email IS '�̸���';
COMMENT ON COLUMN tb_info.hobby IS '���';
COMMENT ON COLUMN tb_info.mbti IS '�긯��������ǥ';
SELECT *
    FROM all_tab_comments --���̺� �ڸ�Ʈ
    WHERE OWNER = 'JAVA';
SELECT *
    FROM all_col_comments
WHERE comments LIKE '%�̸�%';


CREATE TABLE ex4_2(
    val1 VARCHAR2(100)
    ,val2 NUMBER
    ,val3 DATE
);
INSERT INTO ex4_2(val1, val2, val3)
VALUES ('hi', 10, SYSDATE);--���ڿ� '' numberŸ���� ����
INSERT INTO ex4_2(val3, val2)
VALUES (SYSDATE, 10);   --���� �ۼ��� �÷� �������
                        --value�� INSERT
                        
SELECT * FROM ex4_2;
--���̺� ��ü�� ���� �����͸� �����Ҷ����� Į���� �Ƚᵵ ��
INSERT INTO ex4_2
VALUES ('hello', 20, SYSDATE);
INSERT INTO ex4_2
VALUES (20, SYSDATE); ---����

CREATE TABLE ex4_3(
    emp_id NUMBER
    ,emp_name VARCHAR2(1000)
);
--select - insert

INSERT INTO ex4_3(emp_id, emp_name)
SELECT employee_id
    ,emp_name
FROM employees
WHERE salary > 5000;
select *
    FROM ex4_3;
--���̺� ����

CREATE TABLE ex4_4 AS
SELECT nm, email
FROM tb_info;
SELECT *
FROM ex4_4;

UPDATE tb_info
SET hobby = '����'
    ,email = 'abdsac@gmail.com'
WHERE INFO_NO =1 ;
SELECT *
    FROM tb_info
WHERE INFO_NO =1;
UPDATE tb_info
    SET hobby = '�뷡���'
    WHERE nm = '�ּ���';
SELECT *
    FROM tb_info
WHERE nm = '�ּ���';

/*DELETE ������ ���� */
SELECT *
    FROM ex4_4;
DELETE ex4_4; -- ��ü����

DELETE ex4_4
WHERE nm = '���ؼ�';

--�ߺ����� ������ ����
SELECT distinct prod_category
    FROM products;
    
--�ǻ��÷� (���̺��� ������ �ִ°� ó�� ���);
-- Ư������� ����.
SELECT ROWNUM 
    ,  emp_name
    , email
FROM employees
-- WHERE ROWNUM =5; �ƹ��͵� �ȶ�
WHERE ROWNUM <=5555;
--NULL (IS NULL or IS NOT NULL)
SELECT *
FROM employees
WHERE manager_id IS NOT NULL;
--where manager_id = null �˻��ȵ�

SELECT *
    FROM departments
WHERE department_id NOT IN (11, 60);

/*
    oracle �����ͺ��̽� �����Լ�
    ���ڰ���
*/
SELECT LOWER('I like mac') as lowers
       ,UPPER('I like mac') as lowers
       , initcap ('I like mac') as initcaps --�ܾ� ù���� �빮��
FROM dual; --�ӽ����̺�

SELECT *
FROM employees
WHERE emp_name LIKE '%'||UPPER('f')||'%';

SELECT EMP_NAME
    ,emp_name || '�����̸�asdf123'
FROM employees;

--substr(char, pos, len)����ڿ� char�� pos��������
--len ���� ��ŭ �ڸ��� ��ȯ
--pos ������ 0 �̿��� ����Ʈ �� 1 �� ù��° ���ڿ�
--������ ���� ���ڿ��� �� ������ ������ ����� ��ġ
-- len ���� �����Ǹ� pos ��° ���ں��� ������ ��� ���ڸ� ��ȯ
SELECT SUBSTR('ABCD EFG',1, 4)
    ,SUBSTR('ABCD EFG',-3, 3)
    ,SUBSTR('ABCD EFG',-3, 1)
    ,SUBSTR('ABCD EFG',6)
FROM dual;
/* INSTR ��� ���ڿ����� ã�� ���ڿ��� ��ġ */
SELECT INSTR ('���� ���� �ܷο� ����, ���� ���� ���ο� ����','����')
    ,INSTR ('���� ���� �ܷο� ����, ���� ���� ���ο� ����','����',5)
    ,INSTR ('���� ���� �ܷο� ����, ���� ���� ���ο� ����  ����','����',1,3)
   , INSTR ('���� ���� �ܷο� ����, ���� ���� ���ο� ����',' ')--������ 0
FROM dual;


--���� �̸��� �ּ��� �̸��� �������� �и��Ͽ� ����Ͻÿ�
SELECT cust_name
     ,cust_email
     ,instr(cust_email, '@') as abc
     , substr(cust_email,1, instr(cust_email, '@') -1) as id
     , substr(cust_email,instr(cust_email, '@')+1) as domain
 FROM customers;



select nm
    ,mbti
    ,case when  substr(mbti,0,1) = 'E' then '������'
         else '������'
         
        end as ����������
  
     ,case  when  substr(mbti,2,1) = 'S' then '����'
            else '����'
        end as �νĹ��    
     ,case  when  substr(mbti,3,1) = 'F' then '������'
            else '�����' 
        end as �Ǵ���
     ,case  when  substr(mbti,4,1) = 'P' then '������'
           else '��ȹ��' 
        end as ��Ȱ���    
FROM tb_info;

COMMIT

