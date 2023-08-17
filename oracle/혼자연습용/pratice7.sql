SELECT * from emp;
select SUM(sal)
FROM emp;
    
    SELECT sal
    FROM emp;
    
SELECT ename, SUM(sal)
FROM emp
GROUP BY ename;
SELECT SUM(comm)
FROM emp;



SELECT SUM(sal),
            SUM(comm)
FROM emp;

SELECT COUNT(*)
FROM emp;

SELECT COUNT(*)
    FROM emp
WHERE DEPTNO = 30;


SELECT COUNT(DISTINCT sal)
            ,COUNT(ALL SAL)
            ,COUNT(SAL)
            FROM emp;

SELECT COUNT(comm)
    FROM emp;
    
SELECT MAX(sal)
FROM emp
WHERE deptno = 10; 

SELECT MAX(hiredate)
FROM emp
WHERE deptno = 20;

SELECT MIN(hiredate)
FROM emp
WHERE deptno =20;

SELECT AVG(sal)
FROM emp
where deptno = 30;



SELECT AVG(DISTINCT sal)
    FROM emp
WHERE deptno = 30;


SELECT AVG(comm)
    FROM emp
WHERE deptno =30 ;


SELECT AVG(sal), '10' AS deptno FROM emp WHERE deptno = 10
UNION ALL
SELECT AVG(sal), '20' AS deptno FROM emp WHERE deptno = 20
UNION ALL
SELECT AVG(sal), '30' AS deptno FROM emp WHERE deptno = 30;



SELECT * FROM emp;
SELECT AVG(sal)
            ,deptno
            FROM emp
            GROUP BY deptno;
            
SELECT deptno
            ,AVG(sal)           
            FROM emp
            GROUP BY deptno;
SELECT deptno
            ,job
            ,AVG(sal)
            FROM emp
            GROUP BY deptno, job
            ORDER BY 1;
            
SELECT deptno
            ,AVG(comm)
            FROM emp
            GROUP BY deptno;
            

SELECT deptno 
            ,job
            ,AVG(sal)
            FROM emp
            GROUP BY deptno, job
            HAVING AVG(sal) >= 2000;
            
    
SELECT deptno, job, AVG(sal)
FROM emp
WHERE job = 'SALESMAN'
GROUP BY deptno, job;

SELECT deptno
            ,job
            ,AVG(sal)
FROM emp
WHERE SAL <= 3000
GROUP BY deptno, job
HAVING AVG(sal) >=2000
ORDER BY 1;

SELECT deptno
            ,job
            ,AVG(sal)
FROM emp
GROUP BY deptno, job
HAVING AVG(sal) >= 500
ORDER BY 1;

SELECT deptno, job, COUNT(*), MAX(sal), SUM(sal), AVG(sal)
FROM emp
GROUP BY  ROLLUP(deptno, job);

SELECT deptno, job, COUNT(*)
    FROM emp
GROUP BY deptno, ROLLUP(job);

SELECT deptno,job, COUNT(*)
FROM emp
GROUP BY job , ROLLUP(deptno);

select * FROM emp;
SELECT deptno, job, COUNT(*)
FROM emp
GROUP BY GROUPING SETS(deptno, job);

SELECT deptno, job, COUNT(*), MAX(sal), SUM(sal), AVG(sal)
            ,GROUPING(deptno)
            ,GROUPING(job)
        FROM emp
        GROUP BY CUBE(deptno, job)
        ORDER BY deptno, job;

            

