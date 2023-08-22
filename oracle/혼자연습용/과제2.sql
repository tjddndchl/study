select * from customer;
select * from address;
select * from item;
select * from order_info;
select * from reservation;







--6������ ��ü ��ǰ��,��ǰ�̸�,��ǰ���� �� ������������ ���Ͻÿ�
select i.product_name
        ,SUM(o.sales)
from  item i, order_info o
where i.item_id = o.item_id
group by i.product_name
ORDER BY 2 DESC;

---------- 7�� ���� ---------------------------------------------------
-- ����ǰ�� ���� ������� ���Ͻÿ� 
-- �����, SPECIAL_SET, PASTA, PIZZA, SEA_FOOD, STEAK, SALAD_BAR, SALAD, SANDWICH, WINE, JUICE
----------------------------------------------------------------------------

select SUBSTR(RESERV_NO,1,6) as �����
           
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
FROM item i, order_info o
where i.item_id = o.item_id
group by SUBSTR(RESERV_NO,1,6)
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

