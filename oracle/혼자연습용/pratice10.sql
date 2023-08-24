CREATE TABLE dept_temp
AS SELECT * FROM dept;
SELECT * FROM dept_temp;

SELECT * FROM emp;
CREATE  TABLE emp_temp
AS SELECT * FROM emp;
SELECT * FROM emp_temp;

INSERT INTO dept_temp(deptno, dname, loc) VALUES(50,'DATABASE','SEOUL');

INSERT INTO dept_temp VALUES(60, 'NETWORK', 'BUSAN');

INSERT INTO dept_temp(deptno, dname, loc)
                    VALUES (70,'WEB',NULL);

INSERT INTO dept_temp(deptno, dname,loc)
            VALUES(80, 'MOBILE','');
                    
INSERT INTO dept_temp(deptno, loc)
            VALUES(90   ,'INCHEON');
            
CREATE TABLE emp_temp
    AS SELECT *
        FROM emp
    WHERE 1<>1;
    
INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
    VALUES (9999, '홍길동', 'president', null, '2001/01/01',5000,1000,10);
    
  
 INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
    VALUES (1111, '성춘향', 'MANAGER', 9999, '2001-01-05',4000,NULL,20);


 INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
    VALUES (2111, '이순신', 'MANAGER', 9999, to_date('07/01/2001','DD/MM/YYYY'),4000,NULL,20);   
    
    
INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
    SELECT e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, e.deptno
    FROM emp e, salgrade s
    WHERE e.sal BETWEEN s.losal AND s.hisal
    AND s.grade =1;
    
SELECT * FROM emp_temp;


INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
    SELECT e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, e.deptno
    FROM emp e, salgrade s
    WHERE e.sal BETWEEN s.losal AND s.hisal
    AND s.grade =1;
   
CREATE TABLE dept_temp2
    AS SELECT *FROM dept;
    
SELECT * FROM dept_temp2;

UPDATE dept_temp2
    SET loc = 'SEOUL';
SELECT * FROM dept_temp2;

UPDATE dept_temp2
 SET dname = 'DATABASE'
        ,LOC = 'SEOUL'
WHERE deptno = 40;

SELECT * FROM emp_temp;

UPDATE emp_temp
SET comm = 50
WHERE sal <= 2500;


/*서브쿼리로 데이터 일부분 수정하기*/
UPDATE dept_temp2
SET(dname, loc) = (SELECT dname, loc
                                FROM dept
                                WHERE deptno =40)
WHERE deptno = 40;

SELECT * FROM dept_temp2;

---------UPDATE문의 WHERE절에 서브쿼리로 사용하기--------------

UPDATE dept_temp2
    SET loc = 'SEOUL'
    WHERE deptno = (SELECT deptno
                                FROM dept_temp2
                                WHERE dname= 'OPERATIONS');
                                
CREATE TABLE emp_temp2
AS SELECT * FROM emp;
 
 SELECT * FROM emp_temp2;
DELETE FROM emp_temp2
WHERE empno in (SELECT e.empno
                            FROM emp_temp2 e, salgrade s
                            WHERE e.sal between s.losal AND s.hisal
                            and s.grade =3
                            and deptno = 30);
SELECT * FROM emp_temp2;

DELETE  FROM emp_temp2
WHERE sal >= 3000;

DELETE FROM emp_temp2;

SELECT * FROM emp_temp2;