import pandas as pd

df = pd.read_csv('dataset/diabetes.csv')

print(df.info())

df = df.iloc[:, [2, 3, 4, 7]]

df = df.dropna()

print(df.describe())

print(df.corr(method='pearson'))

print(df.corr(method='spearman'))

print(df.corr(method='kendall'))