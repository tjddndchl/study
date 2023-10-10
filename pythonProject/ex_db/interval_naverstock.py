import requests
import DBManager as mydb
import json
import mylogger
from apscheduler.schedulers.blocking import BlockingScheduler

logger = mylogger.make_logger(__name__)
def stock_interval():
    db = mydb.DBManager()

    insert_sql = """
    INSERT INTO stocks (item_code, stock_nm, close_price, compare_close)
    VALUES (:1, :2, :3, :4)
    """
    for i in range(1, 43):
        url = "https://m.stock.naver.com/api/stocks/marketValue/KOSPI?page={0}&pageSize=50".format(str(i))
        print(url)
        res = requests.get(url)
        jsonObj = json.loads(res.text)
        stock_arr = jsonObj['stocks']

        for row in stock_arr:
            db.insert(insert_sql, [row['itemCode'],
                                   row['stockName'],
                                   row['closePrice'],
                                   row['compareToPreviousClosePrice']])
    # logger & apscheduler & dbmanger 를 사용하여
    # 10분 단위로 저장및 기록남기기

    logger.info("{0}바퀴 돌아감".format(str(i)))

sched = BlockingScheduler()


sched.add_job(stock_interval, 'interval', minutes=10)


sched.start()





