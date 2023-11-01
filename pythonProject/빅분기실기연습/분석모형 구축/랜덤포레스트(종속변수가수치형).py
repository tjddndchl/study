import pandas as pd
from sklearn.ensemble import RandomForestRegressor
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error
from sklearn.preprocessing import LabelEncoder

df = pd.read_csv('../데이터 셋/PimaIndiansDiabetes2.csv')

print(df.describe())

print(df.head(3))

print(df.info())

df = df.dropna()

print(df.info())

df['diabetes'] = LabelEncoder().fit_transform(df['diabetes'])

x = df.drop('pressure', axis=1)
y = df['pressure']

x_train, x_test, y_train, y_test =\
    train_test_split(x, y, test_size=0.2)

md = RandomForestRegressor(n_estimators=100, max_depth=2)
md.fit(x_train, y_train)

pred =  md.predict(x_test)
print(pred)

print(mean_squared_error(y_test, pred, squared=False))