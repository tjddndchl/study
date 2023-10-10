import sqlite3
import requests
import json
import datetime

conn = sqlite3.connect("mydb.db")
cur = conn.cursor()
cur.execute("SELECT * FROM stocks")

rows = cur.fetchall()

conn.close()
url = "https://api.upbit.com/v1/ticker?markets="

for row in rows:
    # print(url + row[0])
    res = requests.get(url + row[0])
    if res.status_code == 200:  # 정상응답일때
        json_data = json.loads(res.text)
        # print(json_data)
        market = json_data[0]['market']
        trade_price = "{:.10f}".format(json_data[0]['trade_price'])
        trade_timestamp = json_data[0]['timestamp'] * 0.001  # 초 단위로 변환
        str_timestamp = (
            datetime.datetime.fromtimestamp(trade_timestamp).strftime(
                "%Y-%m-%d %H:%M:%S"))

conn2 = sqlite3.connect("market.db")
cur2 = conn2.cursor()

sql= """INSERT INTO tb_stocks
                VALUES(:1,:2,:3)"""
for row in rows:
    # print(url + row[0])
    res = requests.get(url + row[0])
    if res.status_code == 200:  # 정상응답일때
        json_data = json.loads(res.text)
        # print(json_data)
        market = json_data[0]['market']
        trade_price = "{:.10f}".format(json_data[0]['trade_price'])
        trade_timestamp = json_data[0]['timestamp'] * 0.001  # 초 단위로 변환
        str_timestamp = (
            datetime.datetime.fromtimestamp(trade_timestamp).strftime(
                "%Y-%m-%d %H:%M:%S"))
        cur2.execute(sql, (market
            , trade_price
            , str_timestamp))
conn2.commit()
conn2.close()