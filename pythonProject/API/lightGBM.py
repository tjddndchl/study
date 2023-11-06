import pandas as pd
import lightgbm as lgb
from sklearn.model_selection import train_test_split, GridSearchCV
from sklearn.metrics import mean_squared_error
from sklearn.preprocessing import LabelEncoder

# 데이터를 데이터프레임으로 읽어오기
data = pd.read_excel('전력사용데이터_2013_2023.xlsx')  # 'your_data.xlsx'에 데이터 파일 경로를 입력하세요.

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

# 데이터를 학습 데이터와 테스트 데이터로 나누기
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# LightGBM 데이터셋 생성
train_data = lgb.Dataset(X_train, label=y_train)
test_data = lgb.Dataset(X_test, label=y_test, reference=train_data)

# 그리드 탐색을 위한 하이퍼파라미터 그리드 설정
param_grid = {
    'boosting_type': ['gbdt', 'dart'],
    'num_leaves': [31, 50, 100],
    'learning_rate': [0.01, 0.05, 0.1],
    'feature_fraction': [0.9, 1.0],
    'num_round': [100, 200, 500]
}

# LightGBM 모델
model = lgb.LGBMRegressor()

# 그리드 탐색
grid_search = GridSearchCV(model, param_grid, cv=3, scoring='neg_mean_squared_error')
grid_search.fit(X_train, y_train)

# 최적 하이퍼파라미터 출력
print("Best Hyperparameters:")
print(grid_search.best_params_)

# 최적 모델 획득
best_model = grid_search.best_estimator_

# 모델 평가
y_pred = best_model.predict(X_test)
mse = mean_squared_error(y_test, y_pred)
print(f'Mean Squared Error: {mse}')