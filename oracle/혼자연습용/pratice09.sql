SELECT sal
FROM emp
WHERE ename = 'JONES';
SELECT *
FROM emp
WHERE sal > 2975;

SELECT *
FROM emp
WHERE sal >(select sal
                    FROM emp
                    WHERE ename = 'JONES');
                    
SELECT *
FROM emp
WHERE comm > (SELECT comm
                        FROM emp
                        WHERE ename = 'ALLEN');
                        

SELECT *
FROM emp
WHERE hiredate < (SELECT hiredate
                            FROM emp
                            WHERE ename = 'SCOTT')
ORDER BY 1 DESC;


SELECT *
FROM emp e, dept d
WHERE e.deptno = d.deptno
AND e.deptno = 20
AND e.sal >(SELECT AVG(sal)
                FROM emp e);
                
SELECT *
FROM emp e, dept d
WHERE e.deptno = d.deptno
AND e.deptno = 20
AND SAL <= (SELECT AVG(sal)
                    FROM emp);
                    
SELECT *
FROM emp
WHERE deptno IN (20, 30);

SELECT *
FROM emp
WHERE sal IN (SELECT MAX(sal)
                        FROM emp
                        GROUP BY deptno);
                        
SELECT MAX(sal)
    FROM emp
GROUP BY deptno;


SELECT *
FROM emp
WHERE sal  IN (SELECT MAX(sal)
                            FROM emp
                            GROUP BY deptno);
                        
SELECT *
FROM emp
WHERE sal IN (SELECT sal
                            FROM emp
                            WHERE deptno = 30)
ORDER BY sal, empno;

SELECT *
FROM emp
WHERE sal > ALL(SELECT sal
                         FROM emp
                         WHERE deptno = 30);
SELECT * FROM dept;      
SELECT *
FROM emp
WHERE EXISTS(select dname
                        FROM dept
                        WHERE deptno = 20);
                        
SELECT *
FROM emp
WHERE EXISTS (SELECT dname
                            FROM dept
                            WHERE deptno = 50);
                            
SELECT *
FROM emp
WHERE hiredate  < ALL(SELECT HIREDATE
                                    FROM emp
                                    WHERE deptno = 10);
                                    
SELECT *
FROM emp
WHERE (deptno,sal) IN (SELECT deptno, MAX(sal)
                                    FROM emp
                                    GROUP BY deptno);
                                    
SELECT E10.empno,E10.ename,E10.deptno,D.dname,D.loc
FROM (SELECT * FROM emp WHERE  deptno =10) E10,
            (SELECT * FROM dept) D
WHERE E10.deptno = d.deptno;


SELECT empno,ename,job,sal
            ,(SELECT grade
            FROM salgrade
            WHERE e.sal BETWEEN losal AND hisal) as salgrade
            ,deptno
            ,(SELECT dname
            FROM dept
            WHERE e.deptno = dept.deptno) as DNAME
FROM emp e;

SELECT e.job,e.empno,e.ename,e.sal
            ,d.deptno,d.dname
FROM emp e,dept d
WHERE e.deptno = d.deptno
AND     e.job = (SELECT  JOB
                        FROM emp
                        where ename = 'ALLEN');
                        
SELECT *
FROM emp e,dept d,salgrade s
where e.deptno = d.deptno
AND  e.sal BETWEEN  s.losal AND s.hisal
AND e.sal > (SELECT AVG(sal)
                        FROM emp)
ORDER BY 6 DESC;

SELECT *
FROM emp e,dept d
WHERE e.deptno = d.deptno
AND e.deptno =10
AND e.job NOT IN (SELECT job
                            FROM emp 
                            WHERE deptno = 30);
                            
SELECT e.empno
            ,e.ename
            ,e.sal
            ,s.grade
FROM emp e,dept d,salgrade s
WHERE e.deptno = d.deptno
AND e.sal BETWEEN s.losal  AND s.hisal
AND e.sal > (SELECT MAX(sal)
                    FROM emp
                    WHERE JOB IN 'SALESMAN');