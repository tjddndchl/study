"""
sklearn.ensemble 패키지의 Random-ForestClassifier 클래스이다.
RandomForestClassifier(n_estimators, criterion, max_depth)
n_estimators : 생성할 트리의 개수를 지정하는 피라미터
criterion : 트리의 분할을 기준을 선택하는 파라미터(기본값은 : gini)
gini : 지니 지수를 기준으로 분할
entropy : 엔트로피 지수를 기준으로 분할
max_depth : 트리의 최대 깊이를 제한하는 파라미터(기본값: None)
            트리의 깊이가 깊어질수록 모델의 복잡도가 증가하고
            과적합될 확률이 높아짐
"""

import pandas as pd
from sklearn.ensemble import RandomForestClassifier
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

x =df.drop('diabetes', axis=1)

y = df['diabetes']
y = LabelEncoder().fit_transform(y)

x_train, x_test, y_train, y_test =\
    train_test_split(x, y, test_size=0.2)

md = RandomForestClassifier(n_estimators=100, max_depth=2)
md.fit(x_train, y_train)

pred = md.predict(x_test)
print(pred)

cm = confusion_matrix(y_test, pred, labels=[1, 0])
print(cm)

print(accuracy_score(y_test, pred))

print(recall_score(y_test, pred))

print(precision_score(y_test, pred))

print(f1_score(y_test, pred))

print(roc_auc_score(y_test, pred))