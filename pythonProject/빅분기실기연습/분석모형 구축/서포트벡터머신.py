"""
서포트벡터머신을 수행할수있는 클래스는 sklearn.svm 패키지의 SVC 클래스이다.
"""

import pandas as pd
from sklearn.svm import SVC
from sklearn.metrics import confusion_matrix
from sklearn.metrics import accuracy_score
from sklearn.metrics import recall_score
from sklearn.metrics import precision_score
from sklearn.metrics import f1_score
from sklearn.metrics import roc_auc_score
from sklearn.preprocessing import LabelEncoder
from sklearn.model_selection import train_test_split

df = pd.read_csv('../데이터 셋/PimaIndiansDiabetes2.csv')

print(df.describe())

print(df.head(3))

print(df.info())

df =df.dropna()

print(df.info())

x =df.drop('diabetes', axis=1)
y = df['diabetes']

y = LabelEncoder().fit_transform(y)

x_train, x_test, y_train, y_test = \
    train_test_split(x, y, test_size=0.2)

md =SVC(kernel= 'linear')

md.fit(x_train, y_train)

predict = md.predict(x_test)

cm = confusion_matrix(y_test, predict, labels=[1, 0])

print(cm)

print(accuracy_score(y_test, predict))

print(recall_score(y_test, predict))

print(precision_score(y_test, predict))

print(f1_score(y_test, predict))

print(roc_auc_score(y_test, predict))