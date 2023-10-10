from apscheduler.schedulers.blocking import BlockingScheduler
import datetime
import sqlite3
import requests
import json


def stack_interval():
    conn = sqlite3.connect("mydb.db")
    cur = conn.cursor()
    cur.execute("SELECT * FROM stocks")
    rows = cur.fetchall()
    conn.close()

    url = "https://api.upbit.com/v1/ticker?markets="

    conn2 = sqlite3.connect("market.db")
    cur2 = conn2.cursor()

    sql = """INSERT INTO tb_stocks (market, trade_price, str_timestamp) VALUES (?, ?, ?)"""

    for row in rows:
        res = requests.get(url + row[0])
        if res.status_code == 200:
            json_data = json.loads(res.text)
            market = json_data[0]['market']
            trade_price = "{:.10f}".format(json_data[0]['trade_price'])
            trade_timestamp = json_data[0]['timestamp'] * 0.001
            str_timestamp = datetime.datetime.fromtimestamp(trade_timestamp).strftime("%Y-%m-%d %H:%M:%S")
            cur2.execute(sql, (market, trade_price, str_timestamp))

    conn2.commit()
    conn2.close()


def test_interval():
    print("interval")
    print(datetime.datetime.now())


def test_cron():
    print("cron")
    print(datetime.datetime.now())


sched = BlockingScheduler()

# 주기적으로 실행할 함수 등록
#sched.add_job(test_interval, 'interval', minutes=10)
sched.add_job(stack_interval, 'interval', minutes=10)

# 원하는 스케줄 등록 (주석 해제하여 필요한 스케줄을 활성화할 수 있습니다.)
# sched.add_job(test_cron, 'cron', hour=11, minute=55)
# sched.add_job(test_cron, 'cron', day=1, hour=10, minute=30)
# sched.add_job(test_cron, 'cron', day_of_week='mon-fri', hour=14)
# sched.add_job(test_cron, 'cron', day_of_week='wed-fri', hour=9)
# sched.add_job(test_cron, 'cron', month=1, day=1, hour=0)

sched.start()






