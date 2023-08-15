SELECT ename, upper(ename), lower(ename), initcap(ename)
    FROM emp;
    
SELECT *
    FROM emp
WHERE upper(ename) = upper('s');--사원이름이  S인 데이터 찾기

 SELECT *
    FROM emp
WHERE UPPER(ename) like UPPER('%a%');--사원이름에 a들어간  데이터 찾기
SELECT UPPER(ename)
    FROM emp;
    
SELECT ename, LENGTH(ename)
    FROM emp;
    
SELECT ename, LENGTH(ename)
    FROM emp
WHERE LENGTH(ename) >= 5;

SELECT *
    FROM emp
WHERE LENGTH(job) >= 6;

SELECT SUBSTR(ename,3)
    FROM emp;
    

SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1,
       INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2,
       INSTR('HELLO, ORAC:E!', 'L',2,2) AS INSTR_3
FROM DUAL;


SELECT INSTR(upper(ename), 'S')
    FROM emp;
    
SELECT *
    FROM emp
where INSTR(ename, 'S') > 0;

SELECT INSTR(ename, 'F') 
FROM emp;

SELECT '010-1234-5678' AS REPLACE_BEFORE,
      REPLACE('010-1234-5678','-','') AS REPLACE_1,
      REPLACE('010-1234-5678','-') AS REPLACE_2
FROM DUAL;


SELECT 'Oracle',-- LPAD , RPAD 데이터의 빈자리를 채우는 함수
    LPAD('Oracle', 20, '#') AS LPAD_1,
    RPAD('Oracle', 20, '*') AS RPAD_2,
    LPAD('Oracle', 10) AS LPAD_2,
    RPAD('Oracle', 10) AS RPAD_2
FROM DUAL;

SELECT RPAD ('951017-',14,'*') as 주민번호
       ,RPAD('010-1234-',13,'#') as 전화번호
FROM DUAL;

SELECT CONCAT(empno,ename)--CONCAT 문자열을 합치는 함수
    ,  CONCAT(empno,CONCAT(':',  ename))
FROM emp
WHERE ename like '%S%';

SELECT ename || empno
    ,  ename || ':' || empno
FROM emp;

SELECT  '[' || TRIM('       _ _  Oracle  _  _            ') || ']' AS TRIM,
        '[' || TRIM(LEADING FROM '                       _ _ O  r  a     cle _     _              ')|| ']' AS TRIM_LEADING,
        '[' || TRIM(TRAILING FROM '         _ _ Ora             cle _         _                ') || ']' AS TRIM_TRAILING,
        '[' || TRIM(BOTH FROM '     _ _ Or  a  c    le _     _        ') || ']' AS TRIM_BOTH
FROM DUAL;

SELECT  '[' || TRIM('_' FROM  '_  _ Oracle _    _') || ']' AS TRIM,
        '[' || TRIM(LEADING '_'    FROM ' _ _ O  r  a     cle _     _')|| ']' AS TRIM_LEADING,
        '[' || TRIM(TRAILING  '_'   FROM '_   _ Ora             cle _ _ ') || ']' AS TRIM_TRAILING,
        '[' || TRIM(BOTH  '_'  FROM '_ _ Or  a  c    le _    _ ') || ']' AS TRIM_BOTH
FROM DUAL;



SELECT ROUND(1234.5678) AS ROUND,
       ROUND(1234.5678, 0) AS ROUND_0,
       ROUND(1234.5678, 1) AS ROUND_1,
       ROUND(1234.5678, 2) AS ROUND_2,
       ROUND(1234.5678, -1) AS ROUND_MINUS1,
       ROUND(1234.5678, -2) AS ROUND_MINUS2
FROM dual;

SELECT TRUNC(1234.5678) AS TRUNC,
            TRUNC(1234.5678,2) AS TRUNC_2
from dual;

SELECT CEIL(3.14),
             FLOOR(3.14),
            CEIL(-3.14),
            FLOOR(-3.14)
FROM DUAL;


SELECT MOD(15, 6), MOD(10,2), MOD(11,2)
    FROM DUAL;
    
SELECT SYSDATE AS NOW,
            SYSDATE-1 AS YESTERDAY,
            SYSDATE+1 AS TOMORROW
from dual;

SELECT SYSDATE,
    ADD_MONTHS(SYSDATE, 3)
FROM DUAL;

SELECT empno,
             ename, 
             hiredate, 
             SYSDATE
FROM emp

WHERE ADD_MONTHS(hiredate, 700)  > SYSDATE;

SELECT SYSDATE,
    ADD_MONTHS(SYSDATE, 6)
FROM DUAL;

SELECT empno, ename, hiredate, SYSDATE,
    MONTHS_BETWEEN(hiredate, SYSDATE) AS MONTHS1,
    MONTHS_BETWEEN(SYSDATE, hiredate) AS MONTHS2,
    TRUNC(MONTHS_BETWEEN(SYSDATE,hiredate))  AS MONTHS3
FROM emp;
 
 SELECT SYSDATE,
        NEXT_DAY(SYSDATE, '월요일'),--돌아오는 날짜
        LAST_DAY(SYSDATE)--해달 월의 마지막 날짜
FROM DUAL;
 
 
 SELECT SYSDATE,
    ROUND(SYSDATE, 'YYYY') AS YYYY,
    ROUND(SYSDATE, 'Q') AS Q,
    ROUND(SYSDATE, 'HH') AS HH,
    ROUND(SYSDATE, 'HH12') AS HH,
    ROUND(SYSDATE, 'HH24') AS HH,
    ROUND(SYSDATE,'MM') AS yymmddhh
FROM DUAL;

SELECT empno, ename, empno+'500'
FROM emp;

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS 현재날짜시간
FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'mon')
FROM DUAL;


SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'MM') AS  MM,
    TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = KOREAN') AS MON_KOR,
    TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JPN,
    TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = english') AS MON_ENG
FROM DUAL;

SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'HH24:MI:SS'),
    TO_CHAR(SYSDATE, 'HH24:MI:SS AM'),
    TO_CHAR(SYSDATE, 'HH24:MI:SS P.M.')
FROM DUAL;

SELECT SAL,
    TO_CHAR(SAL, '$999,999') AS SAL_$,
    TO_CHAR(SAL, 'L999,999') AS SAL_$,
    TO_CHAR(SAL, '000,999,999.00') AS SAL_$,
    TO_CHAR(SAL, '000,999,999') AS SAL_$
FROM emp;

SELECT 1300 - '1500',
    '1300' + 1500
FROM DUAL;

SELECT '1,300' - '1,500'
FROM DUAL;

SELECT TO_NUMBER('1,300','999,999')-TO_NUMBER('1,500','999,999')
FROM DUAL;