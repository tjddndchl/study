select * from customer;
select * from address;
select * from item;
select * from order_info;
select * from reservation;







--6번문제 전체 상품별,상품이름,상품매출 을 내림차순으로 구하시오
select i.product_name
        ,SUM(o.sales)
from  item i, order_info o
where i.item_id = o.item_id
group by i.product_name
ORDER BY 2 DESC;

---------- 7번 문제 ---------------------------------------------------
-- 모든상품의 월별 매출액을 구하시오 
-- 매출월, SPECIAL_SET, PASTA, PIZZA, SEA_FOOD, STEAK, SALAD_BAR, SALAD, SANDWICH, WINE, JUICE
----------------------------------------------------------------------------

select SUBSTR(RESERV_NO,1,6) as 매출월
           
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
FROM item i, order_info o
where i.item_id = o.item_id
group by SUBSTR(RESERV_NO,1,6)
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

SELECT distinct a.address_detail
            ,count(distinct r.customer_id)
        
FROM customer c,reservation r,address a
where c.customer_id = r.customer_id
 AND a.zip_code = c.zip_code
 AND r.cancel not in 'Y'
 group by a.address_detail
 ORDER BY 2 DESC;




SELECT c.customer_id
            ,count(a.zip_code)
         
          
             
            
FROM customer c,address a

WHERE     c.zip_code = a.zip_code
AND SUBSTR(r.branch,1,2) =SUBSTR(a.address_detail,1,2);

