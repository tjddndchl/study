"""
인공신경망을 수행할수 있는 클래스는 sklearn.neural_network 패키지의
MLPClassifier 클래스이다.
MLPClassifier(n_estimators, base_estimator, max_sample, max_feature, random_state)
hidden_layer_size : 은닉층의 구조를 지정하는 파라미터

activation : 활성화 함수를 지정하는 파라미터(기본값 : relus)

solver : 가중치 최적화에 사용할 알고리즘을 지정하는 파라미터

max_iter : 최대 반복 횟수를 지정하는 파라미터(기본값 200)

random_state : 랜덤 시드 값으로, 결과의 재현성을 위해 사용하는 파라미터
"""

import pandas as pd
from sklearn.neural_network import MLPClassifier

from sklearn.model_selection import train_test_split
from sklearn.metrics import confusion_matrix
from sklearn.metrics import accuracy_score
from sklearn.metrics import recall_score
from sklearn.metrics import precision_score
from sklearn.metrics import f1_score
from sklearn.metrics import roc_auc_score
from sklearn.preprocessing import LabelEncoder

df =pd.read_csv("../데이터 셋/PimaIndiansDiabetes2.csv")

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

md = MLPClassifier(hidden_layer_sizes=(64, 32), \
                   activation='relu', max_iter=1000)

md.fit(x_train, y_train)

predict = md.predict(x_test)

cm =confusion_matrix(y_test, predict, labels=[1, 0])

print(cm)

print(accuracy_score(y_test, predict))

print(recall_score(y_test, predict))

print(precision_score(y_test, predict))

print(f1_score(y_test, predict))

print(roc_auc_score(y_test, predict))

