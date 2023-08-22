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
WHERE SUBSTR(birth,1,4) >= 1988
AND job in ('�ǻ�','�ڿ���');


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
from customer,address
where customer.zip_code = address.zip_code
AND address.address_detail = '������';
/*3������ ������ �� ��*/
 select  customer.job
        ,count( customer.job)
FROM customer
WHERE job is not null --null�� ���ֱ�
group by  customer.job
ORDER by 2 DESC;

/*4������*/

select *
from(

        select TO_CHAR(TO_DATE(first_reg_date),'DAY') as ���� 
                , COUNT(first_reg_date) as �Ǽ�
        from CUSTOMER
        group by  TO_CHAR(TO_DATE(first_reg_date),'DAY')
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







/*�������� ��ҰǼ�*/
 SELECT TO_CHAR(To_DATE(reserv_date),'MM') 
            , COUNT(*)
 FROM reservation
 WHERE cancel = 'Y'
 group by TO_CHAR(To_DATE(reserv_date),'MM') 
 ORDER BY 1;
 






