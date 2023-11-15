import pandas as pd
import lightgbm as lgb
from sklearn.model_selection import GridSearchCV
from sklearn.ensemble import RandomForestRegressor, GradientBoostingRegressor
from sklearn.ensemble import VotingRegressor
from sklearn.preprocessing import LabelEncoder, StandardScaler
from sklearn.metrics import r2_score, mean_squared_error, mean_absolute_error, mean_absolute_percentage_error
import numpy as np
import matplotlib.pyplot as plt
from sklearn.model_selection import learning_curve
from matplotlib import font_manager, rc
import joblib

font_path = 'C:/Windows/Fonts/malgun.ttf'  # 사용할 한글 폰트 파일 경로를 지정합니다.
font_name = font_manager.FontProperties(fname=font_path).get_name()
rc('font', family=font_name)

# 데이터를 데이터프레임으로 읽어오기
data = pd.read_excel('../전력사용데이터.xlsx')

data.info()
data.head()
data.dropna()
value = data.value_counts()

# 필요한 특성(features)과 타겟(target) 선택
features = ['year', 'month', 'metro', 'city']
target = 'powerUsage'

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
lgb_model = lgb.LGBMRegressor()

# 그리드 탐색을 위한 하이퍼파라미터 그리드 설정
param_grid = {
    'boosting_type': ['gbdt', 'dart'],
    'num_leaves': [31, 50, 100],
    'learning_rate': [0.01, 0.05, 0.1],
    'feature_fraction': [0.9, 1.0],
    'n_estimators': [100, 200, 500]
}

# 그리드 탐색
grid_search = GridSearchCV(lgb_model, param_grid, cv=3, scoring='neg_mean_squared_error', refit=True)
grid_search.fit(X, y)

# 최적 하이퍼파라미터 출력
print("Best Hyperparameters for LightGBM:")
print(grid_search.best_params_)

# 최적 모델 획득
best_params = grid_search.best_params_
best_lgb_model = lgb.LGBMRegressor(**best_params)

# 랜덤 포레스트 모델
rf_model = RandomForestRegressor(n_estimators=100, random_state=42)

# 그라디언트 부스팅 모델
gb_model = GradientBoostingRegressor(n_estimators=100, random_state=42)

# 앙상블 모델 생성
ensemble_model = VotingRegressor(estimators=[('lgb', best_lgb_model), ('rf', rf_model), ('gb', gb_model)])

# 앙상블 모델 훈련
ensemble_model.fit(X, y)

# label encoder, scaler 및 ensemble 모델 저장
joblib.dump(label_encoders, 'label_encoders.pk1')
joblib.dump(scaler, 'scaler.pk1')
joblib.dump(ensemble_model, 'ensemble_model.pk1')

# label encoder 로드
loaded_label_encoders = joblib.load('label_encoders.pk1')

# StandardScaler (scaler) 로드
loaded_scaler = joblib.load('scaler.pk1')

# Ensemble 모델 로드
loaded_ensemble_model = joblib.load('ensemble_model.pk1')

# 사용자 입력을 받아 전력 사용량 예측
year = 2023
month = 8
metro = '서울특별시'
city = '강남구'

input_data = [[year, month, metro, city]]

# 범주형 특성 변환
for i, feature in enumerate(features):
    if feature in loaded_label_encoders:
        input_data[0][i] = loaded_label_encoders[feature].transform([input_data[0][i]])

# input_data를 DataFrame으로 변환
input_data_df = pd.DataFrame(input_data, columns=features)

# input_data_df를 2D 배열로 변환한 후 예측
new_input_data_np = loaded_scaler.transform(input_data_df)
prediction = loaded_ensemble_model.predict(new_input_data_np)
print(f'예측된 전력 사용량: {prediction[0]}')

# 모델의 성능 평가
y_pred = loaded_ensemble_model.predict(X)

# 산점도(Scatter Plot) 그리기
plt.scatter(y, y_pred, color='blue', alpha=0.5)
plt.plot([y.min(), y.max()], [y.min(), y.max()], 'k--', lw=2)
plt.xlabel('실제 값')
plt.ylabel('예측 값')
plt.title('실제 값 vs. 예측 값')
plt.show()

# R-squared (R^2) Score
r2 = r2_score(y, y_pred)
print(f'R-squared: {r2}')

# Mean Absolute Error (MAE)
mae = mean_absolute_error(y, y_pred)
print(f'Mean Absolute Error: {mae}')

# Mean Squared Error (MSE)
mse = mean_squared_error(y, y_pred)
print(f'Mean Squared Error: {mse}')

# Mean Absolute Percentage Error (MAPE)
mape = mean_absolute_percentage_error(y, y_pred) * 100  # MAPE를 백분율로 표시
print(f'Mean Absolute Percentage Error: {mape:.2f}%')

# Adjusted R-squared (Adjusted R^2)
n = X.shape[0]  # 샘플 수
p = X.shape[1]  # 독립 변수 수
adjusted_r2 = 1 - (1 - r2) * (n - 1) / (n - p - 1)
print(f'Adjusted R-squared: {adjusted_r2}')

# Mean Bias Deviation (MBD)
mbd = np.mean(y - y_pred)
print(f'Mean Bias Deviation: {mbd}')

