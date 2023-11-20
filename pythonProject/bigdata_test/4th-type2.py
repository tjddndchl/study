# Q. [마케팅] 자동차 시장 세분화
# 자동차 회사는 새로운 전략을 수립하기 위해 4개의 시장으로 세분화했습니다.
# 기존 고객 분류 자료를 바탕으로 신규 고객이 어떤 분류에 속할지 예측해주세요!
# 예측할 값(y): "Segmentation" (1,2,3,4)
# 평가: Macro f1-score
# data: train.csv, test.csv
# 제출 형식:
# ID,Segmentation
# 458989,1
# 458994,2
# 459000,3
# 459003,4
# 답안 제출 참고
# 아래 코드 예측변수와 수험번호를 개인별로 변경하여 활용
# pd.DataFrame({'ID': test.ID, 'Segmentation': pred}).to_csv('003000000.csv', index=False)
# 라이브러리 불러오기
import pandas as pd
# 데이터 불러오기
train = pd.read_csv("./data/4th/train.csv")
test = pd.read_csv("./data/4th/test.csv")
# 데이터 크기 확인
print(train.shape, test.shape)
# train 샘플 확인
print(train.head())
# test 샘플 확인
print(test.head())
# target 확인
print(train['Segmentation'].value_counts())
# 결측치 확인(train)
print(train.isnull().sum())
# 결측치 확인(test)
print(test.isnull().sum())
# type 확인
print(train.info())
# target(y, label) 값 복사
target = train.pop('Segmentation')
print(target)
# test데이터 ID 복사
test_ID = test.pop('ID')
# 수치형 컬럼(train)
# ['ID', 'Age', 'Work_Experience', 'Family_Size', 'Segmentation']
num_cols = ['Age', 'Work_Experience', 'Family_Size']
train = train[num_cols]
print(train.head(2))
# 수치형 컬럼(test)
test = test[num_cols]
print(test.head(2))
# 모델 선택 및 학습
from sklearn.ensemble import RandomForestClassifier
rf = RandomForestClassifier(random_state=0)
rf.fit(train, target)
pred = rf.predict(test)
print(pred)
submit = pd.DataFrame({
    'ID': test_ID,
    'Segmentation': pred
})
print(submit)
# 체크
# submit.to_csv("submission.csv", index=False)
# Score: 0.30477
# 데이터 불러오기
train = pd.read_csv("./data/4th/train.csv")
test = pd.read_csv("./data/4th/test.csv")
# 범주형 변수
print(train.head())
print(train.select_dtypes(include='object').columns)
cat_cols = ['Gender', 'Ever_Married', 'Graduated', 'Profession', 'Spending_Score','Var_1']
## label encoding
## Series.astype('category').cat.codes
train['Gender'] = train['Gender'].astype('category').cat.codes
train['Ever_Married'] = train['Ever_Married'].astype('category').cat.codes
train['Graduated'] = train['Graduated'].astype('category').cat.codes
train['Profession'] = train['Profession'].astype('category').cat.codes
train['Spending_Score'] = train['Spending_Score'].astype('category').cat.codes
train['Var_1'] = train['Var_1'].astype('category').cat.codes
print(train.head())
## cat.codes의 label 인코딩은 ABC 순대로 되는 것을 확인할 수 있다
print(test['Profession'].astype('category').cat.categories)
## label encoding
test['Gender'] = test['Gender'].astype('category').cat.codes
test['Ever_Married'] = test['Ever_Married'].astype('category').cat.codes
test['Graduated'] = test['Graduated'].astype('category').cat.codes
test['Profession'] = test['Profession'].astype('category').cat.codes
test['Spending_Score'] = test['Spending_Score'].astype('category').cat.codes
test['Var_1'] = test['Var_1'].astype('category').cat.codes
print(test.head())

# ID, target 처리
target = train.pop('Segmentation')
train = train.drop("ID", axis=1)
test_ID = test.pop('ID')

# 모델 선택
# 하이퍼파라미터 튜닝: max_depth, n_estimators
from sklearn.ensemble import RandomForestClassifier
rf = RandomForestClassifier(random_state=0, max_depth=7, n_estimators=1000)

# 교차 검증
from sklearn.model_selection import cross_val_score
scores = cross_val_score(rf, train, target, scoring='f1_macro', cv=5)
print(scores)
print(scores.mean())
# 학습
rf.fit(train, target)
pred = rf.predict(test)
print(pred)
# 예측 결과 -> 데이터 프레임
# pd.DataFrame({'cust_id': X_test.cust_id, 'gender': pred}).to_csv('003000000.csv', index=False)

submit = pd.DataFrame({
    'ID': test_ID,
    'Segmentation': pred
})
submit.to_csv("submission.csv", index=False)