
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

font_path = 'C:/Windows/Fonts/malgun.ttf'
font_name = font_manager.FontProperties(fname=font_path).get_name()
rc('font', family=font_name)

# 데이터를 데이터프레임으로 읽어오기
data = pd.read_csv("temp1_daejun.csv", encoding='cp949')

data.info()
data.head()

# 결측치 처리
data.dropna(inplace=True)

columns_to_drop = ['SGNG_CD', 'STDG_CD', 'LOTNO_MNO', 'LOTNO_SNO', 'SUM_NRG_USQNT','ELRW_TOE_USQNT','CTY_GAS_TOE_USQNT','SUM_NRG_TOE_USQNT','ELRW_GRGS_DSAMT','CTY_GAS_GRGS_DSAMT','SUM_GRGS_DSAMT']
print(data.columns)


# 필요한 특성(features)과 타겟(target) 선택
features = ['LOTNO_ADDR', 'STNDD_YR', 'USE_MM']
target = 'ELRW_USQNT', 'CTY_GAS_USQNT'

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
grid_search = GridSearchCV(lgb_model, param_grid, cv=3, scoring='neg_mean_squared_error', refit=False)
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
