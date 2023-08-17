/*INNER JOIN 대수조건(동등조건)*/
select * from 학생; 
SELECT * FROM 수강내역;

SELECT 학생.학번
        ,    이름--한쪽에만 있는거는 이름 안붙여도됨
        ,    학생.전공
        ,    수강내역.과목번호
        ,    수강내역.수강내역번호
FROM 학생 ,수강내역 
WHERE 학생.학번  = 수강내역.학번 ;


SELECT 학생.학번
            ,학생.이름
            ,학생.전공
            ,수강내역.과목번호
            ,수강내역.수강내역번호
            ,과목.과목이름          
            
            
FROM 학생,수강내역,과목
WHERE 학생.학번 = 수강내역.학번
AND 수강내역.과목번호= 과목.과목번호
AND 학생.이름 = '최숙경';

--최숙경의 수강 총학점을 출력하시오
SELECT * FROM 과목;

 
SELECT  학생.학번
             ,학생.이름
            ,학생.전공
            ,SUM(과목.학점) as 수강학점
FROM 학생,과목,수강내역
where 학생.학번 =수강내역.학번
AND 과목.과목번호 = 수강내역.과목번호
--AND 학생.이름 = '최숙경'
GROUP BY 학생.이름
            ,학생.학번
            ,학생.전공;
            
/*아우터 조인
    어느 한쪽에 null값을 포함시켜야 할때
    (보통은 마스터테이블은 무조건 포함시켜야하면 아웃터조인을함)
*/

SELECT  학생.학번
             ,학생.이름
            ,학생.전공
            ,수강내역.학번  AS 수강내역학번
            ,과목.과목이름
FROM 학생,과목,수강내역
where 학생.학번 =수강내역.학번(+)  --null을 포함시킬 테이블
AND 과목.과목번호(+) = 수강내역.과목번호--null을 포함시킬 테이블, 한쪽에만 쓸수있음
AND 학생.이름 = '양지운';


--학생의 수강이력건수를 출력하시오
--모든학생 출력 null이면 영으로

SELECT 학생.이름
            ,학생.학번
            ,COUNT(과목.과목번호) AS 수강이력_건수
            ,NVL(SUM(과목.학점),'0') AS 총학점
FROM 학생,수강내역,과목
where 학생.학번 = 수강내역.학번(+)
AND  수강내역.과목번호 = 과목.과목번호(+)
group BY 학생.이름,학생.학번
order by 2;
 
 
 
 SELECT  학생.학번
             ,학생.이름
            ,학생.전공
            ,수강내역.수강내역번호
            ,(select 과목이름 -- 스칼라 서브쿼리 (단일행 사용가능)    
            FROM 과목
            WHERE 과목번호 = 수강내역.과목번호) AS 과목이름
            
FROM 학생,수강내역
where 학생.학번 =수강내역.학번(+) 
AND 학생.이름 = '최숙경';
            
/*학생의 전공별 인원수를 구하시오*/

select 전공
        ,  COUNT(전공) as 학생수
FROM 학생
GROUP BY 전공;

SELECT * FROM 학생;

 

select AVG(학생.평점)
FROM 학생;

select * 
from 학생
where 학생.평점 >= (select AVG(학생.평점)
                            FROM 학생);


select * 
from 학생
where 학생.평점 LIKE (select MAX(학생.평점)
                            FROM 학생); --중첩 서브 쿼리
                            
SELECT * from 학생;
select * from 수강내역;

select*
from 학생
where 학생.학번 NOT IN(select 수강내역.학번 
                                    from 수강내역);
                                    
/*인라인뷰(FROM절)
    SELECT문의 질의 결과를 마치 테이블처럼 사용
    */
    
SELECT * 
FROM  (SELECT ROWNUM as rnum
    , 학번, 이름, 전공
FROM 학생) a --SELECT문을 테이블처럼 사용
WHERE a.rnum BETWEEN 2 AND 5;
 
 SELECT *
 
 FROM (SELECT ROWNUM as rnum
            , a.*
from (SELECT employee_id
            ,emp_name
            ,salary
            FROM employees
            
            order by emp_name) a
)
WHERE emp_name LIKE '%e%'
AND rnum BETWEEN 1 AND 107;

SELECT rownum as rnum
            , a.*
FROM employees a
ORDER BY emp_name; --오더절 뒤에나오면 정렬깨짐


/*학생중에 평점 높은 5명만 출력하시오*/
select *

FROM(select ROWNUM as 순위
             ,a.*
       
         FROM (select 이름
                              ,평점
                    from 학생
                    order by 2 DESC)a
            )
where 순위 BETWEEN 3 AND 3;


-- meber, cart , prod 를 사용하여
-- 고객별 카트사용횟수, 상품품목건수, 상품구매수량, 총구매금액을 출력하시오
-- 구매이력이 없다면 0 <-- 으로 출력되도록

SELECT *FROM member;
SELECT *FROM cart;
SELECT *FROM prod;

select m.mem_name as 이름
        , count(distinct c.cart_no) as 카트사용횟수
        , count(p.prod_name) as 상품품목건수
        ,NVL(SUM(c.cart_qty),0) as 삼품구매수량
        , NVL(SUM( p.prod_sale * c.cart_qty),0) as 총구매금액 
        
FROM member m,cart c,prod p
where m.mem_id = c.cart_member(+)
and    c.cart_prod = p.prod_id(+)
group by m.mem_name
order by 5 DESC;