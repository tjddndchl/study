CREATE TABLE exp_goods_asia (
       country VARCHAR2(10),
       seq     NUMBER,
       goods   VARCHAR2(80));

INSERT INTO exp_goods_asia VALUES ('한국', 1, '원유제외 석유류');
INSERT INTO exp_goods_asia VALUES ('한국', 2, '자동차');
INSERT INTO exp_goods_asia VALUES ('한국', 3, '전자집적회로');
INSERT INTO exp_goods_asia VALUES ('한국', 4, '선박');
INSERT INTO exp_goods_asia VALUES ('한국', 5,  'LCD');
INSERT INTO exp_goods_asia VALUES ('한국', 6,  '자동차부품');
INSERT INTO exp_goods_asia VALUES ('한국', 7,  '휴대전화');
INSERT INTO exp_goods_asia VALUES ('한국', 8,  '환식탄화수소');
INSERT INTO exp_goods_asia VALUES ('한국', 9,  '무선송신기 디스플레이 부속품');
INSERT INTO exp_goods_asia VALUES ('한국', 10,  '철 또는 비합금강');

INSERT INTO exp_goods_asia VALUES ('일본', 1, '자동차');
INSERT INTO exp_goods_asia VALUES ('일본', 2, '자동차부품');
INSERT INTO exp_goods_asia VALUES ('일본', 3, '전자집적회로');
INSERT INTO exp_goods_asia VALUES ('일본', 4, '선박');
INSERT INTO exp_goods_asia VALUES ('일본', 5, '반도체웨이퍼');
INSERT INTO exp_goods_asia VALUES ('일본', 6, '화물차');
INSERT INTO exp_goods_asia VALUES ('일본', 7, '원유제외 석유류');
INSERT INTO exp_goods_asia VALUES ('일본', 8, '건설기계');
INSERT INTO exp_goods_asia VALUES ('일본', 9, '다이오드, 트랜지스터');
INSERT INTO exp_goods_asia VALUES ('일본', 10, '기계류');

COMMIT;

SELECT *
FROM exp_goods_asia;

SELECT goods
FROM exp_goods_asia
WHERE country = '한국'

UNION--중복 삭제

SELECT goods
FROM exp_goods_asia
WHERE country = '일본';



SELECT *
FROM exp_goods_asia;

SELECT goods
FROM exp_goods_asia
WHERE country = '한국'

UNION ALL  --전체출력결합

SELECT goods
FROM exp_goods_asia
WHERE country = '일본';



SELECT *
FROM exp_goods_asia;

SELECT goods
FROM exp_goods_asia
WHERE country = '한국'

INTERSECT  --교집합

SELECT goods
FROM exp_goods_asia
WHERE country = '일본';



SELECT *
FROM exp_goods_asia;

SELECT goods
FROM exp_goods_asia
WHERE country = '한국'

MINUS  --차집합

SELECT goods
FROM exp_goods_asia
WHERE country = '일본';



SELECT TO_CHAR(department_id)
            ,COUNT(*) 부서별직원수
FROM employees
GROUP BY department_id

UNION

SELECT   ( '전체')
                ,COUNT (*) AS 전체직원수
FROM employees;




SELECT *
FROM exp_goods_asia;

SELECT seq, goods
FROM exp_goods_asia
WHERE country = '한국'

UNION  --중복제거

SELECT seq, goods
FROM exp_goods_asia
WHERE country = '일본'

UNION

SELECT 10, '컴퓨터'
FROM dual;

--exists 존재하는지 않하는지
--세미 조인이라고도 함.


--job-history 테이블에 존재하는 부서 출력
SELECT department_id
            ,department_name
FROM departments  a
WHERE exists(SELECT *  --select 의미없음 where 의 내용에 해당되는
                                       --데이터가 존재하는지만 체크
                    FROM job_history b
                    WHERE a.department_id = b.department_id);


SELECT department_id
            ,department_name
FROM departments  a
WHERE NOT EXISTS (SELECT *  --select 의미없음 where 의 내용에 해당되는
                                       --데이터가 존재하는지만 체크
                    FROM job_history b
                    WHERE a.department_id = b.department_id);               
                    
SELECT *
FROM 학생 a
WHERE NOT EXISTS (SELECT *
                                FROM 수강내역 b
                                WHERE b.학번 = a.학번);
                                
                                
/* 정규 표현식  '검색', '치환'하는 과정을 간편하게 처리할 수 있도록 하는 수단.   
    oracle은 10g부터 사용(JAVA,PYTHIN,JS 다 정규표현식 사용가능) 조금씩 다름
    .(dot) or []은 모든 문자 1글자를 의미함
   ^  <-- 시작을 의미함 ^[0 ~ 9] <--숫자로 시작하는
   [^0~9]<-- 대활고 안의 ^ <-- not을 의미함
*/


--REGEXP_LIKE : 정규식 패턴을 검색
SELECT *
FROM member
WHERE REGEXP_LIKE(mem_comtel, '^....-');
--영문자 3번 출현 후 @패턴 조회(abc@mail.con)
/*
* : 0개이상
+ : 1개이상
? : 0,1개
{n}: n번
{n, }: 번 이상
{n,m}:n번 이상 m번 이하
*/
SELECT *
FROM member
WHERE REGEXP_LIKE(mem_mail,'^[a-zA-Z]{3,5}@'); 

--mem_add2 문자띄어쓰기문자 패턴의 데이터를 출력하시오
SELECT mem_name
            ,mem_add2
FROM member
--WHERE REGEXP_LIKE(mem_add2,'.');--어느 문자든
--WHERE REGEXP_LIKE(mem_add2,'^[가-힣]');--한글
--WHERE REGEXP_LIKE(mem_add2,'[가-힝]$');--한글로 끝나는 $ -> 끝나는패턴
--WHERE REGEXP_LIKE(mem_add2,'^[가-힣]+[가-힣]$');
--WHERE REGEXP_LIKE(mem_add2,'^[가-힣]+$');
--WHERE  REGEXP_LIKE(mem_add2,'^[^가-힣]*$');
WHERE  REGEXP_LIKE(mem_add2,'^[^가-힣]');

--! <--또는
-- ()<--패턴그룹
--J로 시작하며, 세번쨰 문자가 M또는 N인 직원이름 조회
SELECT emp_name
FROM employees
WHERE REGEXP_LIKE(emp_name,'^J.[a|b]');

--REGEXP SUBSTR 정규표현식 패턴을 일치하는 문자열 반환
--이메일 @를 기준으로 앞과 뒤 를 출력하시오
                                                            --패턴, 시작위치, 매칭순번
SELECT REGEXP_SUBSTR(mem_mail, '[^@]+',1,1) as mem_id
            ,REGEXP_SUBSTR(mem_mail, '[^@]+',1,2) as mem_domain
FROM member;

SELECT REGEXP_SUBSTR('A-B-C','[^-]+',1, 1) as a
            ,REGEXP_SUBSTR('A-B-C','[^-]+',1, 2) as b
            ,REGEXP_SUBSTR('A-B-C','[^-]+',1, 3) as c
FROM dual;

SELECT REGEXP_SUBSTR('pang su hi 1234','[0-9]+$') --default 1,1
            ,REGEXP_SUBSTR('pang su hi 1234','[0-9]{1}{4}$')
            ,REGEXP_SUBSTR('pang su hi 1234','[^0-9]+')
FROM dual;
SELECT * FROM member;
SELECT REGEXP_SUBSTR(mem_add1,'[^ ]+',1,2) as b--띄어쓰기를 기준으로 2번쨰 출현하는 주소를 출력하시오
            , REGEXP_SUBSTR(mem_add1,'[가-힣]+',1,2) as b
FROM member;


SELECT *
FROM   ( 
                SELECT 'abcd1234' as id FROM dual

                UNION

                SELECT 'Abcd123456' as id FROM dual

                UNION

                SELECT 'A1234' as id FROM dual
                
                UNION
                
                SELECT 'A12345678cdefg' as id FROM dual
) 
WHERE REGEXP_LIKE(id,'^.{12,14}$');     -- 8~14 사이 텍스트 만족하는 데이터출력





