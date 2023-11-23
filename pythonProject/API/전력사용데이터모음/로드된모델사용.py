import joblib
import pandas as pd

# 모델 및 Scaler 로드
loaded_scaler = joblib.load('scaler.pk1')
loaded_model = joblib.load('ensemble_model.pk1')
loaded_label_encoders = joblib.load('label_encoders.pk1')

# 필요한 특성(features) 및 label_encoders 설정 (모델을 학습한 원래 코드에서 가져옵니다)
features = ['year', 'month', 'metro', 'city']
label_encoders = loaded_label_encoders  # 필요한 경우 label_encoders도 복원

# 새로운 입력 데이터 설정
year = 2020
month = 8
metro = '경상남도'
city = '창원시 마산합포구'


# 새로운 입력 데이터를 2D 배열로 변환
new_input_data = [[year, month, metro, city]]
new_input_data_df = pd.DataFrame(new_input_data, columns=features)

# 범주형 특성 변환 (새로운 입력 데이터에 대해서도 수행)
for i, feature in enumerate(features):
    if feature in label_encoders:
        new_input_data_df[feature] = label_encoders[feature].transform([new_input_data[0][i]])

# 새로운 입력 데이터를 Scaler를 사용하여 변환
new_input_data_np = loaded_scaler.transform(new_input_data_df)

# 모델을 사용하여 예측
new_prediction = loaded_model.predict(new_input_data_np)
print(f'예측된 전력 사용량: {new_prediction[0]}')