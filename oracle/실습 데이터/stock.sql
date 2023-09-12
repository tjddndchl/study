create TABLE md_stock AS
select distinct item_code as item_code
    ,   stock_nm
from stocks;
select *
from md_stock;

desc md_stock;


CREATE TABLE TB_stock_bbs(
    item_code VARCHAR2(10)
    ,discussionId VARCHAR2(100) 
    ,bbs_title VARCHAR2(1000) 
    ,bbs_contents VARCHAR2(4000) 
    ,create_date DATE 
    ,readCount NUMBER
    ,goodCount NUMBER 
    ,badCount NUMBER
    ,commentCount NUMBER
    ,update_date DATE
    ,CONSTRAINT stock_bbs_pk PRIMARY KEY(item_code, discussionId)
);

MERGE INTO tb_stock_bbs a
USING dual
ON (a.item_code = :1
        and a.discussionId = :2)
WHEN MATCHED THEN
    UPDATE SET a.readCount = :3
                    , a.goodCount = :4
                    , a.badCount = :5
                    , a.commentCount = :6
WHEN NOT MATCHED THEN
    INSERT(a.item_code, a.discussionId, a.bbs_title, a.bbs_contents, 
                a.create_date, a.readCount, a.goodCount, a.badCount, a.commentCount, 
                a.update_date)
    VALUES (:7, :8, :9, :10, to_date(:11,'YYYY-MM-DD HH24:MI:SS'), :12, :13, :14, :15, SYSDATE);
    
    
    
SELECT *
FROM tb_stock_bbs;


SELECT a.item_code, a.stock_nm
        ,sum(readcount) as read_cnt
        ,sum(goodcount) as good_cnt
        ,sum(badcount) as bad_cnt
        ,sum(commentcount) as comment_cnt
from md_stock a, tb_stock_bbs b
where a.item_code =b.item_code
and regexp_like(a.stock_nm, '^[°¡-Èþ]+$')
group by a.item_code, a.stock_nm
order by good_cnt desc;

