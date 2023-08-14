select mbti
    , count(*) as cnt
from tb_info
group by mbti
order by 2 desc;

SELECT hobby
    , COUNT(*) as cnt
FROM tb_info
GROUP BY hobby
ORDER BY 2 DESC;

/*
    �����Լ� ��� �����͸� Ư�� �׷����� ���� ���� �׷쿡 ���� 
    ����, ���, �ִ�, �ּڰ� ���� ���ϴ� �Լ�
    count(expr) �ο� ���� ��ȯ�ϴ� �����Լ�
*/

SELECT COUNT(*)  --null����
    ,  COUNT(department_id)--default ALL null�� �ȵ�
    ,  COUNT(ALL department_id)-- �ߺ� ���� null x
    ,  COUNT(DISTINCT department_id)-- �ߺ�����
    ,  COUNT(employee_id)
FROM employees;


SELECT department_id
    ,  SUM(salary)--�հ�
    ,  ROUND (AVG(salary),3)--���
    ,  MAX(salary)--�ִ�
    ,  MIN(salary)--�ּڰ�
    
FROM employees
GROUP BY department_id
ORDER BY 1;


SELECT department_id 
    , MAX(salary)--�ִ�
    , MIN(salary)--�ּڰ�
FROM employees
WHERE  department_id = 50--������ �׷�����
group by department_id
order by 1;


/*
    member ���̺��� Ȱ���Ͽ�
    ȸ���� ������ ȸ������ ����Ͻÿ�
    ���� (ȸ���� ��������)
*/


SELECT  mem_job
    , count(mem_id) as cnt
    , COUNT(*) as cnt2
FROM member
GROUP BY mem_job
ORDER BY 1 DESC;
--2013�⵵ �Ⱓ�� �� �����ܾ�
SELECT *
FROM kor_loan_status;


SELECT period
    , sum(loan_jan_amt) as ���ܾ�
FROM kor_loan_status
where period like '2013%'
GROUP BY period
ORDER BY 1;
--2013�⵵ ������ ���������� �Ѵ����ܾ�
--select ���� ���� �÷��� �����Լ��� �����ϰ�
--group by ���� ���ԵǾ����
SELECT region
    ,gubun
    ,sum(loan_jan_amt) as ���ܾ�
FROM kor_loan_status
where period like '2013%'
group by region, gubun
ORDER BY 1;
--�⵵�� ������ ���հ�
SELECT substr (period,1,4)
    ,region
    , sum(loan_jan_amt) as ���ܾ�

FROM kor_loan_status
GROUP by substr(period,1,4),region
ORDER by 1;

--employees �������� ��� �⵵�� �������� ����Ͻÿ�
select TO_CHAR(hire_date,'YYYYMMDD')
from employees;

--�׷��� ����� �����Ϳ� ���� ��������� ������
--HAVING ���
--�Ի������� 10�� �̻��� �⵵�� ������
--**** select �� �������
--from -> where -> group by -> having -> select -> order by
SELECT TO_CHAR(hire_date,'YYYY') as �Ի�⵵
    , count(employee_id)
FROM employees

group by TO_CHAR(hire_date,'YYYY')
HAVING COUNT(employee_id) >= 10
order by 1;

--member ���̺��� Ȱ���Ͽ�
--������ ���ϸ��� ��ձݾ��� ���Ͻÿ�(�Ҽ��� 2° �ڸ����� �ݿø��Ͽ� ���);
--��ո��ϸ����� 3000�̻���
select  mem_job
    , round(AVG(mem_mileage),2) as avg_mileage
FROM member
group by mem_job
HAVING round(AVG(mem_mileage),2) >= 3000
order by 2 ;



--������ ���ϸ����� �հ� ���ϸ��� ��ü�հ踦 ����Ͻÿ�
SELECT (mem_job) as ����
    ,  COUNT(mem_id) as ȸ����
    ,  sum(mem_mileage) as �հ�
FROM member
group by ROLLUP(mem_job); --�Ѿ� �о�ø��ٶ�� ������
                          --�������� ���� �����
                          
--products ��ǰ���̺��� ī��
--���� ��ǰ���� ��ü ��ǰ ���� ����Ͻÿ�
--subcategory ī�װ��� ������ ī�װ�
select *
from products;
SELECT NVL(prod_category,'ī�װ� ��ǰ ���հ�') as ī�װ�
    ,  prod_subcategory as ����ī�װ�
    , count(prod_id) as �հ�
from products
group by rollup(prod_category, prod_subcategory);

SELECT substr (period,1,4)
    ,region
    , sum(loan_jan_amt) as ���ܾ�

FROM kor_loan_status
GROUP by rollup (substr(period,1,4),region)--�������հ�-��ü�հ�
ORDER by 1;


--������ ȸ������ ����Ͻÿ� �� ��, �� �����Ͽ���

select cust_year_of_birth
    , sum (decode(cust_gender,'M',1,0)) as ����
    , sum( decode(cust_gender,'F',1,0)) as ����
    
from customers
GROUP BY rollup(cust_year_of_birth)
ORDER BY 1;

select cust_year_of_birth
--      ,cust_gender
    , SUM(case when cust_gender = 'F' then '1'
    else '0'
    end) as ����
    ,SUM(case when cust_gender = 'M' then '1'
    else '0'
    end) as ����

FROM customers
GROUP BY cust_year_of_birth;

--������ �� �⵵�� �������ܾ��� ���ϴ� ������ �ۼ��� ����
SELECT region
   ,sum(decode(substr(period,1,4),'2011',loan_jan_amt)) as AVM_2011
   ,sum(decode(substr(period,1,4),'2012',loan_jan_amt)) as AVM_2012
   ,sum(decode(substr(period,1,4),'2013',loan_jan_amt)) as AVM_2013

from kor_loan_status
group by region
order by 1;


 
