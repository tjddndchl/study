#total_seconds 함수는 객체가 나타내는 총 초수를 반환하는 함수이다.

from datetime import datetime

x =datetime(19, 3, 1, 12, 1, 0)
y = datetime(19, 3, 1, 12, 2, 0)

z = (x - y).total_seconds()

print(z)