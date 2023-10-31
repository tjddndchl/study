"""
범주형-범주형 
빈도수와 비율을 활용한 교차빈도,비율, 백분율 분석등을 활용하여 데이터간의 연관성을 분석
"""
import pandas as pd
import statsmodels.api as sm
mtcars = sm.datasets.get_rdataset('mtcars').data
print(pd.crosstab(mtcars['am'], mtcars['cyl']))

"""
수치형-수치형
피어슨 상관계수를 이용
x.corr(y, method)
x : 상관관계를 계산하기 위한 x에 해당하는 대상 데이터
y : 상관관계를 계산하기 위한 y에 해당하는 대상 데이터
method : 상관계수 종류를 선택(기본값 : pearson)
        sperman : 스피어만 순위 상관계수
        jendall : 켄달 순위 상고나계수

"""
cor_mpg_wt = mtcars['mpg'].corr(mtcars['wt'])
print(cor_mpg_wt)

