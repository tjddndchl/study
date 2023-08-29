SELECT COUNT(*)
FROM 학생 a;

SELECT a.*
            ,COUNT(*) OVER() as 전체건수
FROM 학생 a;

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

--학생중 학과별 평점이 가장 높은 학생의 정보를 출력하시오

SELECT * FROM 학생;


SELECT   b.*
            
FROM(
SELECT 학번,이름,주소,전공,부전공,생년월일,학기,평점,
            DENSE_RANK() OVER(PARTITION BY 전공
                                                ORDER BY a.평점 DESC) as DENSE_전공
FROM 학생 a
)   b
WHERE DENSE_전공 = 1;




