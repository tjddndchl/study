/*
�ϳ� �̻��� ���̺��� ������ ��ġ ���̺��� �� ó�� ����ϴ� ��ü
���� �����ʹ� �並 �����ϴ� ���̺� ��� ������ ���̺�ó�� ��밡��
������ :1 ���� ����ϴ� ������ SQL���� �Ź� �ۼ��� �ʿ���� ��� ����� ��� 
             :2 ������ ���� ����(��� �÷��� �����͸� �������� ��õ ���̺� ���� �� ����.
             

*/

CREATE OR REPLACE  VIEW emp_dept AS
SELECT a.employee_id
            , a.emp_name
            ,a.department_id
            ,b.department_name
FROM employees a, departments b
WHERE a.department_id = b.department_id;

--system�������� java ������ �並 ���� �� �ִ� ���Ѻο�
GRANT CREATE VIEW TO JAVA; -- SYSTEM �������� ����
SELECT *
FROM emp_dept;

--�ٸ� ������ emp_dept �並 ��ȸ�Ҽ� �ִ� ���� �ο�

GRANT SELECT ON emp_dept TO study; --java�������� ����

select *
from java.emp_dept; --study�������� ��ȸ  �ٸ� �������� ��ȸ�Ҷ��� ��Ű��(����).��

/* �� Ư¡
    -�ܼ� ��(���̺� 1���� ����)
    -�׷��Լ� ���Ұ�
    -distinct ��� �Ұ�
    -insert/update/delete ��밡��
    *���� ��(���̺� �������� ����)
    -distinct ��밡��
    -insert/update/delete �Ұ���
*/

--�� ����

DROP VIEW emp_dept ; --������ �������� ����

/*  �ó�� synatim : ���Ǿ�� ������ ��ü ������ ������ �̸��� ���� ���Ǿ ����°�
    public synonim : ������� ����
    private synonim : Ư�� ����ڸ� ����
    �ó�� ������ public�� �����ϸ� private �ó������ ������
    public �üҴ��� ���������� DBA �����ִ� ����ڸ� ����
    
    ������ : 1,�������� ������� ���� �߿��� ������ ����� ���� ��Ī�� ����
                   2.�������Ǽ� ���� ���̺��� ������ ����Ǿ ��Ī���� ����� �ߴٸ� �ڵ� ������ ���ص� ��.
                   
*/

--�ó�� ���� ���� �ο�

GRANT CREATE SYNONYM TO JAVA; --system�������� ���Ѻο�
CREATE OR REPLACE SYNONYM emp1 FOR employees;
SELECT *
FROM emp1;

GRANT SELECT ON emp1 TO study;--���Ǿ�� ���̺��� ��ȸ�� �� �ִ� ���Ѻο�


SELECT *
FROM java.emp1;

--public synonim dba ������ �־����.
CREATE OR REPLACE PUBLIC SYNONYM emp12 FOR java.employees; --system �������� ����
SELECT *
FROM emp12; --� ���������� ��ȸ����(public�̱� ����)
                        --�� ���������� �ش� ���̺��� ��� ������ �ִ��� �� �� ����(����)
--dba ���� public synonym ���� ����
DROP PUBLIC SYNONYM emp12;

/*  ������ SEQUENCE : ��Ģ�� ���� �ڵ� ������ ��ȯ�ϴ� ��ü 
    ������: pk �� ����� �����Ͱ�  ������� �������� ���� ���,
            ex) �Խ����� �Խñ۹�ȣ (1�� �����Ͽ� -- 999 ����)
    ��������.CURRVAL --���� ������ ��
    ��������.NEXTVAL --���� ��������
*/

CREATE SEQUENCE my_seq1
INCREMENT BY 1 --�������� ���̳ʽ��� ����
START WITH      1--���ۼ���
MINVALUE         1--�ּҰ�
MAXVALUE       9999999--�ִ�
NOCYCLE             --�ִ볪 �ּڰ��� �����ϸ� �������� ����Ʈ(nocycle)
NOCACHE;            --�޸𸮿� ������ ���� �̸� �Ҵ����� ���� ����Ʈ(nocache)

SELECT
 --       SELECT my_seq1.NEXTVAL
        my_seq1.CURRVAL
FROM dual;
DROP SEQUENCE my_seq1;

CREATE TABLE temp_tb(
            seq NUMBER
        ,   dt TIMESTAMP DEFAULT SYSTIMESTAMP
);
INSERT INTO temp_tb(seq) VALUES (my_seq1.NEXTVAL);
SELECT *
FROM temp_tb;

SELECT MAX(seq)+1
FROM temp_tb;

INSERT INTO temp_tb(seq)  VALUES ((SELECT NVL(MAX(seq),0)+1
                                                        FROM temp_tb));
SELECT *
FROM temp_tb;


SELECT TO_CHAR(SYSDATE,'YYYYMMDD')  ||   LPAD(NVL(MAX(seq),0)+1 , 4, '0')
FROM temp_tb;





/* MERGE�� oracle 10g ���� ��밡��
    Ư�� ���ǿ� ���� INSERT or UPDATE DELETE ���� 
*/
--�������ǰǰ� ������ �ִٸ� ������ 3����
--                                      ���ٸ� ����
SELECT *
FROM ����;

INSERT INTO ���� (�����ȣ, �����̸�, ����) VALUES(505,'�������ǰǰ�',2);--�־ ����
MERGE INTO ���� a
USING dual                      --�񱳴�����̺� (dual�� into���̺�� ������)
ON(a.�����̸� = '�������ǰǰ�')
WHEN MATCHED THEN   --on�� ������ �����Ҷ�
    UPDATE SET a.���� =3 
WHEN NOT MATCHED THEN  --on���ǿ� �������� ������
INSERT (a.�����ȣ, a.�����̸�, a.����)
VALUES(509,'�������ǰǰ�',2);



/*SELECT �� ��Ȯ AND �ӵ�*/
SELECT a.employee_id
            ,(SELECT emp_name
            FROM employees
            WHERE employee_id = a.employee_id)
            ,a.cust_id
            ,(SELECT cust_name
            FROM customers
            WHERE cust_id = a.cust_id)    
            ,COUNT(*)
FROM sales a
GROUP BY a.cust_id, a.employee_id;

--2000�⵵ �Ҹſ��� ����Ͻÿ�
--employees, sales ���̺� ��� �Ǹűݾ�(amount_sold) �Ǹż���(quantity_sold)

SELECT * FROM employees; 
SELECT * FROM sales;


SELECT * 
FROM(
SELECT e.emp_name
            ,e.manager_id
            ,TO_CHAR(SUM(s.quantity_sold  *  s.amount_sold),'999,999,999.99')
            ,TO_CHAR(SUM(s.quantity_sold), '999,999,999')
FROM employees e, sales s
WHERE  e.employee_id = s.employee_id
AND    TO_CHAR(s.sales_date,'YYYY') = 2000
GROUP BY e.emp_name,e.manager_id
ORDER BY 3 DESC
) 
WHERE ROWNUM = 1;
