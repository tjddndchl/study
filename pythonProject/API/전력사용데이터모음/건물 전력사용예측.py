import random
import pandas as pd
import numpy as np
import os
from tqdm import tqdm
import lightgbm as lgb
import joblib

#Fixed Random-Seed
def seed_everything(seed):
    random.seed(seed)
    os.environ['PYTHONHASHSEED'] = str(seed)
    np.random.seed(seed)

seed_everything(42) # Seed 고정

#데이터 로드
train_origin = pd.read_csv('전력사용데이터건물/train.csv', encoding='cp949')
test_origin = pd.read_csv('전력사용데이터건물/test.csv', encoding='cp949')

building = pd.read_csv('전력사용데이터건물/building_info.csv', encoding='cp949')

#Train Data Pre-Processing
#train 데이터를 20220820 기준으로 train/validation으로 분리해 사용하였습니다.
#validation 데이터의 score를 높이는 방향으로 모델을 search한 후 전체 train 데이터를 사용해 모델을 학습하고, test 데이터를 기반으로 예측해 최종 score를 제출하였습니다.

def train_test_split(df, th):
    train = df[df['일시'].str[:8].astype(int) < th].reset_index(drop=True)
    test = df[df['일시'].str[:8].astype(int) >= th].reset_index(drop=True)
    return train, test

def preprocess_x(df):
    to_remove_columns = ['num_date_time', '일시', '일조(hr)', '일사(MJ/m2)', '전력소비량(kWh)']
    df = df.fillna(0)
    #시계열 특성을 학습에 반영하기 위해 일시를 월, 일, 시간으로 나눕니다
    df['month'] = df['일시'].apply(lambda x : int(x[4:6]))
    df['day'] = df['일시'].apply(lambda x : int(x[6:8]))
    df['time'] = df['일시'].apply(lambda x : int(x[9:11]))
    df = df.merge(building.iloc[:, :4])
    df['건물유형'] = df['건물유형'].astype('category').cat.codes
    for c in to_remove_columns:
        if c in df.columns:
            df = df.drop(columns=[c])
    return df

date_th = 20220820

train_df, valid_df = train_test_split(train_origin, date_th)
train_x = preprocess_x(train_df)
train_y = train_df['전력소비량(kWh)']

valid_x = preprocess_x(valid_df)
valid_y = valid_df['전력소비량(kWh)']

print(train_x.head())

print(train_y.head())

def SMAPE(y, pred):
    smape = abs((y - pred))/((abs(y) + abs(pred)) / 2) * 100
    smape = np.mean(smape)
    return smape

#LGBM 모델링 하이퍼파라미터 튜닝 안함
def mae(y, pred):
    return np.mean(abs(y-pred))


def validate(valid_x, valid_y, model):
    pred = model.predict(valid_x)
    smape_score, mae_score = SMAPE(valid_y, pred), mae(valid_y, pred)
    return smape_score, mae_score

#Base Model
#주어진 데이터만을 사용해서 전체 학습데이터를 학습시켜 만든 모델입니다.
#validation score(SMAPE 기준)은 17.266입니다.

model_lgb1 = lgb.LGBMRegressor(objective='regression', verbose=-1)
model_lgb1.fit(train_x, train_y)





smape_score, mae_score = validate(valid_x, valid_y, model_lgb1)
print(f'SMAPE: {smape_score}\nMAE: {mae_score}')

#1-1. hyper parameter 조절
#n_estimators 값(학습을 얼마나 반복하냐이며 overfitting과 관련이 있음)을 조절해서 score가 어떻게 변화하는지 확인해봅시다.(default 값은 100)
print(f'SMAPE: {smape_score}\nMAE: {mae_score}')

model_lgb2 = lgb.LGBMRegressor(objective='regression', n_estimators=50, verbose=-1)
model_lgb2.fit(train_x, train_y)


smape_score, mae_score = validate(valid_x, valid_y, model_lgb2)
print(f'SMAPE: {smape_score}\nMAE: {mae_score}')

model_lgb3 = lgb.LGBMRegressor(objective='regression', n_estimators=300, verbose=-1)
model_lgb3.fit(train_x, train_y)





smape_score, mae_score = validate(valid_x, valid_y, model_lgb3)
print(f'SMAPE: {smape_score}\nMAE: {mae_score}')


model_lgb4 = lgb.LGBMRegressor(objective='regression', n_estimators=500, verbose=-1)
model_lgb4.fit(train_x, train_y)

#2. Multi Models by building num
#건물번호(1~100)별 모델을 각각 만들어 성능을 측정하였습니다.
#건물별로 building_info값은 같기 때문에 해당 데이터는 제외했습니다(건물번호, 건물유형, 연면적, 냉방면적).

def validate_multi(valid_x, valid_y, models):
    """
    Args:
        models: dict, {1: model1, 2: model2, ..., 100: model100}
    """
    preds = []
    for i in range(1, 101):
        _x = valid_x[valid_x['건물번호'] == i]
        _x = _x.drop(columns=['건물번호', '건물유형', '연면적(m2)', '냉방면적(m2)'])
        pred = models[i].predict(_x).tolist()
        preds.extend(pred)
    preds = np.array(preds)
    smape_score, mae_score = SMAPE(valid_y, preds), mae(valid_y, preds)
    return smape_score, mae_score

def train_multiple_models(train_x, train_y, n_estimators=100):
    models = {}
    for i in tqdm(range(1, 101)):
        _x = train_x[train_x['건물번호'] == i]
        _x = _x.drop(columns=['건물번호', '건물유형', '연면적(m2)', '냉방면적(m2)'])
        _y = train_y[_x.index]
        model_lgb = lgb.LGBMRegressor(objective='regression', n_estimators=n_estimators, verbose=-1)
        model_lgb.fit(_x, _y)
        models[i] = model_lgb
    return models

models1 = train_multiple_models(train_x, train_y)

smape_score, mae_score = validate_multi(valid_x, valid_y, models1)
print(f'SMAPE: {smape_score}\nMAE: {mae_score}')

#2-1 hyper parameter 조절
#건물별 모델을 따로 만드는게 성능이 약간 더 좋았고(15.798 -> 13.13), multiple models의 경우 n_estimators를 작게 하는게 오히려 성능이 좋았습니다.
#아마 모델별 데이터의 양이 작아져서 학습횟수를 크게하는게 과적합을 야기하는 것으로 생각됩니다.

models2 = train_multiple_models(train_x, train_y, 50)

smape_score, mae_score = validate_multi(valid_x, valid_y, models2)
print(f'SMAPE: {smape_score}\nMAE: {mae_score}')

models3 = train_multiple_models(train_x, train_y, 300)

smape_score, mae_score = validate_multi(valid_x, valid_y, models3)
print(f'SMAPE: {smape_score}\nMAE: {mae_score}')

#3. Add Features
#A. Weekday

import datetime

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

train_origin_ = train_origin.copy()

train_origin_['Weekday'] = train_origin_.apply(lambda x:to_datetime(x['일시']), axis=1)

train_origin_.sample(5, random_state=42)

# train, valid데이터 재생성
train_df, valid_df = train_test_split(train_origin_, 20220820)

train_x = preprocess_x(train_df)
train_y = train_df['전력소비량(kWh)']

valid_x = preprocess_x(valid_df)
valid_y = valid_df['전력소비량(kWh)']


models_f1 = train_multiple_models(train_x, train_y)

smape_score, mae_score = validate_multi(valid_x, valid_y, models_f1)
print(f'SMAPE: {smape_score}\nMAE: {mae_score}')


#A-1 hyper paramter 조절
#weekday 데이터를 추가하니 validation SMAPE score가 13.13 -> 5.97 까지 하락하였습니다.
#참고로 해당 모델(validation score=5.976...)로 만든 submission을 dacon에 제출하였을때가 best score였으며, score는 6.768이었습니다.


models_f2 = train_multiple_models(train_x, train_y, 50)

smape_score, mae_score = validate_multi(valid_x, valid_y, models_f2)
print(f'SMAPE: {smape_score}\nMAE: {mae_score}')

models_f3 = train_multiple_models(train_x, train_y, 300)

smape_score, mae_score = validate_multi(valid_x, valid_y, models_f3)
print(f'SMAPE: {smape_score}\nMAE: {mae_score}')

#B. 전날과의 기온, 풍속 차이
#전 날과의 기온과 풍속, 습도의 차이값을 feature에 추가해보았습니다.
#weekday는 그대로 사용하였습니다(train_origin_)

train_origin_b = train_origin_.copy()


for i in range(1, 101):
    df = train_origin_b[train_origin_b['건물번호'] == i]
    train_origin_b.loc[df.index, '기온_gap'] = df['기온(C)'] - df.shift(1)['기온(C)']
    train_origin_b.loc[df.index, '풍속_gap'] = df['풍속(m/s)'] - df.shift(1)['풍속(m/s)']
    train_origin_b.loc[df.index, '습도_gap'] = df['습도(%)'] - df.shift(1)['습도(%)']

print(train_origin_b.head())

train_origin_b['기온_gap'] = train_origin_b['기온_gap'].fillna(0)
train_origin_b['풍속_gap'] = train_origin_b['풍속_gap'].fillna(0)
train_origin_b['습도_gap'] = train_origin_b['습도_gap'].fillna(0)


train_df, valid_df = train_test_split(train_origin_b, 20220820)

train_x = preprocess_x(train_df)
train_y = train_df['전력소비량(kWh)']

valid_x = preprocess_x(valid_df)
valid_y = valid_df['전력소비량(kWh)']

print(train_x.head())

models_b1 = train_multiple_models(train_x, train_y)

smape_score, mae_score = validate_multi(valid_x, valid_y, models_b1)
print(f'SMAPE: {smape_score}\nMAE: {mae_score}')

#B-1 hyper paramter 조절
#그냥 weekday와 추가한 모델과 결과에서 큰 차이는 없었습니다.

models_b2 = train_multiple_models(train_x, train_y, 50)

smape_score, mae_score = validate_multi(valid_x, valid_y, models_b2)
print(f'SMAPE: {smape_score}\nMAE: {mae_score}')

models_b3 = train_multiple_models(train_x, train_y, 30)

smape_score, mae_score = validate_multi(valid_x, valid_y, models_b3)
print(f'SMAPE: {smape_score}\nMAE: {mae_score}')


#C. 1주일 전 전력소모값
#test 데이터의 가장 마지막 날짜(8월31일)과 train 데이터의 가장 마지막 날짜(8월24일)의 gap이 7일이므로, test 데이터의 경우 과거 7일전 이상의 전력소모값은 접근할 수 있습니다.
#B에서 생성한 feature는 사용하지않고, weekday(train_origin_)만 사용하였습니다.

train_origin_c = train_origin_.copy()

n = 7*24 # 7*24시간 전 전력소모량
for i in range(1, 101):
    df = train_origin_c[train_origin_c['건물번호'] == i]
    train_origin_c.loc[df.index, f'{n}시간 전 전력소비량'] = df.shift(n)['전력소비량(kWh)']


train_df, valid_df = train_test_split(train_origin_c, 20220820)

train_x = preprocess_x(train_df)
train_y = train_df['전력소비량(kWh)']

valid_x = preprocess_x(valid_df)
valid_y = valid_df['전력소비량(kWh)']

train_x = train_x[train_x['168시간 전 전력소비량'] != 0]  # NaN이 0으로 replace되어 0이 아닌 row들 삭제
train_y = train_y[train_x.index]

print(train_x.head())

models_c1 = train_multiple_models(train_x, train_y)


smape_score, mae_score = validate_multi(valid_x, valid_y, models_c1)
print(f'SMAPE: {smape_score}\nMAE: {mae_score}')

models_c2 = train_multiple_models(train_x, train_y, 50)

smape_score, mae_score = validate_multi(valid_x, valid_y, models_c2)
print(f'SMAPE: {smape_score}\nMAE: {mae_score}')

models_c3 = train_multiple_models(train_x, train_y, 300)

smape_score, mae_score = validate_multi(valid_x, valid_y, models_c3)
print(f'SMAPE: {smape_score}\nMAE: {mae_score}')

#D. 7일전 24시간동안의 전력소모량
#8일전~7일전(191시간전~168시간전) 데이터를 feature로 추가해 사용해보았습니다.
#위와 마찬가지로 weekday만 있는 모델에서 feature를 추가하였습니다.

train_origin_d = train_origin_.copy()

for i in range(1, 101):
    df = train_origin_d[train_origin_d['건물번호'] == i]
    fr, to = 7*24, 7*24+24
    for n in range(fr, to):
        train_origin_d.loc[df.index, f'{n}시간 전 전력소비량'] = df.shift(n)['전력소비량(kWh)']

train_df, valid_df = train_test_split(train_origin_d, 20220820)

train_x = preprocess_x(train_df)
train_y = train_df['전력소비량(kWh)']

valid_x = preprocess_x(valid_df)
valid_y = valid_df['전력소비량(kWh)']

train_x.head()

train_x = train_x[train_x['191시간 전 전력소비량'] != 0]  # NaN이 0으로 replace되어 0이 아닌 row들 삭제
train_y = train_y[train_x.index]

models_d1 = train_multiple_models(train_x, train_y)


smape_score, mae_score = validate_multi(valid_x, valid_y, models_d1)
print(f'SMAPE: {smape_score}\nMAE: {mae_score}')

models_d2 = train_multiple_models(train_x, train_y, 50)

smape_score, mae_score = validate_multi(valid_x, valid_y, models_d2)
print(f'SMAPE: {smape_score}\nMAE: {mae_score}')


models_d3 = train_multiple_models(train_x, train_y, 300)

smape_score, mae_score = validate_multi(valid_x, valid_y, models_d3)
print(f'SMAPE: {smape_score}\nMAE: {mae_score}')



#Make Submission
#전체 학습 데이터셋을 이용해 모델 생성
#3-A(multiple models, add weekday)모델을 사용하였습니다.

submission = pd.read_csv('전력사용데이터건물/sample_submission.csv')
submission

train_origin['Weekday'] = train_origin.apply(lambda x:to_datetime(x['일시']), axis=1)
test_origin['Weekday'] = test_origin.apply(lambda x:to_datetime(x['일시']), axis=1)
train_x_full = preprocess_x(train_origin)
train_y_full = train_origin['전력소비량(kWh)']

models = train_multiple_models(train_x_full, train_y_full)

test_x_real = preprocess_x(test_origin)

preds_real = []
for i in tqdm(range(1, 101)):
    _x = test_x_real[test_x_real['건물번호'] == i]
    _x = _x.drop(columns=['건물번호', '건물유형', '연면적(m2)', '냉방면적(m2)'])
    pred = models[i].predict(_x).tolist()
    preds_real.extend(pred)

submission['answer'] = preds_real

print(submission.head())

'''
결론
건물별 100개의 모델을 따로 생성하고, weekday를 추가한 모델이 가장 좋은 성능을 보였습니다.
validation score는 5.976, 실제 submission score는 6.76.
두 값의 차이가 나는 이유는 best valiation score를 찾는 과정에서 약간의 overfitting이 발생하기도 했고, submssion에 사용하는 test 데이터의 설명변수(X)값들은 실제 값이 아닌 예측치라는 점도 영향을 미친것 같습니다.
TODO
추가적인 feature를 고려해보았는데, 마땅히 떠오르는 아이디어가 없어서 모델의 hyper parameter 튜닝을 중점적으로 진행할 것 같습니다.
그리고 valid_y와 preds를 비교해 성능이 잘 안나오는 모델의 건물번호, 시간대 등을 분석해 모델을 보완해나가는게 필요할 것 같습니다.

'''

# 모델 저장
for i, model in models.items():
    joblib.dump(model, f'model_building_{i}.joblib')

# 모델 로드
loaded_models = {}
for i in tqdm(range(1, 101)):
    loaded_models[i] = joblib.load(f'model_building_{i}.joblib')

# 예측
preds_real = []
for i in tqdm(range(1, 101)):
    _x = test_x_real[test_x_real['건물번호'] == i]
    _x = _x.drop(columns=['건물번호', '건물유형', '연면적(m2)', '냉방면적(m2)'])
    pred = loaded_models[i].predict(_x).tolist()
    preds_real.extend(pred)

# 결과 업데이트
submission['answer'] = preds_real

# 결과 저장
submission.to_csv('final_submission.csv', index=False)
























