#info 함수 : 데이터 프레임의 간략한 요약 정보를 제공하는 함수이다.
import pandas as pd

airauality = pd.read_csv("data/airquality.csv")
print(airauality.info())

print(airauality.isna().sum(axis=1))

print(airauality.isna().sum(axis=1).sum())

print(airauality.isna().sum(axis=0))

print(airauality.shape[0] - airauality.dropna().shape[0])