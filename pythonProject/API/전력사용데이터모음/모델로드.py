import joblib
import pandas as pd
import datetime

# preprocess_x 함수 정의 (이 부분은 생성된 모델 파일과 동일하게 가져와야 함)

def to_datetime(s):
    """
    Args:
        s: ex) '20220601 01'
    Returns:
        weekday: 0~6(int), 0: 월요일, 1: 화요일, ...
    """
    s = s.split()[0]  # 20220601
    date = datetime.datetime.strptime(s, '%Y%m%d')
    weekday = date.weekday()  #
    return weekday
def preprocess_x(df):
    to_remove_columns = ['num_date_time', '일시', '일조(hr)', '일사(MJ/m2)', '전력소비량(kWh)']
    df = df.fillna(0)
    # 시계열 특성을 학습에 반영하기 위해 일시를 월, 일, 시간으로 나눕니다
    df['month'] = df['일시'].apply(lambda x: int(x[4:6]))
    df['day'] = df['일시'].apply(lambda x: int(x[6:8]))
    df['time'] = df['일시'].apply(lambda x: int(x[9:11]))
    df['Weekday'] = df['일시'].apply(to_datetime)  # 이 부분을 추가해요
    building = pd.read_csv('전력사용데이터건물/building_info.csv', encoding='cp949')
    df = df.merge(building.iloc[:, :4])
    df['건물유형'] = df['건물유형'].astype('category').cat.codes
    for c in to_remove_columns:
        if c in df.columns:
            df = df.drop(columns=[c])
    return df

# 모델 로드
loaded_models = {}
for i in range(1, 101):
    loaded_models[i] = joblib.load(f'model_building_{i}.joblib')

# 테스트 데이터 로드 (예시로 파일 경로는 'test.csv'로 가정)
test_data = pd.read_csv('전력사용데이터건물/test.csv', encoding='cp949')
test_x = preprocess_x(test_data)

# 각 건물별로 모델을 사용하여 예측
for i in range(1, 101):
    _x = test_x[test_x['건물번호'] == i]
    _x = _x.drop(columns=['건물번호', '건물유형', '연면적(m2)', '냉방면적(m2)'])

    # 테스트 데이터의 컬럼을 모델이 학습할 때 사용한 순서와 일치하도록 재배열
    _x = _x[loaded_models[i].booster_.feature_name()]

    pred = loaded_models[i].predict(_x).tolist()
    print(f'건물 {i}의 예측 전력소비량: {pred}')