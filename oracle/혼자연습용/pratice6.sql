SELECT *
    FROM emp
where hiredate > to_date('1981/06/10', 'YYYY/MM/DD');

SELECT *
FROM emp
WHERE hiredate > TO_DATE('1981/10/15','YYYY/MM/DD');

SELECT empno, ename, sal, comm, sal+comm,
                NVL(comm,0)
                ,sal+NVL(comm,0)
FROM emp;


SELECT empno, ename, job, sal,
    DECODE(job
                    ,'MANAGER' , SAL*1.1
                    ,'SALESMAN', SAL*1.05
                    ,'ANALYST',  SAL
                    ,SAL*1.03) AS UPSAL
FROM emp;


SELECT empno 
            ,ename 
            , job
            , sal
   , CASE job
        WHEN 'MANAGER' THEN sal*1.1
        WHEN 'SALESMAN' THEN sal*1.05
        WHEN 'ANALYST' THEN sal
        ELSE SAL*1.03
        END AS UPSAL
        
FROM emp;

SELECT empno, ename, comm,
    CASE
    WHEN COMM IS NULL THEN '해당사항 없음'
    WHEN COMM = 0 THEN '수당없음'
    WHEN comm > 0 THEN '수당 : ' || COMM
    END AS comm_text
FROM emp;



