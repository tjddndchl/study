"""
데이터의 첫번째 행부터 순서대로 80%까지의 데이터를 훈련 데이터로
추출후 'total_beadrooms' 변수의 결측값(NA)을 total_bedrooms 변수의 중앙값으로 대체하고 대체 전의
답안은 소수점 3째 자리에서 반올림해서 소수점 2째 자리로 출력하시오
"""

import pandas as pd
import numpy as np

housing = pd.read_csv("../데이터 셋/P210202.csv")

df = housing.iloc[:int(len(housing) * 0.8), :]

df = pd.DataFrame(df)

a = df['total_bedrooms'].std()

median_train = df['total_bedrooms'].median()

df['total_bedrooms'] = \
    df['total_bedrooms'].fillna(median_train)

b = df['total_bedrooms'].std()

print(round(np.abs(a - b), 2))