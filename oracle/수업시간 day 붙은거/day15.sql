/*  PL/SQL ������ ���� ������ ����� Ư¡�� ��� ����ϱ� ����.
    DB���ο��� ����Ǳ� ������ �ӵ��� �������� ����.
    �⺻ ������ ���(Block)�̶�� �ϸ� �̸���, �����, ����η� ������.
*/
--�̸��δ� ����� ��Ī�� ���µ� ������ ���� �͸� ����� �ȴ�.

DECLARE --�̸��� ����

    vi_num NUMBER := 1;
BEGIN
    vi_num :=100; --:=�Ҵ��� �ǹ�
    DBMS_OUTPUT.PUT_LINE(vi_num); --�ܼ� ����Ʈ
END;
 --������ ������ ���� �� ����   
 
 DECLARE
  vs_emp_name VARCHAR2(80);
  vs_dep_name departments.department_name%TYPE; -- ���̺� �ִ� Ÿ�԰� ������
BEGIN
    SELECT a.emp_name, b.department_name
    INTO vs_emp_name, vs_dep_name  --��°���� ������ ��¹�
    FROM employees a, departments b
    WHERE a.department_id = b.department_id
    AND a.employee_id = 100;
    DBMS_OUTPUT.PUT_LINE(vs_emp_name || ':' || vs_dep_name);
END;

-- IF ��
DECLARE
    vn_user_num NUMBER := TO_NUMBER(:userNm);
    vn_com_num NUMBER := 10;
BEGIN
    IF vn_user_num > vn_com_num THEN
        DBMS_OUTPUT.PUT_LINE('user ���ڰ� �� ŭ');
    ELSIF vn_user_num = vn_com_num THEN
        DBMS_OUTPUT.PUT_LINE('����');
    ELSE
        DBMS_OUTPUT.PUT_LINE('USER ���ڰ� �� ����');
    END IF;-- IF�� ���� END IF�� ����.
END;

--����� �ʿ� ������ BEGIN

BEGIN
     DBMS_OUTPUT.PUT_LINE('3 * 3 =' || 3* 3);
 END;
 
 /*
    ���Ի��� ���Խ��ϴ�.^^
    �����й��� ���� ���� �й���ã�� + 1���Ͽ� �й��� ���� ��
    �л����̺� �������ּ���
    ���� ���� ù �л��̷��� �ش� �⵵�� 000001 �� �ٿ��� �й��� ����.
    
    1.  ���س⵵
    2.  �й��� max�� 
    3.  2.�й��� ���ڸ� 4�ڸ��� ���س⵵ ��
    4.  ���ǹ�
    5.  INSERT
 */

SELECT TO_CHAR(SYSDATE,'YYYY')
FROM dual;

 SELECT MAX(�й�)
 FROM �л� ;
 
 DECLARE
    vs_nm �л�.�̸�%TYPE                :=  :nm;
    vs_subject �л�.����%TYPE           :=  :sub;
    vn_year VARCHAR2(4)                 :=  TO_CHAR(SYSDATE,'YYYY');
    vn_max_num NUMBER;
    vn_make_num NUMBER;
 BEGIN
    SELECT MAX(�й�)
    INTO vn_max_num
    FROM �л�;
    
    IF vn_year = SUBSTR(vn_max_num,1,4) THEN
        vn_make_num := vn_max_num +1;
    ELSE
        vn_make_num := TO_NUMBER(vn_year ||  '000001');
    END IF;
        INSERT INTO �л�(�й�, �̸�, ����)
        VALUES  (vn_make_num,   vs_nm,  vs_subject);
        COMMIT;
 END;
 


 SELECT *
 FROM �л� 
 where �й�  = 2023000001;
 
 /* 
    LOOF��
    �ܼ�LOOF���� EXIT(Ż������) �ʼ�
    WHILE �� ���ۿ� ������ true �̸� LOOF����
    F��OR  IN �ʱ갪...�ִ밪 1�� �ʱ갪���� �ִ밪���� ����
 */
 
 DECLARE
    vn_gugudan NUMBER :=2;
    vn_i NUMBER             :=1;
    
BEGIN


WHILE (vn_gugudan <10)
    LOOP
            vn_i :=vn_i +1;
            EXIT WHEN vn_i > 9;--Ż�� ����
              DBMS_OUTPUT.PUT_LINE(vn_gugudan
             ||'*' ||vn_i ||'-'||vn_gugudan*vn_i);
    END LOOP;

END;




DECLARE
    vn_i NUMBER :=  2;
    
    vn_j NUMBER    ;
    
BEGIN

    LOOP
        DBMS_OUTPUT.PUT_LINE(vn_i || '��');
        vn_j := 1;

        LOOP
            DBMS_OUTPUT.PUT_LINE(vn_i || '*'||vn_j||'='||vn_i *vn_j);
            vn_j := vn_j+1;
            EXIT WHEN vn_j > 9;
        END LOOP;
            vn_i    := vn_i +1;
            EXIT WHEN vn_i > 9;--Ż�� ����

    END LOOP;

END;

--FOR ��

BEGIN
    FOR i  IN 1..9 --1~9���� 1������
    LOOP
        DBMS_OUTPUT.PUT_LINE(2  ||  '*' ||  '=' ||2*i);
    END LOOP;
END;


--RERVERSE  �ݴ��
BEGIN
    FOR i  IN REVERSE 1..9 --9~1���� 1�� ����
    LOOP
        DBMS_OUTPUT.PUT_LINE(2  ||  '*' || i    ||  '=' ||2*i);
    END LOOP;
END;



/*
    oracle ����� �����Լ� pl/sql �� �ۼ�
    ����Ŭ �Լ��� ������ ���ϰ��� 1�� �־����.
*/

--�̸��� �Է¹޾� �й��� �����ϴ� �Լ� �ۼ�
--input:varchar2, output:number

CREATE OR REPLACE FUNCTION fn_get_hakno (nm VARCHAR2)
    RETURN NUMBER
IS  --�̸� ���� ����ۼ��� ����δ� IS�� ����
    vn_hakno NUMBER;
BEGIN
    SELECT �й�
    INTO vn_hakno
    FROM �л�
    WHERE �̸� = nm;
    RETURN vn_hakno;
END;

SELECT fn_get_hakno('�ּ���')
FROM dual;


--�л��̸� �� �Է¹޾� �Ѽ��� ������ �����ϴ� �Լ��� ����ÿ�


SELECT b.�̸�
            ,SUM(c.����)
FROM �������� a,�л� b,���� c
WHERE a.�й� = b. �й�
AND a.�����ȣ = c.�����ȣ
GROUP BY b.�̸�;




CREATE OR REPLACE FUNCTION fn_get_hakno (nm VARCHAR2)
    RETURN NUMBER
IS  --�̸� ���� ����ۼ��� ����δ� IS�� ����
    vn_hakno NUMBER;
BEGIN
    SELECT �й�
    INTO vn_hakno
    FROM �л�
    WHERE �̸� = nm;
    RETURN vn_hakno;
END;

SELECT fn_get_hakno('�ּ���')
FROM dual;
--�̸����� �������� ���ϴ� select�� �ۼ�
--2.pl/sqlȰ���Ͽ� �Լ��ۼ�
CREATE OR REPLACE FUNCTION fn_get_grades (nm VARCHAR2)
    RETURN NUMBER
IS  --�̸� ���� ����ۼ��� ����δ� IS�� ����
    vn_grades NUMBER;
BEGIN
            SELECT 
            SUM(c.����)
            INTO vn_grades
            FROM �������� a,�л� b,���� c
            WHERE a.�й� = b. �й�
            AND a.�����ȣ = c.�����ȣ
            AND b.�̸� = nm;
            RETURN vn_grades;
END;

SELECT fn_get_grades('�ּ���')
FROM dual;


--d_day�� �Է¹޾�(YYYYMMDD)
--��������      input:20230829 return: 1�� ����
--�������� ������ ǥ��   input:20230827  return: 1�� ����
--�� �����ϴ� �Լ��� �ۼ��Ͻÿ�
--input: varchar2, output: varchar2

SELECT  TO_DATE('20230826')-TO_DATE(SYSDATE) 
            ,CASE WHEN TO_DATE('20230826') > TO_DATE(SYSDATE) THEN  
            TO_DATE('20230826')-TO_DATE(SYSDATE) || '�ϳ���'
            WHEN  TO_DATE('20230826') < TO_DATE(SYSDATE) THEN
           TO_DATE(SYSDATE)-TO_DATE('20230826') || '���� ��'
            END ��¥
FROM dual;


SELECT *
FROM dual;
CREATE OR REPLACE FUNCTION fn_get_day (day1 VARCHAR2)
    RETURN  VARCHAR2
IS  --�̸� ���� ����ۼ��� ����δ� IS�� ����
    vn_day VARCHAR2(1000);
    BEGIN
    SELECT  CASE WHEN TO_DATE(day1) > TO_DATE(SYSDATE) THEN  
            TO_DATE(day1)-TO_DATE(SYSDATE) || '�ϳ���'
            WHEN  TO_DATE(day1) < TO_DATE(SYSDATE) THEN
           TO_DATE(SYSDATE)-TO_DATE(day1) || '���� ��'
            END ��¥
            INTO vn_day
FROM dual;
RETURN vn_day;
END;

SELECT fn_get_day('20230831')
FROM dual;



    SELECT CASE WHEN TO_DATE('20230826') > TO_DATE(SYSDATE) THEN  
            TO_DATE('20230826')-TO_DATE(SYSDATE) || '�ϳ���'
            WHEN  TO_DATE('20230826') < TO_DATE(SYSDATE) THEN
           TO_DATE(SYSDATE)-TO_DATE('20230826') || '���� ��'
            END ��¥
FROM dual;