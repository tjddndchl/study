
"""### pandas 기초
- 판다스는 데이터프레임을 자료구조로 사용(행 열구조)

"""

import pandas as pd


df = pd.DataFrame({"name" : ['nick', 'judy', 'alex']
                            ,'age': [10, 20, 22]})
df.head() # 내용출력 (기본 5개)

"""###기존 열을 활용하여 새로운 열을 쉽게 만들수 있다"""

df['age_plus'] = df['age'] + 1
df['age_squared'] = df['age'] * df['age']
df.head()

"""###다양한 내장 함수가 있음."""

total = df['age'].sum()
median = df['age'].quantile(0.5)
print(total, median)

"""### 병합 가능"""

df2 = pd.DataFrame({"name": ['nick', 'judy', 'alex']
                    ,"height": [182, 165, 175]
                    ,"gender":["M","F","M"]})
joined = df.set_index('name').join(df2.set_index('name'))
print(joined.head())

reset_joined = joined.reset_index()
groupby_df = joined.grouby('gender').mean()
groupby_df