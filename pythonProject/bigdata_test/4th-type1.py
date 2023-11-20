# 4회 기출 유형
# 작업형1 유형
# 작업형1 문제
# 1-1. age 컬럼의 3사분위수와 1사분위수의 차를 절대값으로 구하고, 소수점 버려서, 정수로 출력
import pandas as pd
df = pd.read_csv("./data/basic1.csv")
# print("1사분위: ",df['age'].quantile(0.25))
# print("3사분위: ",df['age'].quantile(0.75))

result = abs(df['age'].quantile(0.25) - df['age'].quantile(0.75))
# print("절대값 차이: ",result)

print(int(result))
# 1-2.(loves반응+wows반응)/(reactions반응) 비율이 0.4보다 크고 0.5보다 작으면서, status_type=='video'인 데이터의 갯수
import pandas as pd
df = pd.read_csv("./data/4th/fb.csv")
cond1 = (df['loves'] + df['wows'])/ df['reactions'] > 0.4
cond2 = (df['loves'] + df['wows'])/ df['reactions'] < 0.5
cond3 = df['type'] == 'video'

print(len(df[cond1 & cond2 & cond3]))
# 1-3. date_added가 2018년 1월 이면서 country가 United Kingdom 단독 제작인 데이터의 갯수
# 풀이 1
df = pd.read_csv("./data/4th/nf.csv")

cond1 = df['country'] == "United Kingdom"

df['date_added'] = pd.to_datetime(df['date_added'])
df['year'] = df['date_added'].dt.year
df['month'] = df['date_added'].dt.month


cond2 = df['year'] == 2018
cond3 = df['month'] == 1

print(len(df[cond1 & cond2 & cond3]))

# 풀이 2
cond1 = df['country'] == "United Kingdom"

df['date_added'] = pd.to_datetime(df['date_added'])

cond2 = df['date_added'] >= '2018-1-1'
cond3 = df['date_added'] <= '2018-1-31'

print(len(df[cond1 & cond2 & cond3]))

# 풀이 3
cond1 = df['country'] == "United Kingdom"
df['date_added'] = pd.to_datetime(df['date_added'])
cond2 = df['date_added'].between('2018-1-1', '2018-1-31')
print(len(df[cond1 & cond2]))

# 풀이 4
# cond1 = df['country'] == "United Kingdom"
#
# df['date_added'] = df['date_added'].fillna("")
#
# str1 = "2018"
# str2 = "January"
# cond2 = df['date_added'].str.contains(str1)
# cond3 = df['date_added'].str.contains(str2)
#
# print(len(df[cond1 & cond2 & cond3]))