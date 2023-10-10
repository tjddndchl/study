import sqlite3
import requests
import json
url ="https://api.upbit.com/v1/ticker?markets="
sql= """INSERT INTO stocks
                VALUES(:1,:2,:3)"""
res = requests.get(url)
text = res.text
json_date = json.loads(text)
#print(json_date)
conn = sqlite3.connect("market.db")
cur = conn.cursor()
for row in json_date:
    cur.execute(sql,[row['trade']
                    ,row['korean_name']
                    ,row['english_name']])
conn.commit()
conn.close()