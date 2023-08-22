select *
from reservation;
select * from customer;
select * from order_info;
select * from item;
/*
 STUDY 계정에 create_table 스크립트를 실해하여 
 테이블 생성후 1~ 5 데이터를 임포트한 뒤 
 아래 문제를 출력하시오 
 (문제에 대한 출력물은 이미지 참고)
*/
-----------1번 문제 ---------------------------------------------------
--1988년 이후 출생자의 직업이 의사,자영업 고객을 출력하시오 (어린 고객부터 출력)
---------------------------------------------------------------------
-----------2번 문제 ---------------------------------------------------
--강남구에 사는 고객의 이름, 전화번호를 출력하시오 
---------------------------------------------------------------------
----------3번 문제 ---------------------------------------------------
--CUSTOMER에 있는 회원의 직업별 회원의 수를 출력하시오 (직업 NULL은 제외)
---------------------------------------------------------------------
----------4-1번 문제 ---------------------------------------------------
-- 가장 많이 가입(처음등록)한 요일과 건수를 출력하시오 
---------------------------------------------------------------------
----------4-2번 문제 ---------------------------------------------------
-- 남녀 인원수를 출력하시오 
---------------------------------------------------------------------
----------5번 문제 ---------------------------------------------------
--월별 예약 취소 건수를 출력하시오 (많은 달 부터 출력)
---------------------------------------------------------------------


/*
1번 문제
-1988년 이후 출생자의 직업이 의사,자영업 고객을 출력하시오(어린 고객부터 출력)
*/
SELECT *
    from customer 
WHERE SUBSTR(birth,1,4) >= 1988
AND job in ('의사','자영업');


UNION

SELECT *
    from customer 
WHERE SUBSTR(birth,1,4) >= 1988
AND job in '자영업';

order by 7 DESC;


/*
2번 문제 
강남구에 사는 고객의 이름, 전화번호를 출력하시오
*/
select * FROM address;
select customer_name
        ,phone_number
from customer,address
where customer.zip_code = address.zip_code
AND address.address_detail = '강남구';
/*3번문제 직업별 고객 수*/
 select  customer.job
        ,count( customer.job)
FROM customer
WHERE job is not null --null값 없애기
group by  customer.job
ORDER by 2 DESC;

/*4번문제*/

select *
from(

        select TO_CHAR(TO_DATE(first_reg_date),'DAY') as 요일 
                , COUNT(first_reg_date) as 건수
        from CUSTOMER
        group by  TO_CHAR(TO_DATE(first_reg_date),'DAY')
        order by 2 desc
       )
       WHERE rownum =1;







/*4-2번문제*/

SELECT NVL(a.성별,'합계')
            ,count(a.성별)
FROM(

  SELECT decode(sex_code,'M','남자','F','여자','미등록')  as 성별
  FROM customer)  a
group by ROLLUP (a.성별);







/*월별예약 취소건수*/
 SELECT TO_CHAR(To_DATE(reserv_date),'MM') 
            , COUNT(*)
 FROM reservation
 WHERE cancel = 'Y'
 group by TO_CHAR(To_DATE(reserv_date),'MM') 
 ORDER BY 1;
 






