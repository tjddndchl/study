import pandas as pd
from scipy import stats
#예제 데이터
data = [3, 36, 37, 45 ,52,56, 56 ,58, 66, 68, 75, 90, 100]

#기술 통계
#중심경향성 : 평균, 중앙값, 최빈값
mean = pd.Series(data).mean()
median = pd.Series(data).median()
mode = pd.Series(data).mode()

print(f"mean:{mean}, median:{median}, mode:{mode[0]}")


#산포도 : 범위, 분산, 표준편차
range_ = max(data) - min(data)
variance = pd.Series(data).var()
std_dev = pd.Series(data).std()
print(f"range:{range_}, variance:{variance}, standard deviation:{std_dev}")

df=pd.Series(data)
#1사분위와 3사분위를 계산
Q1 = df.quantile(0.25)
Q3 = df.quantile(0.75)

#사분위편차 계산
IQR = Q3 - Q1
print(f"1분위:{Q1}, 3분위:{Q3}, 사분위편차(IQR):{IQR}")

df.describe() #기초 통계 요약

df.info()#기본정보(null값, )
import matplotlib.pyplot as plt
import seaborn as sns
#그래프 데이터 보기
plt.figure(figsize=(15, 5))
#산점도 그리기
index = range(len(data))
plt.subplot(1, 3, 1)
plt.scatter(index, data, color='blue', marker='o')
plt.title('scatter plot')
plt.grid(True)
#박스 플롯
plt.subplot(1, 3, 2)
sns.boxplot(data, color='lightgreen')
plt.title('box plot')
#선 그래프
plt.subplot(1, 3, 3)
plt.plot(data,  marker='o', linestyle='-', color='coral')
plt.title('line graph')
plt.grid(True)
plt.tight_layout()
plt.show()