CREATE TABLE exp_goods_asia (
       country VARCHAR2(10),
       seq     NUMBER,
       goods   VARCHAR2(80));

INSERT INTO exp_goods_asia VALUES ('�ѱ�', 1, '�������� ������');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 2, '�ڵ���');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 3, '��������ȸ��');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 4, '����');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 5,  'LCD');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 6,  '�ڵ�����ǰ');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 7,  '�޴���ȭ');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 8,  'ȯ��źȭ����');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 9,  '�����۽ű� ���÷��� �μ�ǰ');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 10,  'ö �Ǵ� ���ձݰ�');

INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 1, '�ڵ���');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 2, '�ڵ�����ǰ');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 3, '��������ȸ��');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 4, '����');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 5, '�ݵ�ü������');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 6, 'ȭ����');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 7, '�������� ������');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 8, '�Ǽ����');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 9, '���̿���, Ʈ��������');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 10, '����');

COMMIT;

SELECT *
FROM exp_goods_asia;

SELECT goods
FROM exp_goods_asia
WHERE country = '�ѱ�'

UNION--�ߺ� ����

SELECT goods
FROM exp_goods_asia
WHERE country = '�Ϻ�';



SELECT *
FROM exp_goods_asia;

SELECT goods
FROM exp_goods_asia
WHERE country = '�ѱ�'

UNION ALL  --��ü��°���

SELECT goods
FROM exp_goods_asia
WHERE country = '�Ϻ�';



SELECT *
FROM exp_goods_asia;

SELECT goods
FROM exp_goods_asia
WHERE country = '�ѱ�'

INTERSECT  --������

SELECT goods
FROM exp_goods_asia
WHERE country = '�Ϻ�';



SELECT *
FROM exp_goods_asia;

SELECT goods
FROM exp_goods_asia
WHERE country = '�ѱ�'

MINUS  --������

SELECT goods
FROM exp_goods_asia
WHERE country = '�Ϻ�';



SELECT TO_CHAR(department_id)
            ,COUNT(*) �μ���������
FROM employees
GROUP BY department_id

UNION

SELECT   ( '��ü')
                ,COUNT (*) AS ��ü������
FROM employees;




SELECT *
FROM exp_goods_asia;

SELECT seq, goods
FROM exp_goods_asia
WHERE country = '�ѱ�'

UNION  --�ߺ�����

SELECT seq, goods
FROM exp_goods_asia
WHERE country = '�Ϻ�'

UNION

SELECT 10, '��ǻ��'
FROM dual;

--exists �����ϴ��� ���ϴ���
--���� �����̶�� ��.


--job-history ���̺� �����ϴ� �μ� ���
SELECT department_id
            ,department_name
FROM departments  a
WHERE exists(SELECT *  --select �ǹ̾��� where �� ���뿡 �ش�Ǵ�
                                       --�����Ͱ� �����ϴ����� üũ
                    FROM job_history b
                    WHERE a.department_id = b.department_id);


SELECT department_id
            ,department_name
FROM departments  a
WHERE NOT EXISTS (SELECT *  --select �ǹ̾��� where �� ���뿡 �ش�Ǵ�
                                       --�����Ͱ� �����ϴ����� üũ
                    FROM job_history b
                    WHERE a.department_id = b.department_id);               
                    
SELECT *
FROM �л� a
WHERE NOT EXISTS (SELECT *
                                FROM �������� b
                                WHERE b.�й� = a.�й�);
                                
                                
/* ���� ǥ����  '�˻�', 'ġȯ'�ϴ� ������ �����ϰ� ó���� �� �ֵ��� �ϴ� ����.   
    oracle�� 10g���� ���(JAVA,PYTHIN,JS �� ����ǥ���� ��밡��) ���ݾ� �ٸ�
    .(dot) or []�� ��� ���� 1���ڸ� �ǹ���
   ^  <-- ������ �ǹ��� ^[0 ~ 9] <--���ڷ� �����ϴ�
   [^0~9]<-- ��Ȱ�� ���� ^ <-- not�� �ǹ���
*/


--REGEXP_LIKE : ���Խ� ������ �˻�
SELECT *
FROM member
WHERE REGEXP_LIKE(mem_comtel, '^....-');
--������ 3�� ���� �� @���� ��ȸ(abc@mail.con)
/*
* : 0���̻�
+ : 1���̻�
? : 0,1��
{n}: n��
{n, }: �� �̻�
{n,m}:n�� �̻� m�� ����
*/
SELECT *
FROM member
WHERE REGEXP_LIKE(mem_mail,'^[a-zA-Z]{3,5}@'); 

--mem_add2 ���ڶ��⹮�� ������ �����͸� ����Ͻÿ�
SELECT mem_name
            ,mem_add2
FROM member
--WHERE REGEXP_LIKE(mem_add2,'.');--��� ���ڵ�
--WHERE REGEXP_LIKE(mem_add2,'^[��-�R]');--�ѱ�
--WHERE REGEXP_LIKE(mem_add2,'[��-��]$');--�ѱ۷� ������ $ -> ����������
--WHERE REGEXP_LIKE(mem_add2,'^[��-�R]+[��-�R]$');
--WHERE REGEXP_LIKE(mem_add2,'^[��-�R]+$');
--WHERE  REGEXP_LIKE(mem_add2,'^[^��-�R]*$');
WHERE  REGEXP_LIKE(mem_add2,'^[^��-�R]');

--! <--�Ǵ�
-- ()<--���ϱ׷�
--J�� �����ϸ�, ������ ���ڰ� M�Ǵ� N�� �����̸� ��ȸ
SELECT emp_name
FROM employees
WHERE REGEXP_LIKE(emp_name,'^J.[a|b]');

--REGEXP SUBSTR ����ǥ���� ������ ��ġ�ϴ� ���ڿ� ��ȯ
--�̸��� @�� �������� �հ� �� �� ����Ͻÿ�
                                                            --����, ������ġ, ��Ī����
SELECT REGEXP_SUBSTR(mem_mail, '[^@]+',1,1) as mem_id
            ,REGEXP_SUBSTR(mem_mail, '[^@]+',1,2) as mem_domain
FROM member;

SELECT REGEXP_SUBSTR('A-B-C','[^-]+',1, 1) as a
            ,REGEXP_SUBSTR('A-B-C','[^-]+',1, 2) as b
            ,REGEXP_SUBSTR('A-B-C','[^-]+',1, 3) as c
FROM dual;

SELECT REGEXP_SUBSTR('pang su hi 1234','[0-9]+$') --default 1,1
            ,REGEXP_SUBSTR('pang su hi 1234','[0-9]{1}{4}$')
            ,REGEXP_SUBSTR('pang su hi 1234','[^0-9]+')
FROM dual;
SELECT * FROM member;
SELECT REGEXP_SUBSTR(mem_add1,'[^ ]+',1,2) as b--���⸦ �������� 2���� �����ϴ� �ּҸ� ����Ͻÿ�
            , REGEXP_SUBSTR(mem_add1,'[��-�R]+',1,2) as b
FROM member;


SELECT *
FROM   ( 
                SELECT 'abcd1234' as id FROM dual

                UNION

                SELECT 'Abcd123456' as id FROM dual

                UNION

                SELECT 'A1234' as id FROM dual
                
                UNION
                
                SELECT 'A12345678cdefg' as id FROM dual
) 
WHERE REGEXP_LIKE(id,'^.{12,14}$');     -- 8~14 ���� �ؽ�Ʈ �����ϴ� ���������





