from sklearn.ensemble import RandomForestRegressor, GradientBoostingRegressor
from sklearn.ensemble import VotingRegressor
from sklearn.preprocessing import LabelEncoder, StandardScaler
from sklearn.metrics import r2_score, mean_squared_error, mean_absolute_error, mean_absolute_percentage_error
import numpy as np
import matplotlib.pyplot as plt
from sklearn.model_selection import learning_curve
from matplotlib import font_manager, rc
import joblib
import pandas as pd
import lightgbm as lgb
from sklearn.model_selection import GridSearchCV
import seaborn as sns

font_path = 'C:/Windows/Fonts/malgun.ttf'  # 사용할 한글 폰트 파일 경로를 지정합니다.
font_name = font_manager.FontProperties(fname=font_path).get_name()
rc('font', family=font_name)

# 데이터를 데이터프레임으로 읽어오기
data = pd.read_csv('2019~2021.csv', encoding='cp949')

# 10번째 열부터 마지막 열까지 삭제
df = data.iloc[:, :9]

# 수정된 DataFrame 출력
print(df)


print(df.info())
print(df.describe())


# 필요한 열만 남기기
df = df[['SGNG_CD', 'ELRW_USQNT', 'CTY_GAS_USQNT']]

# 전기 사용량에 대한 박스플롯
plt.figure(figsize=(12, 8))
sns.boxplot(x='SGNG_CD', y='ELRW_USQNT', data=df, width=0.8, palette='Set3')
plt.title('전기 사용량 박스플롯 - 시군구코드별')
plt.xlabel('시군구코드')
plt.ylabel('전기 사용량')

# Y축 눈금을 전기 사용량의 실제 값으로 변경
plt.ticklabel_format(style='plain', axis='y')  # 지수 표기법 해제

plt.show()

# 가스 사용량에 대한 박스플롯
plt.figure(figsize=(12, 8))
sns.boxplot(x='SGNG_CD', y='CTY_GAS_USQNT', data=df, width=0.8, palette='Set3')
plt.title('가스 사용량 박스플롯 - 시군구코드별')
plt.xlabel('시군구코드')
plt.ylabel('가스 사용량')
plt.ticklabel_format(style='plain', axis='y')  # 지수 표기법 해제

plt.show()

# 이상치를 제거하기 위한 함수 정의
def remove_outliers(column):
    Q1 = column.quantile(0.25)
    Q3 = column.quantile(0.75)
    IQR = Q3 - Q1
    lower_bound = Q1 - 1.5 * IQR
    upper_bound = Q3 + 1.5 * IQR
    return column[(column >= lower_bound) & (column <= upper_bound)]

# 이상치 제거 적용
df['ELRW_USQNT'] = remove_outliers(df['ELRW_USQNT'])
df['CTY_GAS_USQNT'] = remove_outliers(df['CTY_GAS_USQNT'])

# 전기 사용량에 대한 박스플롯
plt.figure(figsize=(12, 8))
sns.boxplot(x='SGNG_CD', y='ELRW_USQNT', data=df, width=0.8, palette='Set3')
plt.title('전기 사용량 박스플롯 - 시군구코드별 (이상치 제거)')
plt.xlabel('시군구코드')
plt.ylabel('전기 사용량')

plt.ticklabel_format(style='plain', axis='y')  # 지수 표기법 해제
plt.show()

# 가스 사용량에 대한 박스플롯
plt.figure(figsize=(12, 8))
sns.boxplot(x='SGNG_CD', y='CTY_GAS_USQNT', data=df, width=0.8, palette='Set3')
plt.title('가스 사용량 박스플롯 - 시군구코드별 (이상치 제거)')
plt.xlabel('시군구코드')
plt.ylabel('가스 사용량')

plt.ticklabel_format(style='plain', axis='y')  # 지수 표기법 해제
plt.show()

print(df.info())
print(df.describe())

