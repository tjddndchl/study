SELECT COUNT(*)
FROM �л� a;

SELECT a.*
            ,COUNT(*) OVER() as ��ü�Ǽ�
FROM �л� a;

SELECT emp_name 
            ,department_id 
            ,ROW_NUMBER() OVER(PARTITION BY department_id ORDER BY emp_name) as dep_row
            ,department_id
            ,job_id
            ,ROW_NUMBER() OVER(PARTITION BY department_id,job_id ORDER BY emp_name) as deparjob_row
            ,job_id
            ,ROW_NUMBER() OVER(PARTITION BY job_id ORDER BY emp_name) as job_row
FROM employees;

--RANK(), DENSE_RANK()

SELECT mem_id, mem_name, mem_job
            ,mem_mileage
            ,RANK() OVER (PARTITION BY mem_job ORDER BY mem_mileage DESC) as mem_rank
FROM member;


SELECT mem_id, mem_name, mem_job
            ,mem_mileage
            ,RANK() OVER (PARTITION BY mem_job ORDER BY mem_mileage DESC) as mem_rank
            ,DENSE_RANK() OVER (PARTITION BY mem_job ORDER BY mem_mileage DESC) as mem_dense_rank
FROM member;


SELECT emp_name
            ,salary
            ,department_id
            ,RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) as rank
            ,DENSE_RANK() OVER (PARTITION BY department_id
                                                    ORDER BY salary DESC) as dense_rnak
                                                    
FROM employees;


SELECT a1.* FROM(
SELECT emp_name
            ,salary
            ,department_id
            ,RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) as rank
FROM employees) a1
WHERE rank = 1;

--�л��� �а��� ������ ���� ���� �л��� ������ ����Ͻÿ�

SELECT * FROM �л�;


SELECT   b.*
            
FROM(
SELECT �й�,�̸�,�ּ�,����,������,�������,�б�,����,
            DENSE_RANK() OVER(PARTITION BY ����
                                                ORDER BY a.���� DESC) as DENSE_����
FROM �л� a
)   b
WHERE DENSE_���� = 1;




