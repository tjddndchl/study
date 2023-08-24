select *
from reservation;
select * from customer;
select * from order_info;
select * from item;
/*
 STUDY ������ create_table ��ũ��Ʈ�� �����Ͽ� 
 ���̺� ������ 1~ 5 �����͸� ����Ʈ�� �� 
 �Ʒ� ������ ����Ͻÿ� 
 (������ ���� ��¹��� �̹��� ����)
*/
-----------1�� ���� ---------------------------------------------------
--1988�� ���� ������� ������ �ǻ�,�ڿ��� ���� ����Ͻÿ� (� ������ ���)
---------------------------------------------------------------------
-----------2�� ���� ---------------------------------------------------
--�������� ��� ���� �̸�, ��ȭ��ȣ�� ����Ͻÿ� 
---------------------------------------------------------------------
----------3�� ���� ---------------------------------------------------
--CUSTOMER�� �ִ� ȸ���� ������ ȸ���� ���� ����Ͻÿ� (���� NULL�� ����)
---------------------------------------------------------------------
----------4-1�� ���� ---------------------------------------------------
-- ���� ���� ����(ó�����)�� ���ϰ� �Ǽ��� ����Ͻÿ� 
---------------------------------------------------------------------
----------4-2�� ���� ---------------------------------------------------
-- ���� �ο����� ����Ͻÿ� 
---------------------------------------------------------------------
----------5�� ���� ---------------------------------------------------
--���� ���� ��� �Ǽ��� ����Ͻÿ� (���� �� ���� ���)
---------------------------------------------------------------------


/*
1�� ����
-1988�� ���� ������� ������ �ǻ�,�ڿ��� ���� ����Ͻÿ�(� ������ ���)
*/
SELECT *
    from customer
WHERE 1=1
AND (TO_NUMBER(SUBSTR(birth,1,4))) >= 1988
AND job in ('�ǻ�','�ڿ���');
--AND email = ' ';


UNION

SELECT *
    from customer 
WHERE SUBSTR(birth,1,4) >= 1988
AND job in '�ڿ���';

order by 7 DESC;





/*
2�� ���� 
�������� ��� ���� �̸�, ��ȭ��ȣ�� ����Ͻÿ�
*/
select * FROM address;
select customer_name
        ,phone_number
        ,address_detail
from customer,address
where customer.zip_code = address.zip_code
AND address.address_detail = '������';
/*3������ ������ �� ��*/
 select  customer.job
        ,count( customer.job)
FROM customer
WHERE 1=1 
AND job is not null --null�� ���ֱ�
group by  customer.job
ORDER by 2 DESC;

/*4������*/

select *
from(

        select TO_CHAR(first_reg_date,'DAY') as ���� 
                , COUNT(first_reg_date) as �Ǽ�
        from CUSTOMER
        group by  TO_CHAR(first_reg_date,'DAY')
        order by 2 desc
       )
       WHERE rownum =1;







/*4-2������*/

SELECT NVL(a.����,'�հ�')
            ,count(a.����)
FROM(

  SELECT decode(sex_code,'M','����','F','����','�̵��')  as ����
  FROM customer)  a
group by ROLLUP (a.����);

--grouping id : group by ������ �׷�ȭ�� ������ ��, ���� �÷��� ���� ���� ��Ż�� ���� �����ϱ� ���� �Լ�

SELECT sex_code
            ,grouping_id(sex_code) as groupid
            ,COUNT(*) as cnt
FROM customer
GROUP BY ROLLUP(sex_code);


SELECT CASE WHEN sex_code = 'F' THEN '����'
                      WHEN sex_code = 'M'  THEN '����'
                      WHEN sex_code  IS NULL AND groupid=0 THEN '�̵��'
                      ELSE '�հ�'
                      END as gender
                      ,cnt
FROM(

SELECT sex_code
            ,grouping_id(sex_code) as groupid
            ,COUNT(*) as cnt
FROM customer

GROUP BY ROLLUP( sex_code)

);







/*�������� ��ҰǼ�*/
 SELECT TO_CHAR(To_DATE(reserv_date),'MM') as �� 
            , COUNT(*) as ��Ұ�
 FROM reservation
 WHERE cancel = 'Y'
 group by TO_CHAR(To_DATE(reserv_date),'MM') 
 ORDER BY 1;
 






