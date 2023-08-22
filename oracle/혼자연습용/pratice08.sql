SELECT *
FROM emp, dept
ORDER BY empno;

SELECT *
FROM emp, dept
WHERE emp.deptno = dept.deptno
ORDER BY empno;

SELECT e.deptno,d.dname
FROM emp e,dept d
WHERE e.deptno = d.deptno;

SELECT empno,ename,deptno,dname,loc--똑같은거 2개 애매함
FROM emp d, dept d
WHERE e.deptno = d.deptno;

SELECT *
FROM emp e
        ,dept d
WHERE e.sal <= 2500
AND d.deptno <= 9999;

SELECT *
FROM emp e,salgrade s
WHERE e.sal BETWEEN s.losal AND s.hisal;

SELECT *
FROM emp e1,emp e2
WHERE e1.mgr = e2.empno;

SELECT *
FROM emp e1,emp e2
WHERE e1.mgr = e2.empno(+);

SELECT *
FROM emp e1,emp e2
WHERE e1.mgr(+) = e2.empno;

SELECT e.empno , e.ename, e.job, e.mgr, e.hiredate, e.sal,e.comm,
    deptno, d.dname,d.loc
from emp e natural join dept d
order by deptno , e.empno;

SELECT *
FROM emp e JOIN dept d USING(deptno)
WHERE sal>=3000
ORDER BY deptno, e.empno;

SELECT *
FROM emp e JOIN dept d ON(e.deptno =d.deptno)
WHERE sal <= 3000
ORDER BY e.deptno, empno;


SELECT * FROM dept;
SELECT * FROM emp;
SELECT * FROM salgrade;
SELECT *
FROM emp e,dept d
WHERE e.deptno = d.deptno
AND sal > 2000;


SELECT e.deptno
               , dname
            ,TRUNC(AVG(sal),0)
            ,MAX(sal)
            ,TRUNC(COUNT(e.deptno),0)
FROM emp e,dept d
WHERE e.deptno = d.deptno
GROUP BY e.deptno, dname;



SELECT e.deptno
            ,d.dname
            ,e.ename
            ,e.job
            ,e.sal
FROM emp e,dept d
WHERE d.deptno = e.deptno
ORDER BY 1,2;

SELECT d.deptno
            ,d.dname
            ,e.empno
            ,e.ename
            ,e.mgr
            ,e.sal
            ,d.deptno
            ,s.losal
            ,s.hisal
            ,s.grade
            ,e1.mgr as MGR_empno
            ,e1.ename as MGR_ename
            
FROM emp e,dept d, salgrade s, emp e1
WHERE e.deptno =d.deptno(+)
AND   e.sal(+)  between s.losal AND s.hisal
AND  e1.mgr(+)= e.empno ;

SELECT D.DEPTNO, D.DNAME,
       E.EMPNO, E.ENAME, E.MGR, E.SAL, E.DEPTNO,
       S.LOSAL, S.HISAL, S.GRADE,
       E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
  FROM EMP E RIGHT OUTER JOIN DEPT D
                ON (E.DEPTNO = D.DEPTNO)
              LEFT OUTER JOIN SALGRADE S
                ON (E.SAL BETWEEN S.LOSAL AND S.HISAL)
              LEFT OUTER JOIN EMP E2
                ON (E.MGR = E2.EMPNO)
ORDER BY D.DEPTNO, E.EMPNO; 
            