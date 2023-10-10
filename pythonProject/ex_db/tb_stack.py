import sqlite3
# 경량 db, 파일 형태
# 파일로 만들지 않고 일회성으로 사용할때는 : memory:
#conn = sqlite3.connect(":memory:")
conn = sqlite3.connect("test.db")
print(sqlite3.version)
sql = """ CREATE TABLE tb_stocks(
            market VARCHAR2(20)
            ,trade_price VARCHAR2(100)
            ,str_timestamp VARCHAR2(100)
        )
"""
conn.commit()

sql ="select * from tb_stocks"

cur = conn.cursor()
cur.execute(sql)
row = cur.fetchall() # 전체 조회 결과
print(row)
conn.close()