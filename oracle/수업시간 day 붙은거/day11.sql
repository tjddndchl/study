select * from departments;
SELECT department_id
            --level ���󿭷μ� Ʈ�� ������ � �ܰ����� ��Ÿ���� ������
            ,LPAD(' ',3*(level-1)) || department_name as �μ���
            ,parent_id
            , level
FROM departments
START WITH parent_id is NULL                            --����
CONNECT BY PRIOR department_id = parent_id;      --������ ��� ��������(����)

--  departments ���̺� 230 it��������ũ ���� �μ���
--                                       it������

INSERT into departments(department_id,department_name,parent_id) values(280,'IT������',230);

select MAX(department_id)+10
FROM departments;



SELECT department_id
            --level ���󿭷μ� Ʈ�� ������ � �ܰ����� ��Ÿ���� ������
            ,LPAD(' ',3*(level-1)) || department_name as �μ���
            ,parent_id
            , level
            , CONNECT_BY_ISLEAF --����������1 �ڽ��� ������0
            , SYS_CONNECT_BY_PATH(department_name, '|')--��Ʈ ��忡�� �ڽ������ ��������
            , CONNECT_BY_ISCYCLE --���ѷ����� ������ ã����
        --(�ڽ��� �ִµ� ���ڽ� �ο찡 �θ��̸� 1, �ƴϸ� 0)
FROM departments
START WITH parent_id is NULL                            --����
CONNECT BY  NOCYCLE PRIOR department_id = parent_id      --������ ��� ��������(����)
ORDER SIBLINGS BY   department_name DESC;      --SIBLINGS ���ÿ���  ���� �ķ����θ� ���İ���


--���ѷ����ɸ����� ����
UPDATE departments
SET parent_id = 170
WHERE department_id = 20;


SELECT * FROM employees;
SELECT employee_id
            ,emp_name
            ,LPAD(' ',3*(level-1)) || emp_name as ������
            ,manager_id
            , SYS_CONNECT_BY_PATH(emp_name, ' >')
FROM   employees
START WITH manager_id IS NULL
CONNECT BY PRIOR employee_id=manager_id 
ORDER SIBLINGS BY emp_name;
--�������� �������踦 ����Ͻÿ�.
drop table ex2_6;
CREATE TABLE ex2_6(
    ���̵� NUMBER
    ,�θ���̵� NUMBER
    ,�̸�   VARCHAR2(100)
    ,��å   VARCHAR2(100)
    
);

INSERT INTO ex2_6(���̵�,�θ���̵�,�̸�,��å) VALUES( 10 ,NULL,'�̻���','����');
INSERT INTO ex2_6(���̵�,�θ���̵�,�̸�,��å) VALUES( 20 ,10,'�����','����');
INSERT INTO ex2_6(���̵�,�θ���̵�,�̸�,��å) VALUES( 30 ,20,'������','����');
INSERT INTO ex2_6(���̵�,�θ���̵�,�̸�,��å) VALUES( 40 ,30,'�����','����');
INSERT INTO ex2_6(���̵�,�θ���̵�,�̸�,��å) VALUES( 50 ,40,'�̴븮','�븮');
INSERT INTO ex2_6(���̵�,�θ���̵�,�̸�,��å) VALUES( 60 ,50,'�ֻ��','���');
INSERT INTO ex2_6(���̵�,�θ���̵�,�̸�,��å) VALUES(  70,50,'�����','���');
INSERT INTO ex2_6(���̵�,�θ���̵�,�̸�,��å) VALUES( 100 ,30,'�ڰ���','����');
INSERT INTO ex2_6(���̵�,�θ���̵�,�̸�,��å) VALUES( 150 ,100,'��븮','�븮');
INSERT INTO ex2_6(���̵�,�θ���̵�,�̸�,��å) VALUES( 160 ,150,'�ֻ��','���');


select * from ex2_6;
select �̸�
        ,LPAD(' ',2*(level-1)) || ��å as ��å
        ,LEVEL
        ,SYS_CONNECT_BY_PATH(��å, ' |')
        ,CONNECT_BY_ISLEAF 
        ,�θ���̵�
        ,���̵�
from ex2_6
START WITH �θ���̵� IS NULL
CONNECT BY PRIOR ���̵� = �θ���̵� ;


SELECT period
            ,SUM(loan_jan_amt) as �����հ�
FROM kor_loan_status
WHERE substr(period,1,4) = 2013
GROUP BY period;

/*
level1�� ����-���μ�  (connect by ���� �Բ� ���)
������ �����Ͱ� �ʿ��Ҷ� ���̻��.


*/
--2013�� 1~12�� ������
SELECT '2013'||LPAD (level,2,'0') as ���
FROM dual
CONNECT BY LEVEL <= 12 ;

SELECT a.���
            , NVL(b.�����հ�,0) as �����հ�
            
FROM (SELECT '2013'||LPAD (level,2,'0') as ���
FROM dual
CONNECT BY LEVEL <= 12) a
        ,(SELECT period       as   ���
            ,SUM(loan_jan_amt) as �����հ�
FROM kor_loan_status
WHERE substr(period,1,4) = 2013
GROUP BY period)  b
WHERE a.��� = b.���(+)
ORDER BY 1;
--202301~202312

SELECT TO_CHAR(SYSDATE,'YYYY') || LPAD(LEVEL, 2, '0')as ���
FROM dual
CONNECT BY LEVEL <= 12;

--�̹��� 1������ ������������ ��� 
--(�� �ش� select���� �����޿� ����� �ش���� ������������ ��µǵ���)

SELECT TO_CHAR(SYSDATE,'YYYYMM') || LPAD(LEVEL,'2') as year
FROM dual
CONNECT BY LEVEL <=(SELECT TO_CHAR(LAST_DAY(SYSDATE),'DD')
                                    FROM dual);

SELECT * FROM member;

select mem_name
        ,mem_bir
FROM member;

select 
        substr(mem_bir,4,2)|| '��'
        ,COUNT(substr(mem_bir,4,2)|| '��') as Ƚ��
        FROM member
group by   substr(mem_bir,4,2)|| '��' 
ORDER BY 1;


SELECT LPAD(LEVEL,2,'0') || '��'          
FROM dual
CONNECT BY LEVEL <= 12;

SELECT NVL(a.��,'�հ�')
            ,COUNT(b.Ƚ��)
           
from (SELECT LPAD(LEVEL,2,'0') || '��'   as ��       
FROM dual
CONNECT BY LEVEL <= 12) a, 
(select 
         substr(mem_bir,4,2)|| '��' as ��
        ,COUNT(substr(mem_bir,4,2)|| '��') as Ƚ��
FROM member
group by  mem_name  , substr(mem_bir,4,2)|| '��' 
ORDER BY 1) b
where a.�� = b.��(+)
GROUP BY ROLLUP (a.��)
ORDER BY 1; 

SELECT LPAD(LEVEL,2,'0')    as ��       
         
FROM dual
CONNECT BY LEVEL <= 12;

select to_char(mem_bir, 'MM') 
        , count(*)  as ȸ����
from member
group by to_char(mem_bir, 'MM') ;


SELECT a.�� || '��'
            ,NVL(b.ȸ����,0)

FROM (SELECT LPAD(LEVEL,2,'0')    as ��       
         
FROM dual
CONNECT BY LEVEL <= 12) a,
(select to_char(mem_bir, 'MM') ��
            , count(*)  as ȸ����
from member
group by to_char(mem_bir, 'MM'))  b
WHERE a.�� = b.��(+);





