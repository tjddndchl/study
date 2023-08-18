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

SELECT SUM(DISTINCT sal)
            ,SUM(ALL sal)
            ,SUM(sal)
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
            ,COUNT(ALL sal)
            ,COUNT(sal)
FROM emp;

SELECT COUNT(comm)
FROM emp
WHERE comm IS NOT NULL;

SELECT MAX(sal)
    FROM emp
WHERE deptno LIKE 10;

SELECT MIN(sal)
FROM emp
WHERE deptno =10;

SELECT MAX (hiredate)
FROM emp
WHERE deptno = 20;

SELECT MIN(hiredate)
FROM emp
WHERE deptno = 20;

SELECT AVG(sal)
FROM emp
WHERE deptno = 30;

SELECT AVG(DISTINCT sal)
FROM emp
WHERE deptno = 30;

SELECT AVG(comm)
FROM emp
WHERE deptno = 30;

SELECT deptno
            ,LISTAGG(ename, ',' )
            WITHIN GROUP(ORDER BY sal) as ename
            FROM emp
GROUP BY deptno;

SELECT deptno
            ,job
            ,MAX(sal)
FROM emp
GROUP BY deptno,job
ORDER by deptno,job;


SELECT *
FROM(SELECT deptno,job, sal
        FROM emp)
PIVOT(MAX(sal)
        FOR deptno IN(10,20,30)
        )
ORDER BY job;

select deptno
            ,TRUNC(AVG(sal),0)
            ,MAX(sal)
            ,MIN(sal)
            ,COUNT(*)
FROM emp
GROUP BY deptno
ORDER by 2;


SELECT 
              a.직업
                ,a.숫자
FROM(
SELECT job    as   직업
            ,COUNT(*) as 숫자
FROM emp
GROUP BY job
HAVING COUNT(*) >= 3 
    )  a 
where rownum between 1 and 2;

select * from emp;
SELECT TO_CHAR(hiredate,'YYYY')
            ,deptno
            ,COUNT(deptno) as 숫자
FROM emp
group by TO_CHAR(hiredate,'YYYY'),deptno
ORDER BY 1 DESC;
SELECT * FROM emp;

SELECT NVL2(comm,'O','X')
            ,COUNT (NVL2(comm,'O','X'))
FROM emp
GROUP BY NVL2(comm,'O','X')
ORDER BY 1 DESC;

SELECT deptno
            ,TO_CHAR(hiredate,'YYYY')
            ,COUNT(*)
            ,MAX(sal)
            ,SUM(sal)
            ,TRUNC(AVG(sal),3)
from emp

GROUP BY ROLLUP(deptno,TO_CHAR(hiredate,'YYYY'));

        
