#결측값이 존재하면 삭제하지 않고 평균, 중위수 등으로 대체할수있다.
import pandas as pd

airquality = pd.read_csv('data/airquality.csv')
df = airquality
print(df.head())
print(pd.isna(airquality['Ozone']).value_counts())

airquality['Ozone'] = \
    airquality['Ozone'].fillna(airquality['Ozone'].mean())
print(pd.isna(airquality['Ozone']).value_counts())