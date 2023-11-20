# T1 2회 기출유형 Python
import pandas as pd
# 라이브러리 및 데이터 불러오기

df = pd.read_csv('./data/basic1.csv')
print(df.describe(include='all'))
print(df.head())
# 1문제
# 데이터셋(basic1.csv)의 'f5' 컬럼을 기준으로 상위 10개의 데이터를 구하고,
# 'f5'컬럼 10개 중 최소값으로 데이터를 대체한 후,
# 'age'컬럼에서 80 이상인 데이터의'f5 컬럼 평균값 구하기
df = df.sort_values('f5', ascending=False)
print(df.head(10))
#  상위 10개 최소값 찾기
min = df['f5'][:10].min()
print(min)
# 'f5'컬럼 10개 중 최소값으로 데이터를 대체한 후,
df.iloc[:10, -1] = min
print(df.head(10))
# 80세 이상의 f5컬럼 평균
print(df[df['age']>=80]['f5'].mean())

# 문제2
# 데이터셋(basic1.csv)의 앞에서 순서대로 70% 데이터만 활용해서,
# 'f1'컬럼 결측치를 중앙값으로 채우기 전후의 표준편차를 구하고
# 두 표준편차 차이 계산하기
# 라이브러리 및 데이터 불러오기
# 데이터 나누기 방법1
df = pd.read_csv('./data/basic1.csv')
data70 = df.iloc[:70]
data30 = df.iloc[70:]
## 결측치 확인
print(data70.isnull().sum())
## 결측치 채우기 전 f1컬럼 표준편자
std1 = data70['f1'].std()
print(std1)
## 중앙값 확인
med= data70['f1'].median()
print(med)
## 결측치 확인
print(data70.isnull().sum())
## 결측치를 채운 후 표준편차 구하기
std2 = data70['f1'].std()
print(std2)
# 차이
print(std1-std2)

# 문제3
# 데이터셋(basic1.csv)의 'age'컬럼의 이상치를 더하시오!
# 단, 평균으로부터 '표준편차*1.5'를 벗어나는 영역을 이상치라고 판단함
df = pd.read_csv('./data/basic1.csv')

std = df['age'].std() * 1.5
mean = df['age'].mean()

min_out = mean - std
max_out = mean + std
print(min_out, max_out)
# 이상치 age합
age_sum = df[(df['age'] > max_out) | (df['age'] < min_out)]['age'].sum()
print(age_sum)