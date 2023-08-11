SELECT TO_CHAR(123456, '999,999,999')
    ,  TO_CHAR(SYSDATE, 'YYYY-MM-DD')
    ,  TO_CHAR(SYSDATE, 'YYYYMMDD')
    ,  TO_CHAR(SYSDATE, 'YYYYMMDD HH:MI:SS')
    ,  TO_CHAR(SYSDATE, 'YYYYMMDD HH12:MI:SS')
    ,  TO_CHAR(SYSDATE, 'day')
    ,  TO_CHAR(SYSDATE, 'yyyy')
    ,  TO_CHAR(SYSDATE, 'dd')
    ,  TO_CHAR(SYSDATE, 'd')
FROM dual;

SELECT TO_DATE('230713', 'YYMMDD')
    --TO_DATE는 날짜 데이터타입으로 형변환
    --입력 포맷과 동일하게 표현해야 DATE로 바뀜
    ,  TO_DATE('2023 08 12 10:00:00', 'YYYY MM DD HH24:MI:SS')
FROM dual;

CREATE TABLE tb_myday(
    title VARCHAR2(200)
    ,d_day DATE
    
);

INSERT INTO tb_myday VALUES ('종료일', '20231226');
INSERT INTO tb_myday VALUES ('종료일', '2023.12.26');
INSERT INTO tb_myday VALUES ('종료일', '23.12.26');
INSERT INTO tb_myday VALUES ('종료일', '23|12|26');
INSERT INTO tb_myday VALUES ('종료일', '23|12|26 18');
INSERT INTO tb_myday VALUES ('종료일',TO_DATE('231226 18','YYMMDD HH24'));

CREATE TABLE ex5_1(
    seq VARCHAR2(100)
    ,seq2 NUMBER
);

INSERT INTO ex5_1 VALUES('1234', '1234');
INSERT INTO ex5_1 VALUES('99', '99');
INSERT INTO ex5_1 VALUES('123456', '123456');
SELECT *
    FROM ex5_1

    
ORDER BY TO_NUMBER(seq) DESC;

SELECT *
    FROM students;
--students 테이브을 활용하여학번, 학생이름, 나이를 출력하시오

SELECT stu_id
    , stu_name
    ,substr ((TO_CHAR(SYSDATE,'YYYY') -(substr(stu_birth,1,2)+1900)),1,2) as 나이
FROM students;

select CUST_YEAR_OF_BIRTH
    ,substr ((TO_CHAR(SYSDATE,'YYYY') -(substr(cust_year_of_birth,1,4))),1,7) as 나이
    
FROM customers

ORDER BY  TO_NUMBER(나이) ;



--입력한 두자리값이 50이상이면 20세기로 해석
SELECT stu_id
    ,stu_birth
    ,TO_CHAR(TO_DATE(stu_birth,'YYMMDD'),'YYYY')
    ,TO_DATE(stu_birth, 'RRMMDD')
    ,TO_CHAR(TO_DATE(stu_birth, 'RRMMDD'),'YYYY')
FROM students;

--employees 의 hire_date 컬럼을 활용하여 근속 년수를 출력하시오

SELECT hire_date
    ,TO_CHAR(SYSDATE,'YYYY')
    ,TO_CHAR(hire_date,'YYYY')
    ,TO_CHAR(SYSDATE,'YYYY') - TO_CHAR(hire_date,'YYYY') as 근속연수
FROM employees

ORDER BY 근속연수 desc, 1;

--null 관련
--** NVL(null, 변환값)
SELECT emp_name, salary, commission_pct
    , salary * NVL(commission_pct,0)
FROM employees;

--DECODE 변환 (case와 유사함)
SELECT cust_id, cust_name
    -- 대상건  , 값, 같으면, 그밖에)
    ,DECODE(cust_gender,'M','남자','여자') as gender
    -- 대상건   ,값, 같으면, 값2, 같으면, '그밖에'
    ,DECODE(cust_gender,'M','남자','F','여자','??') as gender2
FROM customers;
/*
    고객 테이블
    고객 출생년도 칼럼이 있다.
    현재일 기준으로 이칼럼을 활용해 30대 40대 50대를 구분해 출력하고
    나머지 연령대는 '기타'로 출력하는 쿼리를 작성하시오
*/
select CUST_YEAR_OF_BIRTH
    ,TO_CHAR(SYSDATE,'YYYY')-cust_year_of_birth as 나이
    ,SUBSTR((TO_CHAR(SYSDATE,'YYYY')-cust_year_of_birth),1,2)-SUBSTR((TO_CHAR(SYSDATE,'YYYY')-cust_year_of_birth),2,1)|| '대' as 나잇대
     
FROM customers;

