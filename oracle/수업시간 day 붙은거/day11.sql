select * from departments;
SELECT department_id
            --level 가상열로서 트리 내에서 어떤 단계인지 나타내는 정수값
            ,LPAD(' ',3*(level-1)) || department_name as 부서명
            ,parent_id
            , level
FROM departments
START WITH parent_id is NULL                            --시작
CONNECT BY PRIOR department_id = parent_id;      --계층을 어떻게 연결할지(조건)

--  departments 테이블에 230 it헬프데스크 하위 부서로
--                                       it원격팀

INSERT into departments(department_id,department_name,parent_id) values(280,'IT원격팀',230);

select MAX(department_id)+10
FROM departments;



SELECT department_id
            --level 가상열로서 트리 내에서 어떤 단계인지 나타내는 정수값
            ,LPAD(' ',3*(level-1)) || department_name as 부서명
            ,parent_id
            , level
            , CONNECT_BY_ISLEAF --마지막노드면1 자식이 있으면0
            , SYS_CONNECT_BY_PATH(department_name, '|')--루트 노드에서 자신행까지 연결정보
            , CONNECT_BY_ISCYCLE --무한루프의 원인을 찾을떄
        --(자식이 있는데 그자식 로우가 부모이면 1, 아니면 0)
FROM departments
START WITH parent_id is NULL                            --시작
CONNECT BY  NOCYCLE PRIOR department_id = parent_id      --계층을 어떻게 연결할지(조건)
ORDER SIBLINGS BY   department_name DESC;      --SIBLINGS 사용시에는  실제 컴럼으로만 정렬가능


--무한루프걸리도록 수정
UPDATE departments
SET parent_id = 170
WHERE department_id = 20;


SELECT * FROM employees;
SELECT employee_id
            ,emp_name
            ,LPAD(' ',3*(level-1)) || emp_name as 직원명
            ,manager_id
            , SYS_CONNECT_BY_PATH(emp_name, ' >')
FROM   employees
START WITH manager_id IS NULL
CONNECT BY PRIOR employee_id=manager_id 
ORDER SIBLINGS BY emp_name;
--직원간의 계층관계를 출력하시오.
drop table ex2_6;
CREATE TABLE ex2_6(
    아이디 NUMBER
    ,부모아이디 NUMBER
    ,이름   VARCHAR2(100)
    ,직책   VARCHAR2(100)
    
);

INSERT INTO ex2_6(아이디,부모아이디,이름,직책) VALUES( 10 ,NULL,'이사장','사장');
INSERT INTO ex2_6(아이디,부모아이디,이름,직책) VALUES( 20 ,10,'김부장','부장');
INSERT INTO ex2_6(아이디,부모아이디,이름,직책) VALUES( 30 ,20,'서차장','차장');
INSERT INTO ex2_6(아이디,부모아이디,이름,직책) VALUES( 40 ,30,'장과장','과장');
INSERT INTO ex2_6(아이디,부모아이디,이름,직책) VALUES( 50 ,40,'이대리','대리');
INSERT INTO ex2_6(아이디,부모아이디,이름,직책) VALUES( 60 ,50,'최사원','사원');
INSERT INTO ex2_6(아이디,부모아이디,이름,직책) VALUES(  70,50,'강사원','사원');
INSERT INTO ex2_6(아이디,부모아이디,이름,직책) VALUES( 100 ,30,'박과장','과장');
INSERT INTO ex2_6(아이디,부모아이디,이름,직책) VALUES( 150 ,100,'김대리','대리');
INSERT INTO ex2_6(아이디,부모아이디,이름,직책) VALUES( 160 ,150,'주사원','사원');


select * from ex2_6;
select 이름
        ,LPAD(' ',2*(level-1)) || 직책 as 직책
        ,LEVEL
        ,SYS_CONNECT_BY_PATH(직책, ' |')
        ,CONNECT_BY_ISLEAF 
        ,부모아이디
        ,아이디
from ex2_6
START WITH 부모아이디 IS NULL
CONNECT BY PRIOR 아이디 = 부모아이디 ;


SELECT period
            ,SUM(loan_jan_amt) as 대출합계
FROM kor_loan_status
WHERE substr(period,1,4) = 2013
GROUP BY period;

/*
level1은 가상-열로서  (connect by 절과 함께 사용)
임의의 데이터가 필요할때 많이사용.


*/
--2013년 1~12월 데이터
SELECT '2013'||LPAD (level,2,'0') as 년월
FROM dual
CONNECT BY LEVEL <= 12 ;

SELECT a.년월
            , NVL(b.대출합계,0) as 대출합계
            
FROM (SELECT '2013'||LPAD (level,2,'0') as 년월
FROM dual
CONNECT BY LEVEL <= 12) a
        ,(SELECT period       as   년월
            ,SUM(loan_jan_amt) as 대출합계
FROM kor_loan_status
WHERE substr(period,1,4) = 2013
GROUP BY period)  b
WHERE a.년월 = b.년월(+)
ORDER BY 1;
--202301~202312

SELECT TO_CHAR(SYSDATE,'YYYY') || LPAD(LEVEL, 2, '0')as 년월
FROM dual
CONNECT BY LEVEL <= 12;

--이번달 1월부터 마지막날까지 출력 
--(단 해당 select문을 다음달에 실행시 해당월의 마지막날까지 출력되도록)

SELECT TO_CHAR(SYSDATE,'YYYYMM') || LPAD(LEVEL,'2') as year
FROM dual
CONNECT BY LEVEL <=(SELECT TO_CHAR(LAST_DAY(SYSDATE),'DD')
                                    FROM dual);

SELECT * FROM member;

select mem_name
        ,mem_bir
FROM member;

select 
        substr(mem_bir,4,2)|| '월'
        ,COUNT(substr(mem_bir,4,2)|| '월') as 횟수
        FROM member
group by   substr(mem_bir,4,2)|| '월' 
ORDER BY 1;


SELECT LPAD(LEVEL,2,'0') || '월'          
FROM dual
CONNECT BY LEVEL <= 12;

SELECT NVL(a.월,'합계')
            ,COUNT(b.횟수)
           
from (SELECT LPAD(LEVEL,2,'0') || '월'   as 월       
FROM dual
CONNECT BY LEVEL <= 12) a, 
(select 
         substr(mem_bir,4,2)|| '월' as 월
        ,COUNT(substr(mem_bir,4,2)|| '월') as 횟수
FROM member
group by  mem_name  , substr(mem_bir,4,2)|| '월' 
ORDER BY 1) b
where a.월 = b.월(+)
GROUP BY ROLLUP (a.월)
ORDER BY 1; 

SELECT LPAD(LEVEL,2,'0')    as 월       
         
FROM dual
CONNECT BY LEVEL <= 12;

select to_char(mem_bir, 'MM') 
        , count(*)  as 회원수
from member
group by to_char(mem_bir, 'MM') ;


SELECT a.월 || '월'
            ,NVL(b.회원수,0)

FROM (SELECT LPAD(LEVEL,2,'0')    as 월       
         
FROM dual
CONNECT BY LEVEL <= 12) a,
(select to_char(mem_bir, 'MM') 월
            , count(*)  as 회원수
from member
group by to_char(mem_bir, 'MM'))  b
WHERE a.월 = b.월(+);





