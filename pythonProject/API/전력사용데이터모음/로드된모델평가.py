import joblib
import pandas as pd
import numpy as np
from sklearn.metrics import r2_score, mean_squared_error, mean_absolute_error

# 모델 및 Scaler 로드
loaded_scaler = joblib.load('scaler.pk1')
loaded_model = joblib.load('ensemble_model.pk1')
loaded_label_encoders = joblib.load('label_encoders.pk1')

# 필요한 특성(features) 및 label_encoders 설정 (모델을 학습한 원래 코드에서 가져옵니다)
features = ['year', 'month', 'metro', 'city']
label_encoders = loaded_label_encoders

# 테스트 데이터 설정 (실제 전력 사용량 데이터 사용)
test_data = pd.DataFrame({
    'year': [2022,2022,2022,2022,2022,2022,2022],  # 예시로 2023년 데이터 사용
    'month': [1,1,1,1,1,1,1],  # 예시로 10월 데이터 사용
    'metro': ['서울특별시','서울특별시','서울특별시','서울특별시','서울특별시','서울특별시','서울특별시'],
    'city': ['성동구','성북구','동작구','영등포구','관악구','동대문구','서대문구']
})

# 범주형 특성 변환 (테스트 데이터에 대해서도 수행)
for feature in features:
    if feature in label_encoders:
        test_data[feature] = label_encoders[feature].transform(test_data[feature])

# 테스트 데이터를 Scaler를 사용하여 정규화
test_data_np = loaded_scaler.transform(test_data)

# 모델을 사용하여 예측
test_predictions = loaded_model.predict(test_data_np)

# 실제 타겟 값 (실제 전력 사용량 데이터) - 예를 들어, 실제 데이터 값을 여기에 넣어주세요
actual_target = [247.53, 233.35,213.16,225.24,190.35,219.61,233.18]  # 예를 들어, [239.8] 또는 [실제 데이터]와 같이 실제 데이터 값으로 대체해주세요

# 범주형 특성 역 변환
for feature in features:
    if feature in label_encoders:
        test_data[feature] = label_encoders[feature].inverse_transform(test_data[feature])

# 모델 평가
r2 = r2_score(actual_target, test_predictions)
mse = mean_squared_error(actual_target, test_predictions)
mae = mean_absolute_error(actual_target, test_predictions)

print(f'R-squared (R²): {r2}')
print(f'Mean Squared Error (MSE): {mse}')
print(f'Mean Absolute Error (MAE): {mae}')