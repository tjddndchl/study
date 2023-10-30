#결측값을 삭제하면 결측값이 너무 많은 특정 컬럼만 삭제할 수도 있으며, 결측값이 존재하는 모든 행을 삭제할수도 있다.
#drop(labels, axis=axis), dropna(axis, how)
import pandas as pd

airquality = pd.read_csv('data/airquality.csv')
airquality = airquality.dropna(axis=0)
print(airquality.isna().sum(axis=0))

airquality = airquality.dropna(axis=1)
print(airquality.isna().sum(axis=1))
