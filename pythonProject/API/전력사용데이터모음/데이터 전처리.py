import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.preprocessing import LabelEncoder, StandardScaler
import numpy as np
from matplotlib import font_manager, rc

# 데이터 불러오기
data = pd.read_excel('전력사용데이터.xlsx')
font_path = 'C:/Windows/Fonts/malgun.ttf'  # 사용할 한글 폰트 파일 경로를 지정합니다.
font_name = font_manager.FontProperties(fname=font_path).get_name()
rc('font', family=font_name)

# 결측치 제거 전 기초 통계량 조회
statistics_before = data.describe()

# 결측치 제거
data = data.dropna()

print(data.info())

# 범주형 데이터를 인코딩
label_encoders = {}
categorical_features = ['metro', 'city']

for feature in categorical_features:
    if data[feature].dtype == 'object':
        label_encoders[feature] = LabelEncoder()
        data[feature] = label_encoders[feature].fit_transform(data[feature])

# 특성과 타겟 선택
features = ['year', 'month', 'metro', 'city', 'powerUsage']
target = 'powerUsage'

X = data[features]
y = data[target]

# 데이터 표준화
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X.drop(columns=[target]))  # 'powerUsage' 제외한 특성만 표준화

# 이상치 제거 전 데이터 갯수와 기초 통계량 조회
statistics_before_outliers = data.describe()

# 이상치 제거 (IQR을 이용한 방법)
Q1 = data[features].quantile(0.25)
Q3 = data[features].quantile(0.75)
IQR = Q3 - Q1
outliers = ~((data[features] < (Q1 - 1.5 * IQR)) | (data[features] > (Q3 + 1.5 * IQR))).any(axis=1)

cleaned_data = data[outliers]

# 박스플롯 그리기 (이상치 처리 전)
plt.figure(figsize=(12, 8))
sns.boxplot(x='metro', y='powerUsage', data=data)
plt.title('Boxplot of Power Usage by Region (Before Removing Outliers)')
plt.xticks(rotation=45)  # x 축 라벨 회전
plt.show()

# 기초 통계량 조회
statistics_after_outliers = cleaned_data.describe()

# 범주형 데이터 디코딩
decoded_data = cleaned_data.copy()
for feature, encoder in label_encoders.items():
    decoded_data[feature] = encoder.inverse_transform(decoded_data[feature])

# 이상치 제거 후 데이터 갯수 및 기초 통계량 출력
print("\nTotal Number of Data Points After Removing Outliers:", len(cleaned_data))
print("Basic Statistics After Removing Outliers:")
print(statistics_after_outliers)

# 박스플롯 그리기 (이상치 처리 후)
plt.figure(figsize=(12, 8))
sns.boxplot(x='metro', y='powerUsage', data=decoded_data)
plt.title('Boxplot of Power Usage by Region (After Removing Outliers)')
plt.xticks(rotation=45)  # x 축 라벨 회전
plt.show()

# 데이터 표준화 후 이상치 제거 전 데이터 갯수 및 기초 통계량 조회
print("\nTotal Number of Data Points After Standardization and Before Removing Outliers:", len(data))
print("Basic Statistics After Standardization and Before Removing Outliers:")
print(statistics_before_outliers)

# 데이터 타입 출력
print("\nData Types:")
print(cleaned_data.dtypes)

# 각 열의 결측치 개수 출력
print("\nMissing Values Count:")
print(cleaned_data.isnull().sum())