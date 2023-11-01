"""
배깅 클래스
sklearn.ensemble 패키지의 BaggingClassifier 클래스
BaggingClassifier(base_estimator, max_samples, n_estimators)
base_estimator : 사용할 기본 분류기를 지정하는 파라미터이다.
amx_samples : 개별 분류기에 사용할 샘플의 수 또는 비율을 지정하는 파라미터(기본값 1.0)
n_estimators : 앙상블에 사용할 개별 분류기의 수를 지정하는 파라미터

"""

import pandas as pd
from sklearn.ensemble import BaggingClassifier
from sklearn.tree import DecisionTreeClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import confusion_matrix
from sklearn.metrics import accuracy_score
from sklearn.metrics import recall_score
from sklearn.metrics import precision_score
from sklearn.metrics import f1_score
from sklearn.metrics import roc_auc_score
from sklearn.preprocessing import LabelEncoder

df = pd.read_csv('../데이터 셋/PimaIndiansDiabetes2.csv')

print(df.describe())

print(df.head(3))

print(df.info())

df = df.dropna()

print(df.info())

x = df.drop('diabetes', axis=1)
y = df['diabetes']
y = LabelEncoder().fit_transform(y)

x_train, x_test, y_train,y_test = \
    train_test_split(x, y, test_size=0.2)

base_model = DecisionTreeClassifier(max_depth=2)

md = BaggingClassifier(base_model, n_estimators=100)

md.fit(x_train, y_train)

pred = md.predict(x_test)

cm = confusion_matrix(y_test, pred, labels=[1, 0])

print(cm)

print(accuracy_score(y_test, pred))

print(recall_score(y_test, pred))

print(precision_score(y_test, pred))

print(f1_score(y_test, pred))

print(roc_auc_score(y_test, pred))