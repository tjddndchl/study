"""
country, year, new_sp 컬럼에 결측값이 있을 경우 제거하고
2000년도에 국가별 결핵 발생 건수에 대한 평균 결핵 발생 건수를 구하고, 2000년도의 결핵
발생 건수가 2000년도 국가별 결핵 발생 건수에 대한 평균 결핵 발생 건수보다 결핵 발생 건수가 높은 국가의 개수를 구하시오.
(단 국가별 결핵 발생 건수에 대한 평균 결핵 발생 건수를 출력할때 소수점 3째 자리에서 반올림해서 소수점 2째 자리로 출력하시오)
"""
import numpy as np
import pandas as pd

who = pd.read_csv('../데이터 셋/P210303.csv')
print(who.info())

who = who[['year','country','new_sp']]

who = who.dropna()

who2000 = who[who["year"] == 2000]

mean_cnt = np.mean(who2000['new_sp'])
print(round(mean_cnt, 2))

country = who2000[who2000["new_sp"] >= mean_cnt]
print(len(country))