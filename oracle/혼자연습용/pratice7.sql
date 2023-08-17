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


SELECT COUNT(DISTINCT sal),
