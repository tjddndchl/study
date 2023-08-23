/*
    1~6�� �⺻ DNML(SELECT, INSERT,UPDATE,DELETE)
    �����Լ�
    ���� �Լ�
    ����/��������
    
    ���� �ð�:������ ����,CONNECT BY�� ���
*/

/* ȸ���� īƮ ���Ƚ���� ���� ����
    ���� �������� ���� ������ ����Ͻÿ�
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
WITH T1 as (SELECT a.�̸�
                            ,   a.�й�
                            ,   a.�б�
                            ,   b.����������ȣ
                            ,   b.�����ȣ
                        FROM �л� a, �������� b
                        WHERE a.�й� = b.�й�(+)
), T2 as(SELECT T1.�̸�, T1.�й�, COUNT(T1.����������ȣ) as �����̷°Ǽ�
            FROM T1
            GROUP BY T1.�̸�, T1.�й�
), T3 as(
            SELECT T1.�̸�, T1.�й�, SUM(����.����) as ��ü��������
            FROM T1, ����
            WHERE T1.�����ȣ = ����.�����ȣ(+)
            GROUP BY T1.�̸�, T1.�й�
)
SELECT  T1.�й�,  T1.�̸�,  MAX(T2.�����̷°Ǽ�), MAX(T3.��ü��������)
FROM T1, T2, T3
WHERE T1.�й� = T2.�й�
AND T1.�й� = T3.�й�
GROUP BY T1.�й�, T1.�̸�;

/* WITH ��
    ��Ī���� ����� select���� �ٸ� �������� ������ ����
    �ݺ��Ǵ� ���������� 1���� ����ó�� ��밡��
    ��������� Ʃ�׽� ���� ���
    -temp��� �ӽ� ���̺��� ����ؼ� ��ð� �ɸ��� ���� ����� �����ؼ�
    �׼���(����)������ �ݺ��ǰ� �Ǽ��� ���� ���̺��� ��ȸ�Ҷ� ������ ����
    ORACLE 9���� �̻󿡼� ������
    -�������� ���� ������ ����.
    **����
    -�޸𸮿� ��ȸ����� �÷����� ����ϱ� ������ ������ ���ɿ� ������ �ټ�����.
    -WITH�� �����ϴ� ������Ʈ�� �ֱ� ������(Ȯ�� �� ���)
*/

-------------------------------
--2000�⵵ ��Ż������  ����� ����� ���� ū ���� ��� ������� '���', '�����'�� ����Ͻÿ�
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
                        ,AVG(T1.amount_sold) as ��վ�
            FROM T1
            GROUP BY T1.sales_month
)
,T3 AS(
SELECT AVG(T1.amount_sold) as ����վ�
            FROM T1
            
)

SELECT T2.sales_month
             ,TRUNC(T2.��վ�,0)
FROM T2,T3
WHERE T2.��վ� > T3.����վ�;

