CREATE TABLE stocks(
    item_code           VARCHAR2(10)
    ,stock_nm           VARCHAR2(100)
    ,close_price        VARCHAR2(100)
    ,compare_close VARCHAR2(100)
    ,create_dt          DATE default SYSDATE
);

select * from stocks;
INSERT INTO stocks (item_code, stock_nm, close_price, compare_close)
VALUES (:1, :2, :3, :4);

SELECT close_price
FROM stocks
where stock_nm LIKE 'µÎ»ê';