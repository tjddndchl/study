"""
LinearRegression 클래스를 사용하여 분석한다.
선형회귀분석은 하나의 독립변수에 따른 종속변수의 관계를 분석할때 사용

"""
import pandas as pd
from sklearn.linear_model import  LinearRegression
from sklearn.model_selection import train_test_split
from sklearn.metrics import  mean_squared_error

df = pd.read_csv('Hitters.csv')
print(df.describe())

print(df.head(3))

print(df.info())

df = df.dropna()

print(df.info())

df = pd.get_dummies(df, drop_first=True)

x = df.drop('Salary', axis=1)
y = df['Salary']

train_x, test_x, train_y, test_y = \
    train_test_split(x, y, test_size=0.2)

md = LinearRegression()
md.fit(train_x, train_y)
print(md.feature_names_in_)

print(md.coef_)

print(md.intercept_)

pred = md.predict(test_x)

print(mean_squared_error(test_y, pred, squared=False))