"""
crim 항목의 상위에서 10번쨰 값(즉 상위 10개의 값 중에서 가장 적은 값)으로 상위 10개의 값을 변환하고 age가 80 이상인
값에 대하여 crim의 평균을 구하시오.(단, 답안은 소수점3쨰 자리에서 반올림해서 소수점 2째 자리로 출력하시오.)
"""

import pandas as pd
import numpy as np

df = pd.read_csv("../데이터 셋/P210201.csv")
print(df.head())
print(df.info())

top10 = df['crim'].sort_values(ascending=False).head(10)
print(top10)

tenth = top10.iloc[9]
df['crim'] = np.where(df['crim'] >= tenth, tenth, df['crim'])
over80 = df[df['age'] >= 80]

print(over80['age'].describe())

print(round(over80['crim'].mean(), 2))

