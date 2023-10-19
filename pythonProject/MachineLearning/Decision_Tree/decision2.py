import pandas as pd
wine = pd.read_csv('https://bit.ly/wine_csv_data')

data = wine[['alcohol', 'sugar', 'pH']].to_numpy()
target = wine['class'].to_numpy()

from sklearn.model_selection import train_test_split
train_input, test_input, train_target, test_target = train_test_split(
    data, target, test_size=0.2, random_state=42
)
print(train_input.shape, test_input.shape)

sub_input, val_input, sub_target, val_target = train_test_split(
    train_input, train_target, test_size=0.2, random_state=42
)

print(sub_input.shape, val_input.shape)

from sklearn.tree import DecisionTreeClassifier
dt = DecisionTreeClassifier(random_state=42)
dt.fit(sub_input, sub_target)
print(dt.score(sub_input, sub_target))
print(dt.score(val_input, val_target))

from sklearn.model_selection import cross_validate
scores = cross_validate(dt, train_input, train_target)
print(scores)

import numpy as np
print(np.mean(scores['test_score']))

from sklearn.model_selection import StratifiedKFold
#교차검증할때 훈련세트를 섞을려면 분할기 지정해야함(splitter)
scores = cross_validate(dt, train_input, train_target, cv=StratifiedKFold())
print(np.mean(scores['test_score']))

#훈련 세트를 섞은후 10-폴드 교차검증 수행
splitter = StratifiedKFold(n_splits=10, shuffle=True, random_state=42)
scores = cross_validate(dt, train_input, train_target, cv=splitter)
print(np.mean(scores['test_score']))

from sklearn.model_selection import GridSearchCV
params = {'min_impurity_decrease' : [0.0001, 0.0002, 0.0003, 0.0004, 0.0005]}

gs = GridSearchCV(DecisionTreeClassifier(random_state=42), params, n_jobs=-1) #cpu 기본값은 1, -1로 지정시 모든 코어사용
gs.fit(train_input, train_target)

dt =gs.best_estimator_
print(dt.score(train_input, train_target))

print(gs.best_params_)

print(gs.cv_results_['mean_test_score'])

best_index = np.argmax(gs.cv_results_['mean_test_score'])
print(gs.cv_results_['params'][best_index])

params = {'min_impurity_decrease': np.arange(0.0001, 0.001, 0.0001),
          'max_depth': range(5, 20, 1)
          ,'min_samples_split': range(2, 100, 10)
          }

gs = GridSearchCV(DecisionTreeClassifier(random_state=42), params, n_jobs=-1)
gs.fit(train_input, train_target)

print(gs.best_params_)

print(np.max(gs.cv_results_['mean_test_score']))

from scipy.stats import uniform, randint #uniform:실수값뽑기, randint:정숫값을 뽑기
rgen =randint(0, 10)
print(rgen.rvs(10))

print(np.unique(rgen.rvs(1000), return_counts=True))

ugen = uniform(0, 1)
ugen.rvs(10)

params = {'min_impurity_decrease': uniform(0.0001, 0.001),
          'max_depth': randint(20, 50),
          'min_samples_split': randint(2, 25),
          'min_samples_leaf': randint(1, 25),
          }

from sklearn.model_selection import  RandomizedSearchCV
gs =RandomizedSearchCV(DecisionTreeClassifier(random_state=42), params,
                       n_iter=100, n_jobs=-1, random_state=42)

gs.fit(train_input, train_target)
print(gs.best_params_)
print(np.max(gs.cv_results_['mean_test_score']))

dt = gs.best_estimator_
print(dt.score(test_input, test_target))