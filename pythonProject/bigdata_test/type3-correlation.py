# 회귀모형(상관계수)
# iris에서 Sepal Length와 Sepal Width의 상관계수 계산하고 소수 둘째자리까지 출력하시오
import pandas as pd
from sklearn.datasets import load_iris

# iris 데이터셋 로드
iris = load_iris()
df = pd.DataFrame(iris.data, columns=iris.feature_names)

# your code

# Sepal Length와 Sepal Width의 상관계수 계산
correlation = df.corr()
result = correlation.loc['sepal length (cm)', 'sepal width (cm)']
print(round(result, 2))