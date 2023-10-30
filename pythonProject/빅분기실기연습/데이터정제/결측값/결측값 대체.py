import pandas as pd

airquality = pd.read_csv('data/airquality.csv')
a = airquality['Ozone'].std()

print(a)

airquality['Ozone'] = \
    airquality['Ozone'].fillna(airquality['Ozone'].mean())

b = airquality['Ozone'].std()
print(b)
print(a - b)