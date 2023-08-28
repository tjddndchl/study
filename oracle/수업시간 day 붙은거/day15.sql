/*  PL/SQL 집합적 언어와 절차적 언어의 특징을 모두 사용하기 위함.
    DB내부에서 수행되기 때문애 속도와 안전성이 높음.
    기본 단위를 블록(Block)이라고 하며 이름부, 선언부, 실행부로 구성됨.
*/
--이름부는 블록의 명칭이 오는데 생략할 때는 익명 블록이 된다.

DECLARE --이름이 없음

    vi_num NUMBER := 1;
BEGIN
    vi_num :=100; --:=할당의 의미
    DBMS_OUTPUT.PUT_LINE(vi_num); --콘솔 프린트
END;
 --실행을 영역을 선택 후 실행   
 
 DECLARE
  vs_emp_name VARCHAR2(80);
  vs_dep_name departments.department_name%TYPE; -- 테이블에 있는 타입과 사이즈
BEGIN
    SELECT a.emp_name, b.department_name
    INTO vs_emp_name, vs_dep_name  --출력결과를 변수에 담는법
    FROM employees a, departments b
    WHERE a.department_id = b.department_id
    AND a.employee_id = 100;
    DBMS_OUTPUT.PUT_LINE(vs_emp_name || ':' || vs_dep_name);
END;

-- IF 문
DECLARE
    vn_user_num NUMBER := TO_NUMBER(:userNm);
    vn_com_num NUMBER := 10;
BEGIN
    IF vn_user_num > vn_com_num THEN
        DBMS_OUTPUT.PUT_LINE('user 숫자가 더 큼');
    ELSIF vn_user_num = vn_com_num THEN
        DBMS_OUTPUT.PUT_LINE('같음');
    ELSE
        DBMS_OUTPUT.PUT_LINE('USER 숫자가 더 작음');
    END IF;-- IF로 열고 END IF로 닫음.
END;

--선언어 필요 없으면 BEGIN

BEGIN
     DBMS_OUTPUT.PUT_LINE('3 * 3 =' || 3* 3);
 END;
 
 /*
    신입생이 들어왔습니다.^^
    기존학번의 가장 높은 학번을찾아 + 1을하여 학번을 생성 후
    학생테이블에 저장해주세요
    만약 올해 첫 학생이려면 해당 년도에 000001 을 붙여서 학번을 생성.
    
    1.  올해년도
    2.  학번의 max값 
    3.  2.학번의 앞자리 4자리와 올해년도 비교
    4.  조건문
    5.  INSERT
 */

SELECT TO_CHAR(SYSDATE,'YYYY')
FROM dual;

 SELECT MAX(학번)
 FROM 학생 ;
 
 DECLARE
    vs_nm 학생.이름%TYPE                :=  :nm;
    vs_subject 학생.전공%TYPE           :=  :sub;
    vn_year VARCHAR2(4)                 :=  TO_CHAR(SYSDATE,'YYYY');
    vn_max_num NUMBER;
    vn_make_num NUMBER;
 BEGIN
    SELECT MAX(학번)
    INTO vn_max_num
    FROM 학생;
    
    IF vn_year = SUBSTR(vn_max_num,1,4) THEN
        vn_make_num := vn_max_num +1;
    ELSE
        vn_make_num := TO_NUMBER(vn_year ||  '000001');
    END IF;
        INSERT INTO 학생(학번, 이름, 전공)
        VALUES  (vn_make_num,   vs_nm,  vs_subject);
        COMMIT;
 END;
 


 SELECT *
 FROM 학생 
 where 학번  = 2023000001;
 
 /* 
    LOOF문
    단순LOOF문은 EXIT(탈출조건) 필수
    WHILE 은 시작에 조건이 true 이면 LOOF진입
    F은OR  IN 초깃값...최대값 1씩 초깃값에서 최대값까지 증가
 */
 
 DECLARE
    vn_gugudan NUMBER :=2;
    vn_i NUMBER             :=1;
    
BEGIN


WHILE (vn_gugudan <10)
    LOOP
            vn_i :=vn_i +1;
            EXIT WHEN vn_i > 9;--탈출 조건
              DBMS_OUTPUT.PUT_LINE(vn_gugudan
             ||'*' ||vn_i ||'-'||vn_gugudan*vn_i);
    END LOOP;

END;




DECLARE
    vn_i NUMBER :=  2;
    
    vn_j NUMBER    ;
    
BEGIN

    LOOP
        DBMS_OUTPUT.PUT_LINE(vn_i || '단');
        vn_j := 1;

        LOOP
            DBMS_OUTPUT.PUT_LINE(vn_i || '*'||vn_j||'='||vn_i *vn_j);
            vn_j := vn_j+1;
            EXIT WHEN vn_j > 9;
        END LOOP;
            vn_i    := vn_i +1;
            EXIT WHEN vn_i > 9;--탈출 조건

    END LOOP;

END;

--FOR 문

BEGIN
    FOR i  IN 1..9 --1~9까지 1씩증가
    LOOP
        DBMS_OUTPUT.PUT_LINE(2  ||  '*' ||  '=' ||2*i);
    END LOOP;
END;


--RERVERSE  반대로
BEGIN
    FOR i  IN REVERSE 1..9 --9~1까지 1씩 감소
    LOOP
        DBMS_OUTPUT.PUT_LINE(2  ||  '*' || i    ||  '=' ||2*i);
    END LOOP;
END;



/*
    oracle 사용자 정의함수 pl/sql 로 작성
    오라클 함수는 무조건 리턴값이 1개 있어야함.
*/

--이름일 입력받아 학번을 리턴하는 함수 작성
--input:varchar2, output:number

CREATE OR REPLACE FUNCTION fn_get_hakno (nm VARCHAR2)
    RETURN NUMBER
IS  --이름 없는 블록작성시 선언부는 IS로 시작
    vn_hakno NUMBER;
BEGIN
    SELECT 학번
    INTO vn_hakno
    FROM 학생
    WHERE 이름 = nm;
    RETURN vn_hakno;
END;

SELECT fn_get_hakno('최숙경')
FROM dual;


--학생이름 을 입력받아 총수강 학점을 리턴하는 함수들 만드시오


SELECT b.이름
            ,SUM(c.학점)
FROM 수강내역 a,학생 b,과목 c
WHERE a.학번 = b. 학번
AND a.과목번호 = c.과목번호
GROUP BY b.이름;




CREATE OR REPLACE FUNCTION fn_get_hakno (nm VARCHAR2)
    RETURN NUMBER
IS  --이름 없는 블록작성시 선언부는 IS로 시작
    vn_hakno NUMBER;
BEGIN
    SELECT 학번
    INTO vn_hakno
    FROM 학생
    WHERE 이름 = nm;
    RETURN vn_hakno;
END;

SELECT fn_get_hakno('최숙경')
FROM dual;
--이름으로 총학점을 구하는 select문 작성
--2.pl/sql활용하여 함수작성
CREATE OR REPLACE FUNCTION fn_get_grades (nm VARCHAR2)
    RETURN NUMBER
IS  --이름 없는 블록작성시 선언부는 IS로 시작
    vn_grades NUMBER;
BEGIN
            SELECT 
            SUM(c.학점)
            INTO vn_grades
            FROM 수강내역 a,학생 b,과목 c
            WHERE a.학번 = b. 학번
            AND a.과목번호 = c.과목번호
            AND b.이름 = nm;
            RETURN vn_grades;
END;

SELECT fn_get_grades('최숙경')
FROM dual;


--d_day를 입력받아(YYYYMMDD)
--남은날을      input:20230829 return: 1일 남음
--지난날은 음수로 표현   input:20230827  return: 1일 지남
--을 수행하는 함수를 작성하시오
--input: varchar2, output: varchar2

SELECT  TO_DATE('20230826')-TO_DATE(SYSDATE) 
            ,CASE WHEN TO_DATE('20230826') > TO_DATE(SYSDATE) THEN  
            TO_DATE('20230826')-TO_DATE(SYSDATE) || '일남음'
            WHEN  TO_DATE('20230826') < TO_DATE(SYSDATE) THEN
           TO_DATE(SYSDATE)-TO_DATE('20230826') || '일지 남'
            END 날짜
FROM dual;


SELECT *
FROM dual;
CREATE OR REPLACE FUNCTION fn_get_day (day1 VARCHAR2)
    RETURN  VARCHAR2
IS  --이름 없는 블록작성시 선언부는 IS로 시작
    vn_day VARCHAR2(1000);
    BEGIN
    SELECT  CASE WHEN TO_DATE(day1) > TO_DATE(SYSDATE) THEN  
            TO_DATE(day1)-TO_DATE(SYSDATE) || '일남음'
            WHEN  TO_DATE(day1) < TO_DATE(SYSDATE) THEN
           TO_DATE(SYSDATE)-TO_DATE(day1) || '일지 남'
            END 날짜
            INTO vn_day
FROM dual;
RETURN vn_day;
END;

SELECT fn_get_day('20230831')
FROM dual;



    SELECT CASE WHEN TO_DATE('20230826') > TO_DATE(SYSDATE) THEN  
            TO_DATE('20230826')-TO_DATE(SYSDATE) || '일남음'
            WHEN  TO_DATE('20230826') < TO_DATE(SYSDATE) THEN
           TO_DATE(SYSDATE)-TO_DATE('20230826') || '일지 남'
            END 날짜
FROM dual;