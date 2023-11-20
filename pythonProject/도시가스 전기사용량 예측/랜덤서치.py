
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
from sklearn.model_selection import RandomizedSearchCV
from scipy import stats

font_path = 'C:/Windows/Fonts/malgun.ttf'  # 사용할 한글 폰트 파일 경로를 지정합니다.
font_name = font_manager.FontProperties(fname=font_path).get_name()
rc('font', family=font_name)

# 데이터를 데이터프레임으로 읽어오기
data = pd.read_csv('2019~2021.csv', encoding='cp949')

data.info()
data.head()
data.dropna()
columns_to_drop = ['LOTNO_MNO','LOTNO_SNO','SUM_NRG_USQNT','ELRW_TOE_USQNT','CTY_GAS_TOE_USQNT','SUM_NRG_TOE_USQNT','ELRW_GRGS_DSAMT','CTY_GAS_GRGS_DSAMT','SUM_GRGS_DSAMT']
print(data.columns)

print(data)

# 이상치를 Z-score 기준으로 처리하는 함수 추가
def remove_outliers_iqr(df, columns, multiplier=1.5):
    for column in columns:
        q1 = df[column].quantile(0.25)
        q3 = df[column].quantile(0.75)
        iqr = q3 - q1
        lower_bound = q1 - multiplier * iqr
        upper_bound = q3 + multiplier * iqr
        df = df[(df[column] >= lower_bound) & (df[column] <= upper_bound)]
    return df

# 이상치 제거 적용
columns_to_remove_outliers = ['ELRW_USQNT']  # 이상치를 제거할 특성 선택
data = remove_outliers_iqr(data, columns_to_remove_outliers)

# 필요한 특성(features)과 타겟(target) 선택
features = ['LOTNO_ADDR', 'SGNG_CD', 'STDG_CD','STNDD_YR', 'USE_MM']
target = 'ELRW_USQNT'

value = data.value_counts()




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

# 랜덤 서치를 위한 하이퍼파라미터 분포 설정
param_dist = {
    'boosting_type': ['gbdt', 'dart'],
    'num_leaves': [31, 50, 100],
    'learning_rate': [0.01, 0.05, 0.1],
    'feature_fraction': [0.9, 1.0],
    'colsample_bytree': [0.8, 0.9, 1.0],
    'n_estimators': [100, 200, 500]
}

# 랜덤 서치
random_search = RandomizedSearchCV(lgb_model, param_distributions=param_dist, n_iter=10, cv=3, scoring='neg_mean_squared_error', refit=True)
random_search.fit(X, y)

# 최적 하이퍼파라미터 출력
print("Best Score (Random Search): ", random_search.best_score_)
print("Best Hyperparameters for LightGBM (Random Search):")
print(random_search.best_params_)

# 최적 모델 획득
best_params_random = random_search.best_params_
best_lgb_model_random = lgb.LGBMRegressor(**best_params_random)

# 랜덤 포레스트 모델
rf_model = RandomForestRegressor(n_estimators=100, random_state=42)

# 그라디언트 부스팅 모델
gb_model = GradientBoostingRegressor(n_estimators=100, random_state=42)

# 앙상블 모델 생성
ensemble_model = VotingRegressor(estimators=[('lgb', best_lgb_model_random), ('rf', rf_model), ('gb', gb_model)])


# 앙상블 모델 훈련
ensemble_model.fit(X, y)

# label encoder, scaler 및 ensemble 모델 저장
joblib.dump(label_encoders, '전기label_encoders.pk1')
joblib.dump(scaler, '전기scaler.pk1')
joblib.dump(ensemble_model, '전기ensemble_model.pk1')

# label encoder 로드
loaded_label_encoders = joblib.load('전기label_encoders.pk1')

# StandardScaler (scaler) 로드
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