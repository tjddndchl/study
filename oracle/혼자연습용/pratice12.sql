CREATE TABLE emp_ddl(
    empno NUMBER(4),
    ename VARCHAR2(10),
    job VARCHAR2(9),
    mgr NUMBER(4),
    hiredate DATE,
    sal NUMBER(7,2),
    comm number(7,2),
    deptno NUMBER(2)
);

DESC emp_ddl;

CREATE TABLE dept_ddl
    AS SELECT * FROM dept;
DESC dept_ddl;

CREATE TABLE emp_ddl_30
    AS SELECT *
    FROM emp
    WHERE deptno = 30;
SELECT * FROM emp_ddl_30;

CREATE TABLE emp_alter
    AS SELECT * FROM emp;
SELECT * from emp_alter;

ALTER TABLE emp_alter
    ADD HP VARCHAR2(20);
    
    
ALTER TABLE emp_alter
    RENAME COLUMN HP TO TEL;
    
ALTER TABLE emp_alter
    MODIFY empno NUMBER(5);

DESC emp_alter;

ALTER TABLE emp_alter
DROP COLUMN TEL;

RENAME emp_alter TO EMP_RENAME;
SELECT * FROM emp_rename;