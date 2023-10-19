import numpy as np
import pandas as pd

from sklearn.model_selection import train_test_split
wine = pd.read_csv('https://bit.ly/wine_csv_data')
data = wine[['alcohol', 'sugar', 'pH']].to_numpy()
target = wine['class'].to_numpy()
train_input, test_input, train_target, test_target = train_test_split(
    data, target, test_size=0.2, random_state=42
)

from sklearn.model_selection import cross_validate
from sklearn.ensemble import RandomForestClassifier
rf = RandomForestClassifier(n_jobs=-1, random_state=42)
scores = cross_validate(rf, train_input, train_target,
                        return_train_score=True, n_jobs=-1)
print(np.mean(scores['train_score']), np.mean(scores['test_score']))

rf.fit(train_input, train_target)
#랜덤포레스트 는 특성의 일부를 랜덤하게 선택하여 결정 트리를 훈련함, 하나의 특성에 과도하게 집중하지 않아 과대적합을 줄이고
#일반화 성능을 높이는데 도움이됨
print(rf.feature_importances_)

rf = RandomForestClassifier(oob_score=True, n_jobs=-1, random_state=42)
rf.fit(train_input, train_target)
print(rf.oob_score_)

from sklearn.ensemble import ExtraTreesClassifier
et = ExtraTreesClassifier(n_jobs=-1, random_state=42)
scores= cross_validate(et, train_input, train_target,
                       return_train_score=True, n_jobs=-1)
print(np.mean(scores['train_score']), np.mean(scores['test_score']))

et.fit(train_input, train_target)
print(et.feature_importances_)

from sklearn.ensemble import GradientBoostingClassifier
gb = GradientBoostingClassifier(random_state=42)
scores = cross_validate(gb, train_input, train_target,
                        return_train_score=True, n_jobs=-1)
print(np.mean(scores['train_score']), np.mean(scores['test_score']))

# n_estimators=결정 트리 ㄱ개수, learning_rate=학습률 설정안할시 기본값 0.1
gb = GradientBoostingClassifier(random_state=42, n_estimators=500, learning_rate=0.2)

scores = cross_validate(gb, train_input, train_target,
                        return_train_score=True, n_jobs=-1)
print(np.mean(scores['train_score']), np.mean(scores['test_score']))

gb.fit(train_input, train_target)
print(gb.feature_importances_)

#히스토그램 기반 그레디언트 부스팅
#from sklearn.experimental import enable_hist_gradient_boosting 안써도됨
from sklearn.ensemble import HistGradientBoostingClassifier, HistGradientBoostingRegressor
hgb = HistGradientBoostingClassifier(random_state=42)

scores = cross_validate(hgb, train_input, train_target,
                        return_train_score=True)

print(np.mean(scores['train_score']), np.mean(scores['test_score']))

from sklearn.inspection import permutation_importance

hgb.fit(train_input, train_target)
result = permutation_importance(hgb, train_input, train_target,
                                n_repeats=10, random_state=42, n_jobs=-1)

print(result.importances_mean)

result = permutation_importance(hgb, test_input, test_target,
                                n_repeats=10, random_state=42, n_jobs=-1)

print(result.importances_mean)

print(hgb.score(test_input, test_target))

#그레이디언트 부스팅
from xgboost import XGBClassifier
xgb = XGBClassifier(tree_method = 'hist', random_state = 42)

scores = cross_validate(xgb, train_input, train_target,
                        return_train_score=True)

print(np.mean(scores['train_score']), np.mean(scores['test_score']))


#LightGBM사용
from lightgbm import LGBMClassifier
lgb = LGBMClassifier(random_state=42)
scores = cross_validate(lgb, train_input, train_target,
                        return_train_score=True, n_jobs=-1)
print(np.mean(scores['train_score']), np.mean(scores['test_score']))


