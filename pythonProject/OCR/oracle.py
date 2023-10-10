# pip install cx_Oracle
# pip install easyOCR
# pip install opencv-python
import easyocr
import numpy as np

reader = easyocr.Reader(['ko','en'])

results = reader.readtext('./test/7.png')

arr = []
for result in results:
    arr.append(result[1])
# print(arr)

a = arr[0:-1] # 나눠진 문제

b =arr[-1]  # 답

print(a,b)
q ='' # 다시 합칠려고하는 것
for i in a:
   q +=i
print(q)






import cx_Oracle
conn = cx_Oracle.connect("test", "test", "localhost:1521/xe")
print(conn.version)

sql="""
INSERT INTO quiz VALUES(:1,:2,:3)

"""




data_to_insert = [(2, q, b)]

# 데이터 삽입
with conn.cursor() as cursor:
    cursor.executemany(sql, data_to_insert)

# 변경 사항 저장
conn.commit()

# 연결 종료
conn.close()

