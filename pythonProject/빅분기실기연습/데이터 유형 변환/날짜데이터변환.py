#date_string : 문자열로 표현된 날짜
#format : 날짜의 형식 문자열
from datetime import datetime

a = datetime.strptime("1919 March 1", "%Y %B %d")
print(a)

y = a.year
m = a.month
d = a.day
print(y)

print(m)

print(d)

b= datetime.strptime('3-1 1919', "%m-%d %Y")

y=b.year

m=b.month

d=b.day

print(y, m, d)