"""
Charges 항목에서 이상값의 합을 구하시오
(단 이문제에 서 이상값은 평균에서 1.5표준편차 이상인 값으로 하고, 답안은 소수점 이하는 버리고 정수로 출력하시오)
"""
import numpy as np
import pandas as pd


df = pd.read_csv("../데이터 셋/P210203.csv")
upper = np.mean(df['charges']) + 1.5 * np.std(df['charges'])
lower = np.mean(df['charges']) - 1.5 * np.std(df['charges'])

result = df[(df['charges'] >= upper) |
             (df['charges'] <= lower)]['charges'].sum()

print(int(result))