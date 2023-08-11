SELECT TO_CHAR(123456, '999,999,999')
    ,  TO_CHAR(SYSDATE, 'YYYY-MM-DD')
    ,  TO_CHAR(SYSDATE, 'YYYYMMDD')
    ,  TO_CHAR(SYSDATE, 'YYYYMMDD HH:MI:SS')
    ,  TO_CHAR(SYSDATE, 'YYYYMMDD HH12:MI:SS')
    ,  TO_CHAR(SYSDATE, 'day')
    ,  TO_CHAR(SYSDATE, 'yyyy')
    ,  TO_CHAR(SYSDATE, 'dd')
    ,  TO_CHAR(SYSDATE, 'd')
FROM dual;

SELECT TO_DATE('230713', 'YYMMDD')
    --TO_DATE�� ��¥ ������Ÿ������ ����ȯ
    --�Է� ���˰� �����ϰ� ǥ���ؾ� DATE�� �ٲ�
    ,  TO_DATE('2023 08 12 10:00:00', 'YYYY MM DD HH24:MI:SS')
FROM dual;

CREATE TABLE tb_myday(
    title VARCHAR2(200)
    ,d_day DATE
    
);

INSERT INTO tb_myday VALUES ('������', '20231226');
INSERT INTO tb_myday VALUES ('������', '2023.12.26');
INSERT INTO tb_myday VALUES ('������', '23.12.26');
INSERT INTO tb_myday VALUES ('������', '23|12|26');
INSERT INTO tb_myday VALUES ('������', '23|12|26 18');
INSERT INTO tb_myday VALUES ('������',TO_DATE('231226 18','YYMMDD HH24'));

CREATE TABLE ex5_1(
    seq VARCHAR2(100)
    ,seq2 NUMBER
);

INSERT INTO ex5_1 VALUES('1234', '1234');
INSERT INTO ex5_1 VALUES('99', '99');
INSERT INTO ex5_1 VALUES('123456', '123456');
SELECT *
    FROM ex5_1

    
ORDER BY TO_NUMBER(seq) DESC;

SELECT *
    FROM students;
--students ���̺��� Ȱ���Ͽ��й�, �л��̸�, ���̸� ����Ͻÿ�

SELECT stu_id
    , stu_name
    ,substr ((TO_CHAR(SYSDATE,'YYYY') -(substr(stu_birth,1,2)+1900)),1,2) as ����
FROM students;

select CUST_YEAR_OF_BIRTH
    ,substr ((TO_CHAR(SYSDATE,'YYYY') -(substr(cust_year_of_birth,1,4))),1,7) as ����
    
FROM customers

ORDER BY  TO_NUMBER(����) ;



--�Է��� ���ڸ����� 50�̻��̸� 20����� �ؼ�
SELECT stu_id
    ,stu_birth
    ,TO_CHAR(TO_DATE(stu_birth,'YYMMDD'),'YYYY')
    ,TO_DATE(stu_birth, 'RRMMDD')
    ,TO_CHAR(TO_DATE(stu_birth, 'RRMMDD'),'YYYY')
FROM students;

--employees �� hire_date �÷��� Ȱ���Ͽ� �ټ� ����� ����Ͻÿ�

SELECT hire_date
    ,TO_CHAR(SYSDATE,'YYYY')
    ,TO_CHAR(hire_date,'YYYY')
    ,TO_CHAR(SYSDATE,'YYYY') - TO_CHAR(hire_date,'YYYY') as �ټӿ���
FROM employees

ORDER BY �ټӿ��� desc, 1;

--null ����
--** NVL(null, ��ȯ��)
SELECT emp_name, salary, commission_pct
    , salary * NVL(commission_pct,0)
FROM employees;

--DECODE ��ȯ (case�� ������)
SELECT cust_id, cust_name
    -- ����  , ��, ������, �׹ۿ�)
    ,DECODE(cust_gender,'M','����','����') as gender
    -- ����   ,��, ������, ��2, ������, '�׹ۿ�'
    ,DECODE(cust_gender,'M','����','F','����','??') as gender2
FROM customers;
/*
    �� ���̺�
    �� ����⵵ Į���� �ִ�.
    ������ �������� ��Į���� Ȱ���� 30�� 40�� 50�븦 ������ ����ϰ�
    ������ ���ɴ�� '��Ÿ'�� ����ϴ� ������ �ۼ��Ͻÿ�
*/
select CUST_YEAR_OF_BIRTH
    ,TO_CHAR(SYSDATE,'YYYY')-cust_year_of_birth as ����
    ,SUBSTR((TO_CHAR(SYSDATE,'YYYY')-cust_year_of_birth),1,2)-SUBSTR((TO_CHAR(SYSDATE,'YYYY')-cust_year_of_birth),2,1)|| '��' as ���մ�
     
FROM customers;

