/*
숫자타입 (number)
number(p, s)p는 소수점을 기준으로 모든 유효숫자 자릴수를 의미함.
            s는 소수점 자릿수를 의미함. (s는 디폴트 0)
            s가 2이면 소수점 2자리 까지 반올림.
            s가 음수이면 소수점 기준 왼쪽 자리수 만큼 반올림
            
*/
--테이블삭제
DROP TABLE ex3_1;
--테이블 기본 속성정보 조회(컬럼명, 타입, 사이즈)
DESC ex3_1;

CREATE TABLE ex3_1(
        num1 number(3,1) --정수 3자리
        ,num2 number(3, 2)--전체 정수 1자리 소수점 2자리
        ,num3 number(5, -2)--십의 자리까지 반올림, 총(7)
        );
INSERT INTO ex3_1(num1) VALUES(111.7898);
INSERT INTO ex3_1(num1) VALUES(99.55);
INSERT INTO ex3_1(num1) VALUES(1004);
SELECT *
    FROM ex3_1;
INSERT INTO ex3_1(num2) VALUES(0.7898);
INSERT INTO ex3_1(num2) VALUES(1.2345);
INSERT INTO ex3_1(num2) VALUES(32);--오류

INSERT INTO ex3_1(num3) VALUES(12345.2345);
INSERT INTO ex3_1(num3) VALUES(1234519.2345);
INSERT INTO ex3_1(num3) VALUES(12345679.2345);--오류 전체 7자리

/*
    날짜 데이터 타입(DATE(년월일시분초), TIMESTAMP(년월일시분초밀리초))
*/
CREATE TABLE ex3_2(
    date1 DATE
    ,date2 TIMESTAMP
);
--sysdate 현재시간 date타입으로, systimestamp현재시간 timestamp타입으로
INSERT INTO ex3_2 VALUES(SYSDATE, SYSTIMESTAMP);
SELECT * 
    FROM ex3_2;
    
CREATE TABLE ex3_3(
    user_id VARCHAR2(100)
    ,create_dt DATE DEFAULT SYSDATE
);
INSERT INTO ex3_3(user_id) VALUES ('a001');
SELECT *
FROM ex3_3;


/*
    제약 조건
    NOT NULL 널을 허용하지 않겠다.
    UNIQUE 중복을 허용하지 않겠다.
    CHECK 특정 데이터만 받겠다.
    PRIMARY KEY 기본키(하나의 테이블에 1개만 설정가능)
                한 행을 구분하는 식별자로 사용 PK로 설정하면 UNIQUE&NOT NULL 적용
    FOREIGN KEY 외래키 다른테이블의 pk를 참조하는 키
    
*/

CREATE TABLE ex3_4(
    mem_id VARCHAR2(100) NOT NULL UNIQUE
    ,mem_nm VARCHAR2(100)
    ,mem_email VARCHAR2(100) NOT NULL
    , CONSTRAINT uq_ex3_4 UNIQUE(mem_email)
);

INSERT INTO ex3_4(mem_id, mem_email) VALUES('a001', 'a001@gamil.com');
INSERT INTO ex3_4(mem_id, mem_email) VALUES('a001', 'a001@gmail.com');--오류 unique
INSERT INTO ex3_4(mem_nm) VALUES('펭수');
SELECT * FROM ex3_4;
    
SELECT *
    FROM user_constraints
WHERE constraint_name LIKE '%EX%';

--check 제약조건
CREATE TABLE ex3_5(
    nm VARCHAR2(100)
    ,age NUMBER
    ,gender VARCHAR2(1)
    ,CONSTRAINT ck_ex3_5_age CHECK(age BETWEEN 1 AND 150)
    ,CONSTRAINT ck_ex3_5_gender CHECK(gender IN('F','M'))
);

INSERT INTO ex3_5 VALUES ('펭수', 10, 'M');
INSERT INTO ex3_5 VALUES ('펭수', 10, 'A');--오류 F or M check
INSERT INTO ex3_5 VALUES ('펭수', 151, 'M');-- 오류 age 사이즈

SELECT * FROM ex3_5;
/*
    foreing key 사용시
*/

CREATE TABLE dep(
    deptno NUMBER(3) CONSTRAINT dep_pk_deptno PRIMARY KEY ,
    deptname VARCHAR2(20) ,
    floor NUMBER(5)
);

CREATE TABLE emp(
    empno NUMBER(5) CONSTRAINT emp_pk_employee PRIMARY KEY ,
    empname VARCHAR2(20) ,
    title VARCHAR2(20) ,
    dno NUMBER(3) CONSTRAINT emp_fk_dno REFERENCES dep(deptno),
    salary NUMBER(10)
);
COMMIT;

INSERT INTO DEP (DEPTNO, DEPTNAME, FLOOR) VALUES (1, '영업', 8);
INSERT INTO DEP (DEPTNO, DEPTNAME, FLOOR) VALUES (2, '기획', 10);
INSERT INTO DEP (DEPTNO, DEPTNAME, FLOOR) VALUES (3, '개발', 9);

INSERT INTO DEP (DEPTNO, DEPTNAME, FLOOR) VALUES (4, 'DB', 8);

INSERT INTO EMP (EMPNO, EMPNAME, TITLE, DNO, SALARY) VALUES (2106, '김창섭', '대리', 2, 2000000);
INSERT INTO EMP (EMPNO, EMPNAME, TITLE, DNO, SALARY) VALUES (3426, '박영권', '과장', 3, 2500000);
INSERT INTO EMP (EMPNO, EMPNAME, TITLE, DNO, SALARY) VALUES (3011, '이수민', '부장', 1, 3000000);
INSERT INTO EMP (EMPNO, EMPNAME, TITLE, DNO, SALARY) VALUES (1003, '조민희', '대리', 1, 2000000);
INSERT INTO EMP (EMPNO, EMPNAME, TITLE, DNO, SALARY) VALUES (3427, '최종철', '사원', 3, 1500000);

INSERT INTO EMP (EMPNO, EMPNAME, TITLE, DNO, SALARY) VALUES (3428, '펭수', '사원', 4, 1500000);
--물리적으로 반영
COMMIT;
--취소
ROLLBACK;


SELECT * FROM emp;
SELECT * FROM dep;
--참조하고 있는 테이블이 있기 때문에 그냥 drop은 안됨.
--제약 조건 제거 후 테이블 삭제

drop table dep cascade constraints;

select * 
    FROM emp, dep 
WHERE    emp.dno = dep.deptno --join뒤에사 베울내용 테이블간 관계를 맺는 방법
AND emp.empname = '이수민'; 

