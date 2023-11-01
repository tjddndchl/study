"""
의사결정나무는 데이터들이 가진속성들로부터 분할 기준 속성을 판별하고, 분할 기분속성에 따라 트리형태로 모델링하는 분류예측모델
"""

import pandas as pd
from sklearn.tree import DecisionTreeClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import confusion_matrix
from sklearn.metrics import accuracy_score
from sklearn.metrics import recall_score
from sklearn.metrics import precision_score
from sklearn.metrics import f1_score
from sklearn.metrics import roc_auc_score
from sklearn.preprocessing import LabelEncoder

df = pd.read_csv("../데이터 셋/PimaIndiansDiabetes2.csv")

print(df.describe())

print(df.head(3))

print(df.info())

df = df.dropna()

print(df.info())


x = df.drop('diabetes', axis=1)

y = df['diabetes']

y = LabelEncoder().fit_transform(y)

x_train, x_test, y_train, y_test = \
    train_test_split(x, y, test_size=0.2)

md = DecisionTreeClassifier(max_depth=2)

md.fit(x_train, y_train)

predict = md.predict(x_test)

cm = confusion_matrix(y_test, predict, labels=[1, 0])
print(cm)

print(accuracy_score(y_test, predict))

print(recall_score(y_test, predict))

print(precision_score(y_test, predict))

print(f1_score(y_test, predict))

print(roc_auc_score(y_test, predict))