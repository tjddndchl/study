select mbti
    , count(*) as cnt
from tb_info
group by mbti
order by 2 desc;

SELECT hobby
    , COUNT(*) as cnt
FROM tb_info
GROUP BY hobby
ORDER BY 2 DESC;

/*
    집계함수 대상 데이터를 특정 그룹으로 묶은 다음 그룹에 대한 
    총합, 평균, 최댓값, 최솟값 등을 구하는 함수
    count(expr) 로우 수를 반환하는 집계함수
*/

SELECT COUNT(*)  --null포함
    ,  COUNT(department_id)--default ALL null값 안들어감
    ,  COUNT(ALL department_id)-- 중복 포함 null x
    ,  COUNT(DISTINCT department_id)-- 중복제거
    ,  COUNT(employee_id)
FROM employees;


SELECT department_id
    ,  SUM(salary)--합계
    ,  ROUND (AVG(salary),3)--평균
    ,  MAX(salary)--최댓값
    ,  MIN(salary)--최솟값
    
FROM employees
GROUP BY department_id
ORDER BY 1;


SELECT department_id 
    , MAX(salary)--최댓값
    , MIN(salary)--최솟값
FROM employees
WHERE  department_id = 50--조건은 그룹핑전
group by department_id
order by 1;


/*
    member 테이블을 활용하여
    회운의 직업별 회원수를 출력하시오
    정렬 (회원수 내림차수)
*/


SELECT  mem_job
    , count(mem_id) as cnt
    , COUNT(*) as cnt2
FROM member
GROUP BY mem_job
ORDER BY 1 DESC;
--2013년도 기간별 총 대출잔액
SELECT *
FROM kor_loan_status;


SELECT period
    , sum(loan_jan_amt) as 총잔액
FROM kor_loan_status
where period like '2013%'
GROUP BY period
ORDER BY 1;
--2013년도 지역별 대출종류별 총대출잔액
--select 절에 오는 컬럼은 집계함수를 제외하고
--group by 절에 포함되어야함
SELECT region
    ,gubun
    ,sum(loan_jan_amt) as 총잔액
FROM kor_loan_status
where period like '2013%'
group by region, gubun
ORDER BY 1;
--년도별 대출의 총합계
SELECT substr (period,1,4)
    ,region
    , sum(loan_jan_amt) as 총잔액

FROM kor_loan_status
GROUP by substr(period,1,4),region
ORDER by 1;

--employees 직원들의 고용 년도별 직원수를 출력하시오
select TO_CHAR(hire_date,'YYYYMMDD')
from employees;

--그룹핑 대상의 데이터에 대해 김색조건을 쓰려면
--HAVING 사용
--입사직원이 10명 이상인 년도와 직원수
--**** select 문 실행순서
--from -> where -> group by -> having -> select -> order by
SELECT TO_CHAR(hire_date,'YYYY') as 입사년도
    , count(employee_id)
FROM employees

group by TO_CHAR(hire_date,'YYYY')
HAVING COUNT(employee_id) >= 10
order by 1;

--member 테이블을 활용하여
--직업별 마일리지 평균금액을 구하시오(소수점 2째 자리까지 반올림하여 출력);
--평균마일리지가 3000이상인
select  mem_job
    , round(AVG(mem_mileage),2) as avg_mileage
FROM member
group by mem_job
HAVING round(AVG(mem_mileage),2) >= 3000
order by 2 ;



--직업별 마일리지의 합계 마일리지 전체합계를 출력하시오
SELECT (mem_job) as 직업
    ,  COUNT(mem_id) as 회원수
    ,  sum(mem_mileage) as 합계
FROM member
group by ROLLUP(mem_job); --롤업 밀어올린다라는 뜻으로
                          --집계결과의 합을 출력함
                          
--products 상품테이블의 카테
--고리별 상품수와 전체 상품 수를 출력하시오
--subcategory 카테고리의 각각의 카테고리
select *
from products;
SELECT NVL(prod_category,'카테고리 물품 총합계') as 카테고리
    ,  prod_subcategory as 서브카테고리
    , count(prod_id) as 합계
from products
group by rollup(prod_category, prod_subcategory);

SELECT substr (period,1,4)
    ,region
    , sum(loan_jan_amt) as 총잔액

FROM kor_loan_status
GROUP by rollup (substr(period,1,4),region)--연도별합계-전체합계
ORDER by 1;


--연도별 회원수를 출력하시오 단 남, 녀 구분하여서

select cust_year_of_birth
    , sum (decode(cust_gender,'M',1,0)) as 남자
    , sum( decode(cust_gender,'F',1,0)) as 여자
    
from customers
GROUP BY rollup(cust_year_of_birth)
ORDER BY 1;

select cust_year_of_birth
--      ,cust_gender
    , SUM(case when cust_gender = 'F' then '1'
    else '0'
    end) as 여자
    ,SUM(case when cust_gender = 'M' then '1'
    else '0'
    end) as 남자

FROM customers
GROUP BY cust_year_of_birth;

--지역별 각 년도별 대출총잔액을 구하는 쿼리를 작성해 보자
SELECT region
   ,sum(decode(substr(period,1,4),'2011',loan_jan_amt)) as AVM_2011
   ,sum(decode(substr(period,1,4),'2012',loan_jan_amt)) as AVM_2012
   ,sum(decode(substr(period,1,4),'2013',loan_jan_amt)) as AVM_2013

from kor_loan_status
group by region
order by 1;


 
