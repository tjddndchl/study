DESC EMP;
DESC DEPT;
DESC SALGRADE;
SELECT * FROM EMP;
SELECT EMPNO, ENAME, DEPTNO
    FROM EMP;
SELECT EMPNO, DEPTNO
    FROM emp;
SELECT DISTINCT deptno
    FROM emp;
SELECT DISTINCT job, deptno
    FROM emp;
SELECT ALL job, deptno
    FROM emp;
SELECT ename, sal, sal*12+comm, comm
    FROM emp;
SELECT ename, sal, sal+ sal+ sal+ sal+ sal+ sal+ sal+ sal+ sal+ sal+ sal+ sal+comm,comm
    FROM emp;
SELECT ename, sal, sal*12+comm  "annsal", comm
    FROM emp;
    
SELECT *
    FROM emp
ORDER BY sal DESC ;

SELECT *
    FROM emp
ORDER BY empno DESC ;

SELECT empno
    FROM emp
ORDER BY deptno;

SELECT *
    FROM emp
ORDER BY deptno ASC, sal DESC;

SELECT DISTINCT job
    FROM emp;
SELECT empno as employee_no
    ,ename as employee_name
    , mgr as manager
    ,sal as salary
    ,comm as commission
    ,deptno as department_no
    FROM emp;
select *
    FROM emp;
SELECT * 
    FROM emp
WHERE deptno = 30;

SELECT * 
    FROM emp
WHERE empno = 7782;

SELECT *
    FROM emp
WHERE deptno = 30
AND job = 'SALESMAN';

SELECT *
    FROM emp
WHERE empno = 7499
AND deptno = 30;

SELECT *
    FROM emp
WHERE deptno = 30
OR job = 'CLERK';

SELECT *
    FROM emp
WHERE deptno =20
OR job = 'SALESMAN';

SELECT *
    FROM emp
WHERE sal*12 = 36000;

SELECT *
    FROM emp
WHERE sal >= 3000;

SELECT *
    FROM emp
WHERE sal >= 2500
AND job = 'ANALYST';

SELECT *
    FROM emp
WHERE ename <= 'b';
SELECT *
    FROM emp
WHERE sal<>3000;

SELECT *
    FROM emp
WHERE sal^=3000;

SELECT *
    FROM emp
WHERE job = 'MANAGER'
    OR job = 'SALESMAN'
    OR job = 'CLERK';
SELECT *
    FROM emp
WHERE job IN ('MANAGER','CLERK','SALESMAN');

SELECT *
    FROM emp
WHERE deptno IN ('10','20');

SELECT *
    FROM emp
WHERE sal BETWEEN 2000 AND 3000;

SELECT *
    FROM emp
WHERE sal NOT BETWEEN 2000 AND 3000;

SELECT *
    FROM emp
WHERE ename LIKE '_L%';

SELECT *
    FROM emp
WHERE ename NOT LIKE '%AM%';

SELECT *
    FROM emp
WHERE comm IS NOT NULL;

SELECT *
    FROM emp
WHERE sal > NULL
OR comm IS NULL;

SELECT empno, ename, sal, deptno
    FROM emp
WHERE deptno = 10

UNION 
SELECT empno, ename, sal, deptno
    FROM emp
WHERE deptno = 10;

SELECT empno, ename, sal, deptno
    FROM emp
MINUS
SELECT empno, ename, sal, deptno
    FROM emp
WHERE deptno =10;

SELECT empno, ename, sal, deptno
    FROM emp
INTERSECT
SELECT empno, ename, sal, deptno
    FROM emp
WHERE deptno =10;