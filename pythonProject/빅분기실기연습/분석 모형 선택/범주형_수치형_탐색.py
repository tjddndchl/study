import pandas as pd
import statsmodels.api as sm

mtcars = sm.datasets.get_rdataset('mtcars').data

df = pd.DataFrame(mtcars)

print(df.head())
a = pd.Series(mtcars['cyl']).value_counts()

print(a)

"""
수치형 데이터
describe 함수는 요약 통계량을 제공하는 함수이다.
"""
b = mtcars['wt'].describe()
print(b)