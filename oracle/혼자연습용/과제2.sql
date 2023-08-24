select * from customer;
select * from address;
select * from item;
select * from order_info;
select * from reservation;







--6������ ��ü ��ǰ��,��ǰ�̸�,��ǰ���� �� ������������ ���Ͻÿ�
select i.item_id 
        ,i.product_name
        ,SUM(o.sales)
from  item i, order_info o
where i.item_id = o.item_id
group by i.item_id,i.product_name
ORDER BY 2 DESC;

---------- 7�� ���� ---------------------------------------------------
-- ����ǰ�� ���� ������� ���Ͻÿ� 
-- �����, SPECIAL_SET, PASTA, PIZZA, SEA_FOOD, STEAK, SALAD_BAR, SALAD, SANDWICH, WINE, JUICE
----------------------------------------------------------------------------

select SUBSTR(r.RESERV_date,1,6) as �����
           
        ,sum(DECODE(i.item_id,'M0001',o.sales,0)) as ����ȼ�
        ,sum(DECODE(i.item_id,'M0002',o.sales,0)) as �Ľ�Ÿ
        ,sum(DECODE(i.item_id,'M0003',o.sales,0)) as ����
        ,sum(DECODE(i.item_id,'M0004',o.sales,0)) as ��Ǫ��               
         ,sum(DECODE(i.item_id,'M0005',o.sales,0)) as ������ũ
         ,sum(DECODE(i.item_id,'M0006',o.sales,0)) as �������
         ,sum(DECODE(i.item_id,'M0007',o.sales,0)) as ������
         ,sum(DECODE(i.item_id,'M0008',o.sales,0)) as ������ġ
         ,sum(DECODE(i.item_id,'M0009',o.sales,0)) as ����
         ,sum(DECODE(i.item_id,'M0010',o.sales,0)) as �ֽ�
FROM item i, order_info o,reservation r
where i.item_id = o.item_id
AND o.reserv_no = r.reserv_no
group by SUBSTR(r.reserv_date,1,6)
ORDER BY 1;


---------- 8�� ���� ---------------------------------------------------
-- ���� �¶���_���� ��ǰ ������� �Ͽ��Ϻ��� �����ϱ��� ������ ����Ͻÿ� 
-- ��¥, ��ǰ��, �Ͽ���, ������, ȭ����, ������, �����, �ݿ���, ������� ������ ���Ͻÿ� 
----------------------------------------------------------------------------

select SUBSTR(RESERV_NO,1,6) as �����
        ,product_name
        
        ,sum(DECODE(TO_CHAR(TO_DATE(SUBSTR(reserv_no,1,8),'YYYYMMDD'),'DAY'),'�Ͽ���',o.sales,0)) AS �Ͽ���
         ,sum(DECODE(TO_CHAR(TO_DATE(SUBSTR(reserv_no,1,8),'YYYYMMDD'),'DAY'),'������',o.sales,0)) AS ������
          ,sum(DECODE(TO_CHAR(TO_DATE(SUBSTR(reserv_no,1,8),'YYYYMMDD'),'DAY'),'ȭ����',o.sales,0)) AS ȭ����
           ,sum(DECODE(TO_CHAR(TO_DATE(SUBSTR(reserv_no,1,8),'YYYYMMDD'),'DAY'),'������',o.sales,0)) AS ������
            ,sum(DECODE(TO_CHAR(TO_DATE(SUBSTR(reserv_no,1,8),'YYYYMMDD'),'DAY'),'�����',o.sales,0)) AS �����
             ,sum(DECODE(TO_CHAR(TO_DATE(SUBSTR(reserv_no,1,8),'YYYYMMDD'),'DAY'),'�ݿ���',o.sales,0)) AS �ݿ���
              ,sum(DECODE(TO_CHAR(TO_DATE(SUBSTR(reserv_no,1,8),'YYYYMMDD'),'DAY'),'�����',o.sales,0)) AS �����
        

FROM item i, order_info o
where i.item_id = o.item_id
GROUP BY SUBSTR(RESERV_NO,1,6),product_name
order by 2 DESC;



SELECT �����
            ,��ǰ�̸�
            ,SUM(DECODE(����,'�Ͽ���',sales,0)) as �Ͽ���
            ,SUM(DECODE(����,'������',sales,0)) as ������
            ,SUM(DECODE(����,'ȭ����',sales,0)) as ȭ����
            ,SUM(DECODE(����,'������',sales,0)) as ������
            ,SUM(DECODE(����,'�����',sales,0)) as �����
            ,SUM(DECODE(����,'�ݿ���',sales,0)) as �ݿ���
            ,SUM(DECODE(����,'�����',sales,0)) as �����
FROM(
SELECT SUBSTR(a.reserv_date,1,6) as ����� 
            ,c.product_desc                 as ��ǰ�̸�
            ,TO_CHAR(TO_DATE(a.reserv_date),'day') ����
            ,b.sales
FROM reservation a,order_info b, item c
WHERE a.reserv_no = b.reserv_no
AND b.item_id = c.item_id
AND c.product_desc = '�¶���_�����ǰ'
)
GROUP BY �����
            ,��ǰ�̸�;


--9������
--�����̷��� �ִ� ���� �ּ�, �����ȣ,�ش������� ������ ����Ͻ�


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
-----���� ����(branch) �湮Ƚ���� �湮���� ���� ����Ͻÿ�
-----�湮Ƚ���� 4���̻���  ����Ͻÿ� (������Ұ� ����)
SELECT * FROM customer;
SELECT * FROM reservation;



SELECT a.customer_id
            ,a.customer_name
            ,b.branch
            ,COUNT (b.visitor_cnt) as �湮Ƚ��
            ,SUM(b.visitor_cnt) as �湮����
            
FROM customer a,reservation b
WHERE a.customer_id = b.customer_id
AND b.cancel NOT IN 'Y'

GROUP BY  a.customer_id,a.customer_name,b.branch
HAVING(count(b.visitor_cnt) >= 4)
ORDER BY 4 DESC,5 DESC;

--���� �湮�� ���� �� ���� �׵��� ������ ǰ�� �ջ�ݾ��� ����Ͻÿ�
--W1338910

SELECT reserv_no
FROm reservation
WHERE cancel = 'N'
AND customer_id = 'W1338910';

SELECT (SELECT product_name FROM item WHERE item_id = a.item_id) as category
            ,SUM(sales) as �����հ�
FROM order_info a
WHERE a.reserv_no IN(2017111303)
GROUP BY a.item_id;

SELECT (SELECT product_name FROM item WHERE item_id = a.item_id) as category
            ,SUM(sales) as �����հ�
FROM order_info a
WHERE a.reserv_no IN(2017111303)
GROUP BY a.item_id;


SELECT customer_id
FROM(
    SELECT a.customer_id
                ,a.customer_name
                ,b.branch
                ,COUNT (b.visitor_cnt) as �湮Ƚ��
                ,SUM(b.visitor_cnt) as �湮����
                
    FROM customer a,reservation b
    WHERE a.customer_id = b.customer_id
    AND b.cancel NOT IN 'Y'
    
    GROUP BY  a.customer_id,a.customer_name,b.branch
    ORDER BY 4 DESC,5 DESC
)
WHERE ROWNUM <= 1;
