#결측값 : 결측값은 입력이 누락된 값이다.

# 결측값 인식: 분석 데이터에 결측값이 있는지 확인한다.
# 결측값이 데이터에 포함되어 있으면 산술 연산을 수행할 수 없으므로 분석 결과가 왜곡될수 있다.

#isna : 결측값 인식 함수
#isna(x) : 데이터의 각 행 과변수별로 결측값이 있을 경우 True, 아니면 False 출력

import pandas as pd

airquality = pd.read_csv('data/airquality.csv')
print(airquality)

print(airquality.isna())