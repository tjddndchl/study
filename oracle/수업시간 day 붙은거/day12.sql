/*
    1~6장 기본 DNML(SELECT, INSERT,UPDATE,DELETE)
    내장함수
    집계 함수
    조인/서브쿼리
    
    이전 시간:계층형 쿼리,CONNECT BY절 사용
*/

/* 회원중 카트 사용횟수가 가장 많은
    고객과 가장적은 고객의 정보를 출력하시오
*/

 
SELECT MAX(cnt) cnt_max
            ,MIN(cnt)  cnt_min

FROM(
SELECT a.mem_id
            ,a.mem_name
            ,COUNT(distinct b.cart_no) cnt
FROM member a
        , cart b
WHERE a.mem_id =b.cart_member(+)
GROUP BY a.mem_id
                ,a.mem_name
);

SELECT *
FROM(
SELECT a.mem_id
            ,a.mem_name
            ,COUNT(distinct b.cart_no) cnt
FROM member a
        , cart b
WHERE a.mem_id =b.cart_member(+)
GROUP BY a.mem_id
                ,a.mem_name)
WHERE cnt = 1
or cnt = 0;


--WITH 
WITH T1 AS (
    SELECT
        a.mem_id,
        a.mem_name,
        COUNT(DISTINCT b.cart_no) cnt
    FROM
        member a,
        cart   b
    WHERE
        a.mem_id = b.cart_member (+)
    GROUP BY
        a.mem_id,
        a.mem_name
), T2 AS (
    SELECT
        MAX(T1.cnt) AS max_cnt,
        MIN(T1.cnt) AS min_cnt
    FROM
        t1
)
SELECT
    T1.mem_id,T1.mem_name,T1.cnt
FROM
    T1,T2
WHERE
    T1.cnt = T2.max_cnt
    OR T1.cnt = T2.min_cnt;
    
    
    
-----------
WITH T1 as (SELECT a.이름
                            ,   a.학번
                            ,   a.학기
                            ,   b.수강내역번호
                            ,   b.과목번호
                        FROM 학생 a, 수강내역 b
                        WHERE a.학번 = b.학번(+)
), T2 as(SELECT T1.이름, T1.학번, COUNT(T1.수강내역번호) as 수강이력건수
            FROM T1
            GROUP BY T1.이름, T1.학번
), T3 as(
            SELECT T1.이름, T1.학번, SUM(과목.학점) as 전체수강학점
            FROM T1, 과목
            WHERE T1.과목번호 = 과목.과목번호(+)
            GROUP BY T1.이름, T1.학번
)
SELECT  T1.학번,  T1.이름,  MAX(T2.수강이력건수), MAX(T3.전체수강학점)
FROM T1, T2, T3
WHERE T1.학번 = T2.학번
AND T1.학번 = T3.학번
GROUP BY T1.학번, T1.이름;

/* WITH 절
    별칭으로 사용한 select문을 다른 구문에서 참조가 가능
    반복되는 서브쿼리를 1개로 변수처럼 사용가능
    통계쿼리나 튜닝시 많이 사용
    -temp라는 임시 테이블을 사용해서 장시간 걸리는 쿼리 결과를 저장해서
    액세스(접근)때문에 반복되고 건수가 많은 테이블을 조회할때 성능이 좋다
    ORACLE 9버전 이상에서 지원함
    -가독성이 좋은 장점이 있음.
    **단점
    -메모리에 조회결과를 올려놓고 사용하기 때문에 오히려 성능에 문제를 줄수있음.
    -WITH를 제한하는 프로젝트도 있기 때문에(확인 후 사용)
*/

-------------------------------
--2000년도 이탈리아의  연평균 매출액 보다 큰 월의 평균 매출액의 '년월', '매출액'을 출력하시오
SELECT cust_id, sales_month, amount_sold
FROM sales;
SELECT cust_id, country_id
FROM customers;
SELECT country_id,country_name
FROM countries;

WITH T1 AS(
                    SELECT 
                                s.sales_month 
                                , s.amount_sold
                    FROM sales s,  customers c, countries co
                    WHERE s.cust_id =c.cust_id
                    AND c.country_id = co.country_id
                    AND c.country_id = 52770
                    AND  SUBSTR(s.sales_month,1,4) = 2000
)
,T2 AS( 
           SELECT  T1.sales_month
                        ,AVG(T1.amount_sold) as 평균액
            FROM T1
            GROUP BY T1.sales_month
)
,T3 AS(
SELECT AVG(T1.amount_sold) as 연평균액
            FROM T1
            
)

SELECT T2.sales_month
             ,TRUNC(T2.평균액,0)
FROM T2,T3
WHERE T2.평균액 > T3.연평균액;

