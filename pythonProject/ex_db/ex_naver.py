import requests
import DBManager as mydb
import json
import logging
from apscheduler.schedulers.blocking import BlockingScheduler

db = mydb.DBManager()

insert_sql="""
INSERT INTO stocks (item_code, stock_nm, close_price, compare_close)
VALUES (:1, :2, :3, :4)
"""
for i in range(1, 43):
    url = "https://m.stock.naver.com/api/stocks/marketValue/KOSPI?page={0}&pageSize=50".format(str(i))
    print(url)
    res = requests.get(url)
    jsonObj = json.loads(res.text)
    stock_arr = jsonObj['stocks']
    # print(stock_arr)
    
    #  종목코드, 종목명, 증가, 변동가 출력
    # for row in stock_arr:
        # print(row['itemCode'],
        #       row['stockName'],
        #       row['closePrice'],
        #       row['compareToPreviousClosePrice'])
    #itemCode,stockName,closePrice,compareToPreviousClosePrice
    for row in stock_arr:
        db.insert(insert_sql,[row['itemCode'],
                                    row['stockName'],
                                    row['closePrice'],
                                    row['compareToPreviousClosePrice']])
# logger & apscheduler & dbmanger 를 사용하여
# 10분 단위로 저장및 기록남기기

