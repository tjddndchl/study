# 대응(쌍체)표본 T검정
# 주어진 데이터는 고혈압 환자 치료 전후의 혈압이다. 해당 치료가 효과가 있는지 대응(쌍체)표본 t-검정을 진행하시오
# 귀무가설(H0): μ >= 0
# 대립가설(H1): μ < 0
# μ  = (치료 후 혈압 - 치료 전 혈압)의 평균
# 유의수준: 0.05
# 1.μ 의 표본평균은?(소수 둘째자리까지 반올림)
# 2.검정통계량 값은?(소수 넷째자리까지 반올림)
# 3.p-값은?(소수 넷째자리까지 반올림)
# 4.# 가설검정의 결과는? (유의수준 5%)
import pandas as pd
import scipy.stats as stats
help(stats.ttest_rel)
for attr in dir(stats):
    print(attr, getattr(stats, attr))
df = pd.read_csv("./data/high_blood_pressure.csv")

#치료 후 혈압 - 치료 전 혈압
df['diff'] = df['bp_post'] - df['bp_pre']

#1 평균
print(round(df['diff'].mean(), 2))

#2 검정통계량 값
st, pv = stats.ttest_rel(df['bp_post'], df['bp_pre'], alternative="less")
print(round(st, 4))

#3 p-값은
print(round(pv,4))
# 0.05 보다 작으므로 귀무가설 기각, 대립가설 채택

print("t 검정 통계량: ", st)
print("p-값", pv)
