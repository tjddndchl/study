CREATE TABLE tb_user(
    user_id VARCHAR2(100) PRIMARY KEY
    ,user_pw VARCHAR2(100)
    ,user_nm VARCHAR2(100)
    ,user_mail VARCHAR2(100)
    ,user_mileage NUMBER
    ,create_dt DATE
    ,update_dt DATE DEFAULT SYSDATE
    ,use_yn VARCHAR2(1) DEFAULT 'Y'
);


--select * insert ∑Œ tb_user ≈◊¿Ã∫Ìø° µ•¿Ã≈Õ ª¿‘
SELECT mem_id, mem_pass, mem_name, mem_mail,mem_mileage, sysdate
FROM member;

INSERT INTO tb_user( user_id 
    ,user_pw 
    ,user_nm 
    ,user_mail 
    ,user_mileage 
    ,create_dt )
SELECT mem_id, mem_pass, mem_name, mem_mail,mem_mileage, sysdate
FROM member;

SELECT user_id 
    ,user_pw 
    ,user_nm 
    ,user_mail 
    ,user_mileage 
    
FROM tb_user;
select * from tb_user;

commit;


INSERT INTO tb_user(
                                     user_id
                                    ,user_pw
                                    ,user_nm
                                    ,user_mileage)
VALUES ('a','a','a',1);


UPDATE tb_user
SET user_nm = '∆ÿ«œ'
WHERE user_id = 'r001';

commit;

DELETE FROM tb_user
WHERE user_nm = '∆ÿ«œ'; 
commit;

select * from tb_user;