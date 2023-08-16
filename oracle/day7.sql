select *
FROM �л�, ��������;
select *
from ��������;

SELECT *
from �л�, ��������
WHERE �л�.�й� = ��������.�й�(+)--�ƿ��� ����
and �л�.�̸� = '������';

SELECT *
FROM employees;

SELECT *
FROM departments;
--immer join ��������(���������̶�� ��)
-- �� Į���� ������ ���� ������ ����

SELECT employees.emp_name, departments.department_name
FROM employees,departments 
WHERE employees.department_id = departments.department_id;

--���̺� ��Ī
SELECT a.emp_name,   --��� ���ʿ��� �ִ� �÷��� ��Ī �Ƚᵵ��
            b.department_name,
           a.department_id -- ������ �÷����� �������� ��� ������ ǥ���ؾ��� 
FROM employees a,departments b 
WHERE  a.department_id = b.department_id;


SELECT member.mem_name, 
            cart_no,cart_prod,cart_qty
            ,count(mem_id)
FROM member, cart
where member.mem_id =  cart.cart_member
and member.mem_name = '������'
group by  member.mem_name, 
            cart_no,cart_prod,cart_qty;

/*
    ANSI JOIN: American NAtional Standards Institue
    �̱� ǥ�� SQL ��������:������ �� �ǹ����� �� �Ⱦ�
*/
SELECT member.mem_name, 
           cart. cart_no,
            cart.cart_prod,
            cart.cart_qty
FROM member
INNER JOIN cart
ON(member.mem_id =  cart.cart_member)
WHERE member.mem_name = '������'; 




--member �����뾾�� īƮ(����)�̷��� ����Ͻÿ�


--��ǰ ���� ���


SELECT member.mem_name,
                member.mem_id,
                cart.cart_member, 
            cart_no,
            cart_prod, prod.prod_id,
            cart_qty,
            prod.prod_name,
            prod.prod_sale

            
FROM member, cart,prod
where member.mem_id =  cart.cart_member
AND cart.cart_prod = prod.prod_id
and member.mem_name = '������';


--�����뾾�� ������ ��ü ��ǰ�� �հ� �ݾ���?


SELECT member.mem_name,
            member.mem_id,
             SUM( cart.cart_qty* prod.prod_sale) as �հ�ݾ�


            
FROM member INNER JOIN cart
ON( member.mem_id =  cart.cart_member)
INNER JOIN prod
ON (cart.cart_prod = prod.prod_id)
WHERE member.mem_name = '������'
GROUP BY member.mem_name, member.mem_id;

-- employees, jobs ���̺��� Ȱ���Ͽ�
-- salary�� 15000 �̻��� ������ ���, �̸�, salary, ���� ���̵�, �������� ����Ͻÿ�

SELECT employees.employee_id -- ���
            ,employees.emp_name--�̸�
            ,employees.salary--����
            ,jobs.job_title--���� �̸�
            
FROM employees,jobs--�������̺�,�۾����̺�
where employees.job_id=jobs.job_id
AND employees.salary >= 15000;

SELECT *
FROM jobs;

SELECT *
FROM employees;


/*�������� (�����ȿ� ����)
    1.��Į�� ��������(select ��)
    2.�ζ��� ��(FROM��)
    3.��ø ����(WHERE ��)
*/

--��Į�� ���������� ������ ��ȯ
--���� �ڵ尪�� �̸��� �����ö� ���� ���
--���������� �����������̺��� �� �Ǽ� ��ŭ ���������� ��ȸ�ϱ� ������
--���������� ���̺��� �Ǽ��� ������ �ڿ��� ���� ����ϰԵ�.
--(���� ���� ��� ������ �̿��ϴ°� �� ����)
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM jobs;
SELECT a.emp_name
        ,   a.department_id
        ,   (SELECT department_name
            FROM departments
            WHERE department_id = a.department_id) as dep_name
        ,a.job_id
        , (SELECT job_title
            FROM jobs
            WHERE job_id = a.job_id) as job_name
FROM employees a;

--��ø��������
--��ü ������ ������� ���� ������ ū ������ ����Ͻÿ�
SELECT emp_name
            ,salary
            
FROM employees
WHERE salary >=(SELECT AVG(salary)
                            FROM employees);


--���ÿ� 2���̻��� �÷� ���� ���� �� ��ȸ
SELECT * FROM job_history;
SELECT employee_id, emp_name, job_id
FROM employees
WHERE (employee_id, job_id) IN (SELECT employee_id, job_id
                                                FROM job_history);
SELECT *
FROM member;
SELECT cart_member
FROM cart;
--cart ��� �̷��� ���� ȸ���� ��ȸ�Ͻÿ�
SELECT *
FROM member
WHERE mem_id NOT IN(SELECT cart_member
                                    FROM cart);
                                    
select *
FROM member
where mem_id NOT in ('a001','b001');
--member �߿��� ��ü ȸ���� ���ϸ��� ��հ� �̻��� ȸ���� ��ȸ�Ͻÿ�

select mem_name
        ,mem_job
        ,mem_mileage
from member
where mem_mileage >= (select AVG(mem_mileage)
                                    FROM member)
order by 3 DESC;
