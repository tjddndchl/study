import pandas as pd
import lightgbm as lgb
from sklearn.model_selection import GridSearchCV
from sklearn.preprocessing import LabelEncoder, StandardScaler
import numpy as np
from sklearn.metrics import r2_score
from sklearn.metrics import mean_squared_error
import matplotlib.pyplot as plt
from sklearn.model_selection import learning_curve


# 데이터를 데이터프레임으로 읽어오기
data = pd.read_excel('전력사용데이터_2013_2023.xlsx')  # '전력사용데이터_2013_2023.xlsx'에 데이터 파일 경로를 입력하세요.

# 필요한 특성(features)과 타겟(target) 선택
features = ['year', 'month', 'metro', 'city']
target = 'powerUsage'  # 전력 사용량을 예측하려면 'powerUsage'를 사용합니다. 전기 요금을 예측하려면 'bill'을 사용합니다.

X = data[features]
y = data[target]

# 범주형 데이터를 인코딩
label_encoders = {}
for feature in features:
    if data[feature].dtype == 'object':
        label_encoders[feature] = LabelEncoder()
        X[feature] = label_encoders[feature].fit_transform(X[feature])

# 데이터를 학습 데이터로 사용
scaler = StandardScaler()
X = scaler.fit_transform(X)

# LightGBM 모델
model = lgb.LGBMRegressor()

# 그리드 탐색을 위한 하이퍼파라미터 그리드 설정
param_grid = {
    'boosting_type': ['gbdt', 'dart'],
    'num_leaves': [31, 50, 100],
    'learning_rate': [0.01, 0.05, 0.1],
    'feature_fraction': [0.9, 1.0],
    'n_estimators': [100, 200, 500]
}

# 그리드 탐색
grid_search = GridSearchCV(model, param_grid, cv=3, scoring='neg_mean_squared_error')
grid_search.fit(X, y)

# 최적 하이퍼파라미터 출력
print("Best Hyperparameters:")
print(grid_search.best_params_)

# 최적 모델 획득
best_model = grid_search.best_estimator_

# 사용자 입력을 받아 전력 사용량 예측
year = 2023
month = 10
metro = '서울특별시'
city = '강남구'

input_data = [[year, month, metro, city]]

# 범주형 특성 변환
for i, feature in enumerate(features):
    if feature in label_encoders:
        input_data[0][i] = label_encoders[feature].transform([input_data[0][i]])

# input_data를 DataFrame으로 변환
input_data_df = pd.DataFrame(input_data, columns=features)

# input_data_df를 2D 배열로 변환한 후 예측
input_data_np = scaler.transform(input_data_df)
prediction = best_model.predict(input_data_np)
print(f'예측된 전력 사용량: {prediction[0]}')

# 모델의 R-squared 계산
y_pred = best_model.predict(X)
r2 = r2_score(y, y_pred)
print(f'R-squared: {r2}')

y_pred = best_model.predict(X)  # 예측값 얻기
mse = mean_squared_error(y, y_pred)  # MSE 계산
print(f'Mean Squared Error: {mse}')

plt.scatter(y, y_pred)
plt.xlabel('실제 값')
plt.ylabel('예측 값')
plt.title('실제 값 vs. 예측 값')
plt.show()


train_sizes, train_scores, test_scores = learning_curve(best_model, X, y, cv=3)
train_scores_mean = np.mean(train_scores, axis=1)
test_scores_mean = np.mean(test_scores, axis=1)

plt.plot(train_sizes, train_scores_mean, label='Training score')
plt.plot(train_sizes, test_scores_mean, label='Cross-validation score')
plt.xlabel('Training Examples')
plt.ylabel('Score')
plt.legend(loc='best')
plt.title('Learning Curve')
plt.show()