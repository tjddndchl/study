/*
�ּ� ����
table ���̺�
1.���̺�� �÷����� �ִ� ũ��� 30 ����Ʈ 
2.���̺�� �÷������� ������ ����� �� ����.
3.���̺�� �÷������� ����, ����,_,$,# �� 
����� �� ������ ù ���ڴ� ���ڸ� �� �� ����.
4.�� ���̺� ��밡���� �÷��� �ִ� 255�� ����

*/

DROP table ex2_1;


CREATE TABLE ex2_1(
    col1 CHAR(10)
    ,col2 VARCHAR2(10) --�÷���, <--�� ����
--    �ϳ��� �÷����� �ϳ��� Ÿ�԰� ����� ����
);

--INSERT ������ ����
INSERT INTO ex2_1(col1 , col2)
VALUES('abc','abc'); --���ڿ��� '' <--���� ����ǥ�� ǥ��
--��ɹ��� �빮�ڷ� �ĺ��ڴ� �ҹ���
--SELECT ������ ��ȸ
SELECT col1
        , LENGTH(col1)--char�� ������
        , col2
        , LENGTH(col2)
FROM ex2_1;
--������ ������ (DML, DATA Manipulation LAnguage)
--��ȸ SELECT, ���� INSERT, ���� UPDATE, ���� DELEATE
SELECT * --* ��ü Į���� �ǹ���
FROM employees;
-- Ư�� �÷��� ��ȸ
SELECT emp_name -- Į���� ������(,) �޸�
    , email
FROM employees;
--alias(��Ī, ����) as
SELECT emp_name as nm 
    , hire_date hd -- ��Ī��  as �� ���̰� ������ ����Ʈ�� �νĵ�
    , salary ����  --�ѱ۵� ��� ���������� ���� ����
    , department_id "�μ� ���̵�"--��� ���⸦ �����Ϸ��� " "<--���
FROM employees; --����� �Ⱦ��°� ����_<--���
--�˻� ������ �ִٸ� where ���
--�˻� ������ ��������� AND, OR �� ���
SELECT emp_name
    ,salary
    ,department_id
FROM employees
WHERE salary >= 12000  --salary�� 12000�̻�
AND department_id = 90;
--���� ���� ORDER BY default [ASC ��������], ������������ ������ DESC
SELECT *
FROM departments
ORDER BY department_id DESC; -- ��������
SELECT emp_name --1
        ,salary --2
FROM employees
ORDER BY 2 DESC, 1 DESC;

SELECT emp_name --1
        ,salary --2
        ,hire_date
FROM employees
ORDER BY substr (hire_date,1,2);
--���� ������ : + - * /
SELECT employee_id   as �������̵�
    , emp_name       as �����̸�
    , salary / 30    as �ϴ�
    , salary         as ����
    , salary -salary * 0.1  as �Ǽ��ɾ�
    , salary * 12   as ����
FROM employees;
--�� ������
SELECT * FROM employees WHERE salary = 2600; -- ����
SELECT * FROM employees WHERE salary <> 2600; --���� �ʴ�
SELECT * FROM employees WHERE salary != 2600; --���� �ʴ�
SELECT * FROM employees WHERE salary < 2600; --�̸�
SELECT * FROM employees WHERE salary > 2600; --�ʰ�
SELECT * FROM employees WHERE salary <= 2600; --����
SELECT * FROM employees WHERE salary >= 2600; --�̻�
-- departments ���̺��� 30 �μ��� ��ȸ�Ͻÿ�
SELECT * FROM employees WHERE department_id = 30
or department_id =60;

--PRODUCTS ���̺��� '��ǰ ���� �ݾ�(PROD_MIN_PRICE)'��
-- 30�� "�̻�" 50�� "�̸�"�� ��ǰ���,
SELECT prod_name
    , prod_category
    , prod_min_price
FROM PRODUCTS

WHERE prod_min_price >= 30
AND prod_min_price < 50
ORDER BY  prod_category ,prod_min_price DESC;
--ǥ����: ���ϴ� ǥ������ ���� CASE WHEN ����: THEN �ش����Ǻ���ǥ��
--                               WHEN2 ����2:THEN �ش����Ǻ���ǥ��
--                               END AS ��Ī

--������ �ϳ��ۿ� ���������� �ٷ� else�ص� �������
SELECT cust_name
    ,  cust_gender
    ,case when cust_gender = 'F' THEN '����'
        else '����'
    end as ����    
FROM customers;

SELECT employee_id
    , emp_name
    , CASE WHEN salary <= 5000 THEN 'C���'
           WHEN salary > 5000 AND salary <= 15000 THEN 'B���'
           ELSE 'A���'
           END as grade
FROM employees;
--BETWEEB ABD ���ǽ�
SELECT employee_id
    , salary
FROM employees -- 2000 ~ 2500
WHERE salary BETWEEN 2000 AND 2500;
-- IN ���ǽ� or �� �ǹ�
SELECT employee_id, salary, department_id
FROM employees
WHERE department_id IN(90, 80, 10); -- 90 or 80 or 10
--���ڿ� ������ || <-- +
SELECT emp_name || ':' || employee_id as �̸��纯
FROM employees;


SELECT emp_name
FROM employees
WHERE emp_name LIKE 'A%'; --A�� �����ϴ�


SELECT emp_name
FROM employees
WHERE emp_name LIKE '%na%'; --na�� ���ԵǾ�����


SELECT emp_name
FROM employees
WHERE emp_name LIKE '%d%'; --d�� ������


SELECT emp_name
FROM employees
WHERE department_id = :a -- Ŭ��: �̸� <-- ���ε�
--                             ���� ���� �׽�Ʈ �غ��� ���
OR department_id = :b;

SELECT emp_name
FROM employees
WHERE emp_name LIKE '%'||:val||'%'; --%��%

CREATE TABLE ex2_2(
    nm VARCHAR2(20)
);

INSERT INTO ex2_2 VALUES('�浿');
INSERT INTO ex2_2 VALUES('ȫ�浿');
INSERT INTO ex2_2 VALUES('�浿ȫ');
INSERT INTO ex2_2 VALUES('ȫ�浿��');
--ȫ��� �����ϴ� 3���� ��ȸ
SELECT *
FROM ex2_2
WHERE nm LIKE 'ȫ��';

CREATE TABLE students (

stu_id VARCHAR2(12) /* �й� */
, stu_grade NUMBER(1)/* �г� */
, stu_semester NUMBER(1) /* �б� */
, stu_name VARCHAR2(10) /* �л� �̸� */
, stu_birth VARCHAR2(10) /* �л� ������� */
, stu_kor NUMBER(3) /* ���� ���� */
, stu_eng NUMBER(3) /* ���� ���� */
, stu_math NUMBER(3) /* ���� ���� */
, CONSTRAINTS stu_pk PRIMARY KEY (stu_id, stu_grade, stu_semester)
);

SELECT *
FROM students -- 1�г� �达�� ��ȸ
WHERE stu_name LIKE '%��%'
AND stu_grade =1;

SELECT stu_name
    , stu_grade
    ,(stu_kor + stu_eng + stu_math) / 3 as subject_avg
FROM students
WHERE stu_grade =1
AND (stu_kor + stu_eng + stu_math) / 3 >= 90;
/*
����: Los Angeles
��ȥ : single
����: ����
1983 ���� �����
�������� ����⵵ ��������, �̸� ��������

*/
SELECT CUST_NAME
    ,cust_city
    ,CUST_MARITAL_STATUS
    ,CUST_GENDER
    ,CUST_YEAR_OF_BIRTH
FROM customers
WHERE cust_city LIKE 'Los Angeles'
AND CUST_MARITAL_STATUS LIKE 'single'
AND CUST_GENDER LIKE 'F'
AND CUST_YEAR_OF_BIRTH >= 1983
order by CUST_YEAR_OF_BIRTH DESC, CUST_NAME ;


DESC EMP;



