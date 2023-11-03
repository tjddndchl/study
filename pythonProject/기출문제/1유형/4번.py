"""
housing데이터세트에서 결측값이 있는 모든 행을 제거한 후 데이터의 순서대로
상위 70%의 데이터를 학습 데이터로 만들고, 훈련 데이터의 house_median_age 컬럼의 제 1사분위수
를 구하시오.(답안은 소수점 이하는 버리고 정수로 출력하시오)
"""
import numpy as np
import pandas as pd

housing = pd.read_csv('../데이터 셋/P210301.csv')
print(housing.info())

print(sum(housing.isnull().any(axis=1)))

housing = housing.dropna()

print(sum(housing.isnull().any(axis=1)))

df = housing.iloc[:int(len(housing) * 0.7), :]

print(int(np.quantile(df['housing_median_age'], q=0.25)))

