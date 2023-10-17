import pandas as pd
fish = pd.read_csv('https://bit.ly/fish_csv_data')
print(fish.head())

print(pd.unique(fish['Species'])) #unique 열에서 고유한 값 출력

fish_input = fish[['Weight', 'Length', 'Diagonal', 'Height', 'Width']].to_numpy() # 넘파이 배열로 바꾸어 저장

print(fish_input[:5])

fish_target = fish['Species'].to_numpy()

from sklearn.model_selection import train_test_split
train_input, test_input, train_target, test_target = train_test_split(
    fish_input, fish_target, random_state=42
)

from sklearn.preprocessing import StandardScaler

ss = StandardScaler()
ss.fit(train_input) # 훈련세트의 통계값으로 테스트 세트를 변환해야함
train_scaled = ss.transform(train_input)
test_scaled = ss.transform(test_input)

from sklearn.neighbors import KNeighborsClassifier
kn = KNeighborsClassifier(n_neighbors=3)
kn.fit(train_scaled, train_target)
print(kn.score(train_scaled, train_target))
print(kn.score(test_scaled, test_target))


print(kn.classes_)#타깃값을 그대로 전달할시 순서가 자동으로 알파벳순으로됨

print(kn.predict(test_scaled[:5]))

import numpy as np
proba = kn.predict_proba(test_scaled[:5])
print(np.round(proba, decimals=4)) #소수점 네번짜자리까지 표기 다섯번쨰자리에서 반올림

distances, indexes = kn.kneighbors(test_scaled[3:4])
print(train_target[indexes])


bream_smelt_indexes = (train_target == 'Bream') | (train_target == 'Smelt')
train_bream_smelt = train_scaled[bream_smelt_indexes]
target_bream_smelt = train_target[bream_smelt_indexes]

from  sklearn.linear_model import LogisticRegression


lr = LogisticRegression()
lr.fit(train_bream_smelt, target_bream_smelt)
print(lr.predict(train_bream_smelt[:5]))

print(lr.predict_proba(train_bream_smelt[:5]))

print(lr.classes_)

print(lr.coef_, lr.intercept_)

decision = lr.decision_function(train_bream_smelt[:5])
print(decision) # z의 값

from scipy.special import expit
print(expit(decision))#이진 분류 시그모이드 함수적용

lr =LogisticRegression(C=20, max_iter=1000) # C값이 작을수록 규제가 커짐
lr.fit(train_scaled, train_target)
print(lr.score(train_scaled, train_target))
print(lr.score(test_scaled, test_target))

print(lr.predict(test_scaled[:5]))

proba = lr.predict_proba(test_scaled[:5])
print(np.round(proba, decimals=3))
print(lr.classes_)

print(lr.coef_.shape, lr.intercept_.shape) #다중 분류일경우 선형방정식의 모습

decision = lr.decision_function(test_scaled[:5])
print(np.round(decision, decimals=2))


from scipy.special import softmax
proba = softmax(decision, axis=1) # axis=1 각 행, 즉 각 생픔에 대한 소프트맥스를 계산
print(np.round(proba, decimals=3))#






