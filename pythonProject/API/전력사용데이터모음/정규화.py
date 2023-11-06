import pandas as pd
from sklearn.ensemble import RandomForestRegressor
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error
from sklearn.preprocessing import StandardScaler
import numpy as np
from sklearn.metrics import r2_score



# 엑셀 파일에서 데이터 불러오기
df = pd.read_excel('../전력사용데이터_2022.xlsx')  # 'your_data.xlsx'를 실제 파일 경로로 변경

dfn = df.dropna()

# 데이터 전처리
# 필요한 특성 선택
features = ['temperature', 'humidity', 'precipitation', 'houseCnt']
X = dfn[features]
y = dfn['powerUsage']

# 데이터 분할 (학습 데이터와 테스트 데이터로 분리)
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# 데이터 정규화 (StandardScaler 사용)
scaler = StandardScaler()
X_train = scaler.fit_transform(X_train)
X_test = scaler.transform(X_test)

# 랜덤 포레스트 모델 생성
model = RandomForestRegressor(n_estimators=100, random_state=42)  # 100개의 의사 결정 나무로 이루어진 모델

# 모델 훈련
model.fit(X_train, y_train)

# 테스트 데이터를 사용하여 전력 사용량 예측
y_pred = model.predict(X_test)

# 모델 성능 평가 (평균 제곱 오차)
mse = mean_squared_error(y_test, y_pred)
rmse = np.sqrt(mse)
print("평균 제곱 오차 (MSE):", mse)
print("평균 제곱근 오차 (RMSE):", rmse)

# 모델을 사용하여 월별 전력 사용량 예측 (새로운 데이터도 정규화 필요)
new_data = pd.DataFrame({'temperature': [-2.2], 'humidity': [55], 'precipitation': [5.5], 'houseCnt': 10000})
new_data = scaler.transform(new_data)
predicted_power_usage = model.predict(new_data)
print("예측 전력 사용량:", predicted_power_usage[0])

r2 = r2_score(y_test, y_pred)
print("R 제곱 (R-squared):", r2)