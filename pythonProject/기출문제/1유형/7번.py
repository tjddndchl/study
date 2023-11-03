"""
p220401 파일을 순서대로 처리하고 결과를 정수로 출력하시오
(1) y 변수의 1사분위와 3 사분위 값을 구하시오
(2) 3 사분위 수에서 1 사분위를 뺀 값을 구하시오
(3) 소수점 이하는 버리고 정수로 출력하시오
"""

import pandas as pd

df = pd.read_csv("../데이터 셋/P220401.csv")
print(df.describe())

q1 = df['y'].quantile(0.25)
q3 = df['y'].quantile(0.75)
print(int(abs(q1 - q3)))