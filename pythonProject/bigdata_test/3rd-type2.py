# 여행 보험 패키지 상품을 구매할 확률 값을 구하시오
# 예측할 값(y): TravelInsurance (여행보험 패지지를 구매 했는지 여부 0:구매안함, 1:구매)
# 평가: roc-auc 평가지표
# data: t2-1-train.csv, t2-1-test.csv
# 제출 형식

# 라이브러리 불러오기
import pandas as pd
# 데이터 불러오기
train = pd.read_csv("./data/3th/t2-1-train.csv")
test = pd.read_csv("./data/3th/t2-1-test.csv")
print(train.shape, train.shape)
print(train.head())
# type 확인
print(train.info())
# 카테고리 수 확인
print(train.describe(include="object"))
# Employment Type 컬럼 카테고리
print(train['Employment Type'].value_counts())
# Employment Type 컬럼 카테고리
print(test['Employment Type'].value_counts())
# 수치형 통계 값
print(train.describe(exclude="object"))
# 수치형 통계 값
print(test.describe(exclude="object"))
# 결측치 확인
print(train.isnull().sum())
# 결측치 확인
print(test.isnull().sum())
# target
print(train['TravelInsurance'].value_counts())
# 결측치 처리
train['AnnualIncome'] = train['AnnualIncome'].fillna(train['AnnualIncome'].mean())
test['AnnualIncome'] = test['AnnualIncome'].fillna(test['AnnualIncome'].mean())

# target값 변수에 옮기기
target = train.pop('TravelInsurance')
print(target, type(target))

# 데이터 합치기
df = pd.concat([train, test])
print(df.shape)

# 레이블 인코딩
from sklearn.preprocessing import LabelEncoder

cols = df.select_dtypes(include="object").columns
le = LabelEncoder()

for col in cols:
    df[col] = le.fit_transform(df[col])

# train test 다시 분리
train = df[:train.shape[0]].copy()
test = df[train.shape[0]:].copy()

# 스케일
from sklearn.preprocessing import MinMaxScaler
scaler = MinMaxScaler()

train['AnnualIncome'] = scaler.fit_transform(train[['AnnualIncome']])
test['AnnualIncome'] = scaler.transform(test[['AnnualIncome']])

# 검증 데이터 분리
from sklearn.model_selection import train_test_split
X_train, X_val, y_train, y_val = train_test_split(train, target, test_size=0.2, random_state=2022)
print(X_train.shape, X_val.shape, y_train.shape, y_val.shape)

# 의사결정나무
from sklearn.tree import DecisionTreeClassifier
model = DecisionTreeClassifier(random_state=2022)
model.fit(X_train, y_train)
pred = model.predict_proba(X_val)
# 평가
from sklearn.metrics import roc_auc_score
print(roc_auc_score(y_val, pred[:,1]))

# 랜덤포레스트
from sklearn.ensemble import RandomForestClassifier
model = RandomForestClassifier(random_state=2022)
model.fit(X_train, y_train)
pred = model.predict_proba(X_val)
print(roc_auc_score(y_val, pred[:,1]))

# xgboost
import xgboost as xgb
model = xgb.XGBRFClassifier(random_state=2022)
model.fit(X_train, y_train)
pred = model.predict_proba(X_val)
print(roc_auc_score(y_val, pred[:,1]))

# test 데이터 예측
model = RandomForestClassifier(random_state=2022)
model.fit(X_train, y_train)
pred = model.predict_proba(test)

# 예측한 데이터 -> 데이터프레임으로
submit = pd.DataFrame()
submit['id'] = test['id']
submit['TravelInsurance'] = pred[:, 1]

# 예측한 데이터 확인
print(submit.head())

# csv 저장
submit.to_csv("2022.csv", index=False)
# csv 확인
t = pd.read_csv("2022.csv")
print(t)
# 만약 sample_submission이 주어진다면
sample_submission = pd.read_csv("./data/3th/t2-1-sample_submission.csv")
sample_submission['TravelInsurance'] = pred[:,1]
sample_submission.to_csv("2022.csv", index=False)