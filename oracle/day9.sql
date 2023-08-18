CREATE TABLE exp_goods_asia (
       country VARCHAR2(10),
       seq     NUMBER,
       goods   VARCHAR2(80));

INSERT INTO exp_goods_asia VALUES ('ÇÑ±¹', 1, '¿øÀ¯Á¦¿Ü ¼®À¯·ù');
INSERT INTO exp_goods_asia VALUES ('ÇÑ±¹', 2, 'ÀÚµ¿Â÷');
INSERT INTO exp_goods_asia VALUES ('ÇÑ±¹', 3, 'ÀüÀÚÁýÀûÈ¸·Î');
INSERT INTO exp_goods_asia VALUES ('ÇÑ±¹', 4, '¼±¹Ú');
INSERT INTO exp_goods_asia VALUES ('ÇÑ±¹', 5,  'LCD');
INSERT INTO exp_goods_asia VALUES ('ÇÑ±¹', 6,  'ÀÚµ¿Â÷ºÎÇ°');
INSERT INTO exp_goods_asia VALUES ('ÇÑ±¹', 7,  'ÈÞ´ëÀüÈ­');
INSERT INTO exp_goods_asia VALUES ('ÇÑ±¹', 8,  'È¯½ÄÅºÈ­¼ö¼Ò');
INSERT INTO exp_goods_asia VALUES ('ÇÑ±¹', 9,  '¹«¼±¼Û½Å±â µð½ºÇÃ·¹ÀÌ ºÎ¼ÓÇ°');
INSERT INTO exp_goods_asia VALUES ('ÇÑ±¹', 10,  'Ã¶ ¶Ç´Â ºñÇÕ±Ý°­');

INSERT INTO exp_goods_asia VALUES ('ÀÏº»', 1, 'ÀÚµ¿Â÷');
INSERT INTO exp_goods_asia VALUES ('ÀÏº»', 2, 'ÀÚµ¿Â÷ºÎÇ°');
INSERT INTO exp_goods_asia VALUES ('ÀÏº»', 3, 'ÀüÀÚÁýÀûÈ¸·Î');
INSERT INTO exp_goods_asia VALUES ('ÀÏº»', 4, '¼±¹Ú');
INSERT INTO exp_goods_asia VALUES ('ÀÏº»', 5, '¹ÝµµÃ¼¿þÀÌÆÛ');
INSERT INTO exp_goods_asia VALUES ('ÀÏº»', 6, 'È­¹°Â÷');
INSERT INTO exp_goods_asia VALUES ('ÀÏº»', 7, '¿øÀ¯Á¦¿Ü ¼®À¯·ù');
INSERT INTO exp_goods_asia VALUES ('ÀÏº»', 8, '°Ç¼³±â°è');
INSERT INTO exp_goods_asia VALUES ('ÀÏº»', 9, '´ÙÀÌ¿Àµå, Æ®·£Áö½ºÅÍ');
INSERT INTO exp_goods_asia VALUES ('ÀÏº»', 10, '±â°è·ù');

COMMIT;

SELECT *
FROM exp_goods_asia;

SELECT goods
FROM exp_goods_asia
WHERE country = 'ÇÑ±¹'

UNION--Áßº¹ »èÁ¦

SELECT goods
FROM exp_goods_asia
WHERE country = 'ÀÏº»';



SELECT *
FROM exp_goods_asia;

SELECT goods
FROM exp_goods_asia
WHERE country = 'ÇÑ±¹'

UNION ALL  --ÀüÃ¼Ãâ·Â°áÇÕ

SELECT goods
FROM exp_goods_asia
WHERE country = 'ÀÏº»';



SELECT *
FROM exp_goods_asia;

SELECT goods
FROM exp_goods_asia
WHERE country = 'ÇÑ±¹'

INTERSECT  --±³ÁýÇÕ

SELECT goods
FROM exp_goods_asia
WHERE country = 'ÀÏº»';



SELECT *
FROM exp_goods_asia;

SELECT goods
FROM exp_goods_asia
WHERE country = 'ÇÑ±¹'

MINUS  --Â÷ÁýÇÕ

SELECT goods
FROM exp_goods_asia
WHERE country = 'ÀÏº»';



SELECT TO_CHAR(department_id)
            ,COUNT(*) ºÎ¼­º°Á÷¿ø¼ö
FROM employees
GROUP BY department_id

UNION

SELECT   ( 'ÀüÃ¼')
                ,COUNT (*) AS ÀüÃ¼Á÷¿ø¼ö
FROM employees;




SELECT *
FROM exp_goods_asia;

SELECT seq, goods
FROM exp_goods_asia
WHERE country = 'ÇÑ±¹'

UNION  --Áßº¹Á¦°Å

SELECT seq, goods
FROM exp_goods_asia
WHERE country = 'ÀÏº»'

UNION

SELECT 10, 'ÄÄÇ»ÅÍ'
FROM dual;

--exists Á¸ÀçÇÏ´ÂÁö ¾ÊÇÏ´ÂÁö
--¼¼¹Ì Á¶ÀÎÀÌ¶ó°íµµ ÇÔ.


--job-history Å×ÀÌºí¿¡ Á¸ÀçÇÏ´Â ºÎ¼­ Ãâ·Â
SELECT department_id
            ,department_name
FROM departments  a
WHERE exists(SELECT *  --select ÀÇ¹Ì¾øÀ½ where ÀÇ ³»¿ë¿¡ ÇØ´çµÇ´Â
                                       --µ¥ÀÌÅÍ°¡ Á¸ÀçÇÏ´ÂÁö¸¸ Ã¼Å©
                    FROM job_history b
                    WHERE a.department_id = b.department_id);


SELECT department_id
            ,department_name
FROM departments  a
WHERE NOT EXISTS (SELECT *  --select ÀÇ¹Ì¾øÀ½ where ÀÇ ³»¿ë¿¡ ÇØ´çµÇ´Â
                                       --µ¥ÀÌÅÍ°¡ Á¸ÀçÇÏ´ÂÁö¸¸ Ã¼Å©
                    FROM job_history b
                    WHERE a.department_id = b.department_id);               
                    
SELECT *
FROM ÇÐ»ý a
WHERE NOT EXISTS (SELECT *
                                FROM ¼ö°­³»¿ª b
                                WHERE b.ÇÐ¹ø = a.ÇÐ¹ø);
                                
                                
/* Á¤±Ô Ç¥Çö½Ä  '°Ë»ö', 'Ä¡È¯'ÇÏ´Â °úÁ¤À» °£ÆíÇÏ°Ô Ã³¸®ÇÒ ¼ö ÀÖµµ·Ï ÇÏ´Â ¼ö´Ü.   
    oracleÀº 10gºÎÅÍ »ç¿ë(JAVA,PYTHIN,JS ´Ù Á¤±ÔÇ¥Çö½Ä »ç¿ë°¡´É) Á¶±Ý¾¿ ´Ù¸§
    .(dot) or []Àº ¸ðµç ¹®ÀÚ 1±ÛÀÚ¸¦ ÀÇ¹ÌÇÔ
   ^  <-- ½ÃÀÛÀ» ÀÇ¹ÌÇÔ ^[0 ~ 9] <--¼ýÀÚ·Î ½ÃÀÛÇÏ´Â
   [^0~9]<-- ´ëÈ°°í ¾ÈÀÇ ^ <-- notÀ» ÀÇ¹ÌÇÔ
*/


--REGEXP_LIKE : Á¤±Ô½Ä ÆÐÅÏÀ» °Ë»ö
SELECT *
FROM member
WHERE REGEXP_LIKE(mem_comtel, '^....-');
--¿µ¹®ÀÚ 3¹ø ÃâÇö ÈÄ @ÆÐÅÏ Á¶È¸(abc@mail.con)
/*
* : 0°³ÀÌ»ó
+ : 1°³ÀÌ»ó
? : 0,1°³
{n}: n¹ø
{n, }: ¹ø ÀÌ»ó
{n,m}:n¹ø ÀÌ»ó m¹ø ÀÌÇÏ
*/
SELECT *
FROM member
WHERE REGEXP_LIKE(mem_mail,'^[a-zA-Z]{3,5}@'); 

--mem_add2 ¹®ÀÚ¶ç¾î¾²±â¹®ÀÚ ÆÐÅÏÀÇ µ¥ÀÌÅÍ¸¦ Ãâ·ÂÇÏ½Ã¿À
SELECT mem_name
            ,mem_add2
FROM member
--WHERE REGEXP_LIKE(mem_add2,'.');--¾î´À ¹®ÀÚµç
--WHERE REGEXP_LIKE(mem_add2,'^[°¡-ÆR]');--ÇÑ±Û
--WHERE REGEXP_LIKE(mem_add2,'[°¡-Èþ]$');--ÇÑ±Û·Î ³¡³ª´Â $ -> ³¡³ª´ÂÆÐÅÏ
--WHERE REGEXP_LIKE(mem_add2,'^[°¡-ÆR]+[°¡-ÆR]$');
--WHERE REGEXP_LIKE(mem_add2,'^[°¡-ÆR]+$');
--WHERE  REGEXP_LIKE(mem_add2,'^[^°¡-ÆR]*$');
WHERE  REGEXP_LIKE(mem_add2,'^[^°¡-ÆR]');

--! <--¶Ç´Â
-- ()<--ÆÐÅÏ±×·ì
--J·Î ½ÃÀÛÇÏ¸ç, ¼¼¹ø¤Š ¹®ÀÚ°¡ M¶Ç´Â NÀÎ Á÷¿øÀÌ¸§ Á¶È¸
SELECT emp_name
FROM employees
WHERE REGEXP_LIKE(emp_name,'^J.[a|b]');

--REGEXP SUBSTR Á¤±ÔÇ¥Çö½Ä ÆÐÅÏÀ» ÀÏÄ¡ÇÏ´Â ¹®ÀÚ¿­ ¹ÝÈ¯
--ÀÌ¸ÞÀÏ @¸¦ ±âÁØÀ¸·Î ¾Õ°ú µÚ ¸¦ Ãâ·ÂÇÏ½Ã¿À
                                                            --ÆÐÅÏ, ½ÃÀÛÀ§Ä¡, ¸ÅÄª¼ø¹ø
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
SELECT REGEXP_SUBSTR(mem_add1,'[^ ]+',1,2) as b--¶ç¾î¾²±â¸¦ ±âÁØÀ¸·Î 2¹ø¤Š ÃâÇöÇÏ´Â ÁÖ¼Ò¸¦ Ãâ·ÂÇÏ½Ã¿À
            , REGEXP_SUBSTR(mem_add1,'[°¡-ÆR]+',1,2) as b
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
WHERE REGEXP_LIKE(id,'^.{12,14}$');     -- 8~14 »çÀÌ ÅØ½ºÆ® ¸¸Á·ÇÏ´Â µ¥ÀÌÅÍÃâ·Â





