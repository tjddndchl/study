"""
단일표본 정규성 검정수행하기전에 , 데이터가 정규분포를 따른다는 정규성
가정을 만족하는지를 확인한다.
"""

"""
신제품 은 7개
유의수준은 : 0.05
평균높이가 11cm
"""

import pandas as pd
from scipy.stats import shapiro, ttest_1samp

df = pd.DataFrame({'height' : [12, 14 ,16, 19, 11, 17, 13]})

print(df)

print(shapiro(df['height']))

print(ttest_1samp(df['height'], popmean=11))

"""
정규성 가정을 만족하지 않는 경우
wilcoxon 함수를 사용
"""

import pandas as pd
from scipy.stats import shapiro, wilcoxon

df = pd.read_csv("../데이터 셋/cats.csv")

print(df.info())

result = shapiro(df['Bwt'])
print(result)

result = wilcoxon(df['Bwt'] - 2.1, alternative = 'two-sided')

print(result)

"""
쌍체표본 T-검정은 표본이 하나, 독립변수가 1개일때 사용

"""

import pandas as pd
from scipy.stats import ttest_rel

data = pd.DataFrame({
    'before' : [5, 3, 8, 4, 3, 2, 1],
    'after'  : [8, 6, 6, 5, 8, 7, 3]
})

print(data)

result = ttest_rel(data['before'], data['after'],\
                   alternative='less')

print(result)

print(result.pvalue)


"""
독립표본 T-검정
데이터가 서로다른 모집단에서 추출된 경우 사용할수있는방법
독립된 두 집단의 평균 차이를 검정하는 방법이다.
반드시 정규성, 등분산성 가정이 만족되는지 확인
"""

"""
표본의 수에 따른 정규성 증명 방법
10개 미만 : 정규성 만족못한다 간주하고 비모수적 방법인 만-위트니검정적용
10개 이상 ~ 30개 이하 : 샤피로-월크 검정, 콜모고로프-스미르노프 검정등의 방법을 통해서 정규성을 증명
30개 이상 : 중심극한정리를 통해서 정규성을 증명
"""

import pandas as pd
from scipy.stats import ttest_ind, levene

cats = pd.read_csv("../데이터 셋/cats.csv")
print(cats.info())

group1 = cats[cats['Sex'] == "F"]["Bwt"]
group2 = cats[cats['Sex'] == "M"]["Bwt"]

result = levene(group1, group2)
print(result)

print(result.pvalue)


result = ttest_ind(group1, group2, equal_var=False)
print(result)

print(result.pvalue)

