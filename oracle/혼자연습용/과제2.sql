select * from customer;
select * from address;
select * from item;
select * from order_info;
select * from reservation;







--6번문제 전체 상품별,상품이름,상품매출 을 내림차순으로 구하시오
select i.item_id 
        ,i.product_name
        ,SUM(o.sales)
from  item i, order_info o
where i.item_id = o.item_id
group by i.item_id,i.product_name
ORDER BY 2 DESC;

---------- 7번 문제 ---------------------------------------------------
-- 모든상품의 월별 매출액을 구하시오 
-- 매출월, SPECIAL_SET, PASTA, PIZZA, SEA_FOOD, STEAK, SALAD_BAR, SALAD, SANDWICH, WINE, JUICE
----------------------------------------------------------------------------

select SUBSTR(r.RESERV_date,1,6) as 매출월
           
        ,sum(DECODE(i.item_id,'M0001',o.sales,0)) as 스페셜셋
        ,sum(DECODE(i.item_id,'M0002',o.sales,0)) as 파스타
        ,sum(DECODE(i.item_id,'M0003',o.sales,0)) as 피자
        ,sum(DECODE(i.item_id,'M0004',o.sales,0)) as 씨푸드               
         ,sum(DECODE(i.item_id,'M0005',o.sales,0)) as 스테이크
         ,sum(DECODE(i.item_id,'M0006',o.sales,0)) as 샐러드바
         ,sum(DECODE(i.item_id,'M0007',o.sales,0)) as 샐러드
         ,sum(DECODE(i.item_id,'M0008',o.sales,0)) as 샌드위치
         ,sum(DECODE(i.item_id,'M0009',o.sales,0)) as 와인
         ,sum(DECODE(i.item_id,'M0010',o.sales,0)) as 주스
FROM item i, order_info o,reservation r
where i.item_id = o.item_id
AND o.reserv_no = r.reserv_no
group by SUBSTR(r.reserv_date,1,6)
ORDER BY 1;


---------- 8번 문제 ---------------------------------------------------
-- 월별 온라인_전용 상품 매출액을 일요일부터 월요일까지 구분해 출력하시오 
-- 날짜, 상품명, 일요일, 월요일, 화요일, 수요일, 목요일, 금요일, 토요일의 매출을 구하시오 
----------------------------------------------------------------------------

select SUBSTR(RESERV_NO,1,6) as 매출월
        ,product_name
        
        ,sum(DECODE(TO_CHAR(TO_DATE(SUBSTR(reserv_no,1,8),'YYYYMMDD'),'DAY'),'일요일',o.sales,0)) AS 일요일
         ,sum(DECODE(TO_CHAR(TO_DATE(SUBSTR(reserv_no,1,8),'YYYYMMDD'),'DAY'),'월요일',o.sales,0)) AS 월요일
          ,sum(DECODE(TO_CHAR(TO_DATE(SUBSTR(reserv_no,1,8),'YYYYMMDD'),'DAY'),'화요일',o.sales,0)) AS 화요일
           ,sum(DECODE(TO_CHAR(TO_DATE(SUBSTR(reserv_no,1,8),'YYYYMMDD'),'DAY'),'수요일',o.sales,0)) AS 수요일
            ,sum(DECODE(TO_CHAR(TO_DATE(SUBSTR(reserv_no,1,8),'YYYYMMDD'),'DAY'),'목요일',o.sales,0)) AS 목요일
             ,sum(DECODE(TO_CHAR(TO_DATE(SUBSTR(reserv_no,1,8),'YYYYMMDD'),'DAY'),'금요일',o.sales,0)) AS 금요일
              ,sum(DECODE(TO_CHAR(TO_DATE(SUBSTR(reserv_no,1,8),'YYYYMMDD'),'DAY'),'토요일',o.sales,0)) AS 토요일
        

FROM item i, order_info o
where i.item_id = o.item_id
GROUP BY SUBSTR(RESERV_NO,1,6),product_name
order by 2 DESC;



SELECT 매출월
            ,상품이름
            ,SUM(DECODE(요일,'일요일',sales,0)) as 일요일
            ,SUM(DECODE(요일,'월요일',sales,0)) as 월요일
            ,SUM(DECODE(요일,'화요일',sales,0)) as 화요일
            ,SUM(DECODE(요일,'수요일',sales,0)) as 수요일
            ,SUM(DECODE(요일,'목요일',sales,0)) as 목요일
            ,SUM(DECODE(요일,'금요일',sales,0)) as 금요일
            ,SUM(DECODE(요일,'토요일',sales,0)) as 토요일
FROM(
SELECT SUBSTR(a.reserv_date,1,6) as 매출월 
            ,c.product_desc                 as 상품이름
            ,TO_CHAR(TO_DATE(a.reserv_date),'day') 요일
            ,b.sales
FROM reservation a,order_info b, item c
WHERE a.reserv_no = b.reserv_no
AND b.item_id = c.item_id
AND c.product_desc = '온라인_전용상품'
)
GROUP BY 매출월
            ,상품이름;


--9번문재
--매출이력이 있는 고객의 주소, 우편번호,해당지역의 고객수를 출력하시


SELECT distinct a.address_detail
            ,count(distinct r.customer_id)
        
FROM customer c,reservation r,address a
where c.customer_id = r.customer_id
 AND a.zip_code = c.zip_code
 AND r.cancel not in 'Y'
 group by a.address_detail
 ORDER BY 2 DESC;



SELECT DISTINCT a.customer_id, a.zip_code
        
FROM customer a,reservation b,order_info c
where a.customer_id = b.customer_id
AND b.reserv_no = c.reserv_no;

----------------------------------------------
-----고객별 지점(branch) 방문횟수와 방문객의 합을 출력하시오
-----방문횟수가 4번이상합  출력하시오 (예약취소건 제외)
SELECT * FROM customer;
SELECT * FROM reservation;



SELECT a.customer_id
            ,a.customer_name
            ,b.branch
            ,COUNT (b.visitor_cnt) as 방문횟수
            ,SUM(b.visitor_cnt) as 방문객수
            
FROM customer a,reservation b
WHERE a.customer_id = b.customer_id
AND b.cancel NOT IN 'Y'

GROUP BY  a.customer_id,a.customer_name,b.branch
HAVING(count(b.visitor_cnt) >= 4)
ORDER BY 4 DESC,5 DESC;

--가장 방문을 많이 한 고객의 그동안 구매한 품목별 합산금액을 출력하시오
--W1338910

SELECT reserv_no
FROm reservation
WHERE cancel = 'N'
AND customer_id = 'W1338910';

SELECT (SELECT product_name FROM item WHERE item_id = a.item_id) as category
            ,SUM(sales) as 구매합계
FROM order_info a
WHERE a.reserv_no IN(2017111303)
GROUP BY a.item_id;

SELECT (SELECT product_name FROM item WHERE item_id = a.item_id) as category
            ,SUM(sales) as 구매합계
FROM order_info a
WHERE a.reserv_no IN(2017111303)
GROUP BY a.item_id;


SELECT customer_id
FROM(
    SELECT a.customer_id
                ,a.customer_name
                ,b.branch
                ,COUNT (b.visitor_cnt) as 방문횟수
                ,SUM(b.visitor_cnt) as 방문객수
                
    FROM customer a,reservation b
    WHERE a.customer_id = b.customer_id
    AND b.cancel NOT IN 'Y'
    
    GROUP BY  a.customer_id,a.customer_name,b.branch
    ORDER BY 4 DESC,5 DESC
)
WHERE ROWNUM <= 1;
