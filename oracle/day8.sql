/*INNER JOIN �������(��������)*/
select * from �л�; 
SELECT * FROM ��������;

SELECT �л�.�й�
        ,    �̸�--���ʿ��� �ִ°Ŵ� �̸� �Ⱥٿ�����
        ,    �л�.����
        ,    ��������.�����ȣ
        ,    ��������.����������ȣ
FROM �л� ,�������� 
WHERE �л�.�й�  = ��������.�й� ;


SELECT �л�.�й�
            ,�л�.�̸�
            ,�л�.����
            ,��������.�����ȣ
            ,��������.����������ȣ
            ,����.�����̸�          
            
            
FROM �л�,��������,����
WHERE �л�.�й� = ��������.�й�
AND ��������.�����ȣ= ����.�����ȣ
AND �л�.�̸� = '�ּ���';

--�ּ����� ���� �������� ����Ͻÿ�
SELECT * FROM ����;

 
SELECT  �л�.�й�
             ,�л�.�̸�
            ,�л�.����
            ,SUM(����.����) as ��������
FROM �л�,����,��������
where �л�.�й� =��������.�й�
AND ����.�����ȣ = ��������.�����ȣ
--AND �л�.�̸� = '�ּ���'
GROUP BY �л�.�̸�
            ,�л�.�й�
            ,�л�.����;
            
/*�ƿ��� ����
    ��� ���ʿ� null���� ���Խ��Ѿ� �Ҷ�
    (������ ���������̺��� ������ ���Խ��Ѿ��ϸ� �ƿ�����������)
*/

SELECT  �л�.�й�
             ,�л�.�̸�
            ,�л�.����
            ,��������.�й�  AS ���������й�
            ,����.�����̸�
FROM �л�,����,��������
where �л�.�й� =��������.�й�(+)  --null�� ���Խ�ų ���̺�
AND ����.�����ȣ(+) = ��������.�����ȣ--null�� ���Խ�ų ���̺�, ���ʿ��� ��������
AND �л�.�̸� = '������';


--�л��� �����̷°Ǽ��� ����Ͻÿ�
--����л� ��� null�̸� ������

SELECT �л�.�̸�
            ,�л�.�й�
            ,COUNT(����.�����ȣ) AS �����̷�_�Ǽ�
            ,NVL(SUM(����.����),'0') AS ������
FROM �л�,��������,����
where �л�.�й� = ��������.�й�(+)
AND  ��������.�����ȣ = ����.�����ȣ(+)
group BY �л�.�̸�,�л�.�й�
order by 2;
 
 
 
 SELECT  �л�.�й�
             ,�л�.�̸�
            ,�л�.����
            ,��������.����������ȣ
            ,(select �����̸� -- ��Į�� �������� (������ ��밡��)    
            FROM ����
            WHERE �����ȣ = ��������.�����ȣ) AS �����̸�
            
FROM �л�,��������
where �л�.�й� =��������.�й�(+) 
AND �л�.�̸� = '�ּ���';
            
/*�л��� ������ �ο����� ���Ͻÿ�*/

select ����
        ,  COUNT(����) as �л���
FROM �л�
GROUP BY ����;

SELECT * FROM �л�;

 

select AVG(�л�.����)
FROM �л�;

select * 
from �л�
where �л�.���� >= (select AVG(�л�.����)
                            FROM �л�);


select * 
from �л�
where �л�.���� LIKE (select MAX(�л�.����)
                            FROM �л�); --��ø ���� ����
                            
SELECT * from �л�;
select * from ��������;

select*
from �л�
where �л�.�й� NOT IN(select ��������.�й� 
                                    from ��������);
                                    
/*�ζ��κ�(FROM��)
    SELECT���� ���� ����� ��ġ ���̺�ó�� ���
    */
    
SELECT * 
FROM  (SELECT ROWNUM as rnum
    , �й�, �̸�, ����
FROM �л�) a --SELECT���� ���̺�ó�� ���
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
ORDER BY emp_name; --������ �ڿ������� ���ı���


/*�л��߿� ���� ���� 5�� ����Ͻÿ�*/
select *

FROM(select ROWNUM as ����
             ,a.*
       
         FROM (select �̸�
                              ,����
                    from �л�
                    order by 2 DESC)a
            )
where ���� BETWEEN 3 AND 3;


-- meber, cart , prod �� ����Ͽ�
-- ���� īƮ���Ƚ��, ��ǰǰ��Ǽ�, ��ǰ���ż���, �ѱ��űݾ��� ����Ͻÿ�
-- �����̷��� ���ٸ� 0 <-- ���� ��µǵ���

SELECT *FROM member;
SELECT *FROM cart;
SELECT *FROM prod;

select m.mem_name as �̸�
        , count(distinct c.cart_no) as īƮ���Ƚ��
        , count(p.prod_name) as ��ǰǰ��Ǽ�
        ,NVL(SUM(c.cart_qty),0) as ��ǰ���ż���
        , NVL(SUM( p.prod_sale * c.cart_qty),0) as �ѱ��űݾ� 
        
FROM member m,cart c,prod p
where m.mem_id = c.cart_member(+)
and    c.cart_prod = p.prod_id(+)
group by m.mem_name
order by 5 DESC;