import pandas as pd
import numpy as np



df = pd.read_csv('https://bit.ly/perch_csv_data')
perch_full = df.to_numpy()
print(perch_full)

perch_weight = np.array([5.9, 32.0, 40.0, 51.5, 70.0, 100.0, 78.0, 80.0, 85.0, 85.0, 110.0,
       115.0, 125.0, 130.0, 120.0, 120.0, 130.0, 135.0, 110.0, 130.0,
       150.0, 145.0, 150.0, 170.0, 225.0, 145.0, 188.0, 180.0, 197.0,
       218.0, 300.0, 260.0, 265.0, 250.0, 250.0, 300.0, 320.0, 514.0,
       556.0, 840.0, 685.0, 700.0, 700.0, 690.0, 900.0, 650.0, 820.0,
       850.0, 900.0, 1015.0, 820.0, 1100.0, 1000.0, 1100.0, 1000.0,
       1000.0])

from sklearn.model_selection import train_test_split

train_input, test_input, train_target, test_target = train_test_split(
    perch_full,perch_weight,random_state=42
)

from sklearn.preprocessing import PolynomialFeatures #변환기

poly = PolynomialFeatures()
poly.fit([[2, 3]]) #fit메서드는 새롭게 만들 특성 조합을 찾고
print(poly.transform([[2, 3]]))# transform메서드는 실제로 데이터를 변환

poly = PolynomialFeatures(include_bias=False) # 절편 없애기

poly.fit(train_input)
train_poly = poly.transform(train_input)
print(train_poly.shape)

print(poly.get_feature_names_out()) #각각의 특성이 어떤 입력의 조합으로 만들어졌는지 제공

test_poly = poly.transform(test_input)


#다중회귀모델훈련
from sklearn.linear_model import LinearRegression
lr = LinearRegression()
lr.fit(train_poly, train_target)
print(lr.score(train_poly, train_target))

print(lr.score(test_poly, test_target))

poly = PolynomialFeatures(degree=5, include_bias=False)
poly.fit(train_input)
train_poly = poly.transform(train_input)
test_poly = poly.transform(test_input)
print(train_poly.shape) # 특성 55개

lr.fit(train_poly, train_target)
print(lr.score(train_poly, train_target))

print(lr.score(test_poly, test_target)) # 과적합 발생

from sklearn.preprocessing import StandardScaler
ss = StandardScaler()
ss.fit(train_poly)
train_scaled = ss.transform(train_poly) # 꼭 훈련세트로 학습한 변환기를 사용해 테스트 세트까지 변환해야함
test_scaled = ss.transform(test_poly)


from sklearn.linear_model import Ridge # 릿지회귀 모델에규제 추가
ridge = Ridge()
ridge.fit(train_scaled, train_target)
print(ridge.score(train_scaled, train_target))

print(ridge.score(test_scaled, test_target))


import matplotlib.pyplot as plt
train_score = []
test_score = []

alpha_list = [0.001, 0.01, 0.1, 1, 10, 100] #alpha값이 크면 규제 강도가 세짐
for alpha in alpha_list:
       #릿지 모델을 만듭니다
       ridge = Ridge(alpha = alpha)
       #릿지 모델을 훈련
       ridge.fit(train_scaled, train_target)
       #훈련 점수와 테스트 점수를 저장
       train_score.append(ridge.score(train_scaled, train_target))
       test_score.append(ridge.score(test_scaled, test_target))

plt.plot(np.log10(alpha_list), train_score)
plt.plot(np.log10(alpha_list), test_score)
plt.xlabel('alpha')
plt.ylabel('R^2')
plt.show() # alpha 10^-1승일때 가장 효과 좋음

ridge = Ridge(alpha = 0.1)
ridge.fit(train_scaled, train_target)
print(ridge.score(train_scaled, train_target))
print(ridge.score(test_scaled, test_target))


from sklearn.linear_model import Lasso #라쏘회귀
lasso = Lasso()
lasso.fit(train_scaled, train_target)
print(lasso.score(train_scaled,train_target))
print(lasso.score(test_scaled, test_target))

train_score = []
test_score = []

alpha_list = [0.001, 0.01, 0.1, 1, 10, 100]
for alpha in alpha_list:
       #라쏘 모델을 만들기
       lasso = Lasso(alpha=alpha, max_iter=100000)
       #라쏘 모델을 훈련합니다.
       lasso.fit(train_scaled, train_target)
       # 훈련 점수와 테스트 점수를 저장합니다.
       train_score.append(lasso.score(train_scaled, train_target))
       test_score.append(lasso.score(test_scaled, test_target))

plt.plot(np.log10(alpha_list), train_score)
plt.plot(np.log10(alpha_list), test_score)
plt.xlabel('alpha')
plt.ylabel('R^2')
plt.show()

lasso = Lasso(alpha=10)
lasso.fit(train_scaled, train_target)
print(lasso.score(train_scaled, train_target))
print(lasso.score(test_scaled, test_target))

print(np.sum(lasso.coef_ == 0)) #라쏘모델은 계수를 0으로 만들수있음, 이를통해 유용한 특성을 골라내는 용도로 사용할수 있다.









