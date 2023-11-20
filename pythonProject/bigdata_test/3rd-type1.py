
# [3rd-type1-1] 3회 기출유형 작업형1-1
# Q. 2022년 데이터 중 2022년 중앙값보다 큰 값의 데이터 수
import pandas as pd
df = pd.read_csv("./data/3th/t1-data2.csv", index_col='year')
print(df.head())
# solution
m = df.loc["2022년"].median()
print('중앙값:', m)
# 데이터프레임 df에서 "2022년" 행의 모든 열의 값이 m 보다 크면 True
print(df.loc["2022년", :] > m)
print(sum(df.loc["2022년", :] > m)) # Ture 건수 샘

# [3rd-type1-2] 3회 기출유형 작업형1-2
# Q. 결측치 데이터(행)을 제거하고, 앞에서부터 60% 데이터만 활용해, 'f1' 컬럼 3사분위 값을 구하시오
# 60%가 소수점일 경우 절사(예: 36.6 일때 36으로 계산)
# data: t1-data1.csv
df = pd.read_csv("./data/3th/t1-data1.csv")
df = df.dropna()
df = df.iloc[:int(len(df) * 0.6)]
print(df['f1'].quantile(.75))

# [3rd-type1-3] 3회 기출유형 작업형1-3
df = pd.read_csv("./data/3th/t1-data1.csv")
print(df.head())
# 풀이1
# 결측치가 제일 큰 값의 컬럼명을 구하시오
df = pd.DataFrame(df.isnull().sum(), columns=['cnt_null'])
df = df['cnt_null'].sort_values(ascending=False)
print(df.index[0])

# 풀이2
df = pd.read_csv("./data/3th/t1-data1.csv")
df = df.isnull().sum()
print(df.index[3])
