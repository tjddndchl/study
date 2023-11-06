import pandas as pd
import lightgbm as lgb
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestRegressor, GradientBoostingRegressor, StackingRegressor
from sklearn.svm import SVR
from sklearn.preprocessing import LabelEncoder, StandardScaler
from sklearn.metrics import r2_score, mean_squared_error
import numpy as np
import matplotlib.pyplot as plt
from sklearn.model_selection import learning_curve
import tkinter as tk
from tkinter import font

root = tk.Tk()
helv36 = font.nametofont("TkDefaultFont")
helv36.configure(family="Helvetica", size=36)

# 데이터를 데이터프레임으로 읽어오기
data = pd.read_excel('전력사용데이터_2013_2023.xlsx')

# 필요한 특성(features)과 타겟(target) 선택
features = ['year', 'month', 'metro', 'city']
target = 'powerUsage'

X = data[features]
y = data[target]

# 범주형 데이터를 인코딩
label_encoders = {}
for feature in features:
    if X[feature].dtype == 'object':
        label_encoders[feature] = LabelEncoder()
        X[feature] = label_encoders[feature].fit_transform(X[feature])

# 데이터를 학습 데이터로 사용
scaler = StandardScaler()
X = scaler.fit_transform(X)

# 데이터를 훈련 세트와 테스트 세트로 나누기
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# LightGBM 모델
lgb_model = lgb.LGBMRegressor()
lgb_model.fit(X_train, y_train)
y_pred_lgb = lgb_model.predict(X_test)
r2_lgb = r2_score(y_test, y_pred_lgb)
mse_lgb = mean_squared_error(y_test, y_pred_lgb)
print(f'LightGBM R-squared: {r2_lgb}')
print(f'LightGBM Mean Squared Error: {mse_lgb}')

# 랜덤 포레스트 모델
rf_model = RandomForestRegressor(n_estimators=100, random_state=42)
rf_model.fit(X_train, y_train)
y_pred_rf = rf_model.predict(X_test)
r2_rf = r2_score(y_test, y_pred_rf)
mse_rf = mean_squared_error(y_test, y_pred_rf)
print(f'RandomForest R-squared: {r2_rf}')
print(f'RandomForest Mean Squared Error: {mse_rf}')

# 그라디언트 부스팅 모델
gb_model = GradientBoostingRegressor(n_estimators=100, random_state=42)
gb_model.fit(X_train, y_train)
y_pred_gb = gb_model.predict(X_test)
r2_gb = r2_score(y_test, y_pred_gb)
mse_gb = mean_squared_error(y_test, y_pred_gb)
print(f'GradientBoosting R-squared: {r2_gb}')
print(f'GradientBoosting Mean Squared Error: {mse_gb}')

# 서포트 벡터 머신 모델
svm_model = SVR()
svm_model.fit(X_train, y_train)
y_pred_svm = svm_model.predict(X_test)
r2_svm = r2_score(y_test, y_pred_svm)
mse_svm = mean_squared_error(y_test, y_pred_svm)
print(f'SVR R-squared: {r2_svm}')
print(f'SVR Mean Squared Error: {mse_svm}')

# 스태킹 모델 구성
estimators = [
    ('lgb', lgb_model),
    ('rf', rf_model),
    ('gb', gb_model),
    ('svm', svm_model)
]

stacking_model = StackingRegressor(estimators=estimators, final_estimator=lgb_model)

# 스태킹 모델 훈련
stacking_model.fit(X_train, y_train)

# 스태킹 모델 평가
y_pred_stacking = stacking_model.predict(X_test)
r2_stacking = r2_score(y_test, y_pred_stacking)
mse_stacking = mean_squared_error(y_test, y_pred_stacking)
print(f'Stacking R-squared: {r2_stacking}')
print(f'Stacking Mean Squared Error: {mse_stacking}')

plt.scatter(y_test, y_pred_stacking)
plt.xlabel('실제 값')
plt.ylabel('예측 값')
plt.title('실제 값 vs. Stacking 모델 예측 값')
plt.show()