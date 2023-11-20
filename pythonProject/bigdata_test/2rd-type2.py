# 제품 배송 시간에 맞춰 배송되었는지 예측모델 만들기¶
# 학습용 데이터 (X_train, y_train)을 이용하여 배송 예측 모형을 만든 후,
# 이를 평가용 데이터(X_test)에 적용하여 얻은 예측 확률값을 다음과 같은 형식의 CSV파일로 생성하시오(제출한 모델의 성능은 ROC-AUC 평가지표에 따라 채점)

# 시험환경 세팅 (코드 변경 X)
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split

def exam_data_load(df, target, id_name="", null_name=""):
    if id_name == "":
        df = df.reset_index().rename(columns={"index": "id"})
        id_name = 'id'
    else:
        id_name = id_name

    if null_name != "":
        df[df == null_name] = np.nan

    X_train, X_test = train_test_split(df, test_size=0.2, random_state=2021)

    y_train = X_train[[id_name, target]]
    X_train = X_train.drop(columns=[target])


    y_test = X_test[[id_name, target]]
    X_test = X_test.drop(columns=[target])
    return X_train, X_test, y_train, y_test

df = pd.read_csv("./data/Train.csv")
X_train, X_test, y_train, y_test = exam_data_load(df, target='Reached.on.Time_Y.N', id_name='ID')

print(X_train.shape, X_test.shape, y_train.shape, y_test.shape)
# 레이블(타겟) 확인
print(y_train['Reached.on.Time_Y.N'].value_counts())
# X_train 결측치 확인
print(X_train.isnull().sum())
# X_test 결측치 확인
print(X_test.isnull().sum())
# 데이터 타입 확인
print(X_train.info())
# object 타입 컬럼, 고유값 개수 확인
print(X_train[['Warehouse_block', 'Mode_of_Shipment', 'Product_importance', 'Gender']].nunique())

# object 컬럼 삭제 (또는 라벨인코딩, 원핫인코딩)
X_train = X_train.drop(['Warehouse_block', 'Mode_of_Shipment', 'Product_importance', 'Gender'], axis=1)
X_test = X_test.drop(['Warehouse_block', 'Mode_of_Shipment', 'Product_importance', 'Gender'], axis=1)
print(X_train)


from sklearn.linear_model import LogisticRegression
from sklearn.neighbors import KNeighborsClassifier
from sklearn.tree import DecisionTreeClassifier
from sklearn.ensemble import RandomForestClassifier
from xgboost import XGBClassifier
X_train_id = X_train.pop('ID')
X_test_id = X_test.pop('ID')

from sklearn.model_selection import train_test_split
X_tr,X_val,y_tr,y_val = train_test_split(X_train, y_train['Reached.on.Time_Y.N'], test_size=0.2, random_state=2021)

from sklearn.metrics import roc_auc_score
model = LogisticRegression()
model.fit(X_tr, y_tr)
pp = model.predict(X_val)
pred = model.predict_proba(X_val)
print(pp)
print(roc_auc_score(y_val, pp))
print(roc_auc_score(y_val, pred[:,1]))

model = KNeighborsClassifier()
model.fit(X_tr, y_tr)
pred = model.predict_proba(X_val)
print(roc_auc_score(y_val, pred[:,1]))

model = DecisionTreeClassifier()
model.fit(X_tr, y_tr)
pred = model.predict_proba(X_val)
print(roc_auc_score(y_val, pred[:,1]))

model = RandomForestClassifier()
model.fit(X_tr, y_tr)
pred = model.predict_proba(X_val)
print(roc_auc_score(y_val, pred[:,1]))

model = XGBClassifier(eval_metric='mlogloss', use_label_encoder=False)
model.fit(X_tr, y_tr)
pred = model.predict_proba(X_val)
print(roc_auc_score(y_val, pred[:,1]))

model = KNeighborsClassifier()
model.fit(X_train, y_train['Reached.on.Time_Y.N'])
pred = model.predict_proba(X_test)
print(pred)

submission = pd.DataFrame({
    "ID": X_test_id,
    "Reached.on.Time_Y.N": pred[:,1]
})

print(submission.head())
submission.to_csv('submission.csv', index=False)  ## 수험번호.csv