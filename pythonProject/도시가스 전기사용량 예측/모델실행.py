import pandas as pd
from sklearn.preprocessing import LabelEncoder, StandardScaler
from sklearn.ensemble import VotingRegressor
import lightgbm as lgb
import joblib

# 필요한 특성(features)과 타겟(target) 선택
features = ['LOTNO_ADDR', 'SGNG_CD', 'STDG_CD', 'STNDD_YR', 'USE_MM']
target = 'ELRW_USQNT'

# Label Encoder 로드
loaded_label_encoders = joblib.load('전기label_encoders.pk1')

# Standard Scaler 로드
loaded_scaler = joblib.load('전기scaler.pk1')

# Ensemble 모델 로드
loaded_ensemble_model = joblib.load('전기ensemble_model.pk1')


# 사용자 입력을 받아 전력 사용량 예측
LOTNO_ADDR = '대전광역시 동구 삼성동 459번지'
SGNG_CD = 30110
STDG_CD = 11800
STNDD_YR = 2019
USE_MM = 1

# 범주형 특성 변환
input_data = pd.DataFrame({'LOTNO_ADDR': [LOTNO_ADDR], 'SGNG_CD': [SGNG_CD], 'STDG_CD': [STDG_CD], 'STNDD_YR': [STNDD_YR], 'USE_MM': [USE_MM]})
for feature in features:
    if feature in loaded_label_encoders:
        input_data[feature] = loaded_label_encoders[feature].transform(input_data[feature])

# input_data를 DataFrame으로 변환
input_data_df = pd.DataFrame(input_data, columns=features)

# input_data_df를 2D 배열로 변환한 후 예측
new_input_data_np = loaded_scaler.transform(input_data_df)
prediction = loaded_ensemble_model.predict(new_input_data_np)
print(f'전기 예측량: {prediction[0]}')