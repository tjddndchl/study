"""
데이터가 없는 것을 결측값으로 하여 결측값 비율을 구하고
결측값 비율이 가장 높은 컬럼의 이름을 구하시오
"""

import pandas as pd

titanic = pd.read_csv("../데이터 셋/P210302.csv")
cs = titanic.isna().sum() / len(titanic)
print(cs)

cs = pd.DataFrame(cs)

ds = cs.sort_values(by=0, ascending=False)
print(ds.index[0])