#sort_values함수는 특정한 열을 기준으로 데이터를 정렬해주는 함수이다.
# sort_values(by, ascending)
# by : 정렬의 기준이 되는열, ascending : 오름차순, 내림차순(기본값 False)

from sklearn.datasets import load_iris
import pandas as pd

iris = load_iris()
df = pd.DataFrame(data=iris.data, columns=iris.feature_names)
df['target'] = iris.target
df = df[['target', 'sepal length (cm)']]
abs = df.sort_values(by=['sepal length (cm)'], \
                     ascending=True)

print(df.sort_values(by=['sepal length (cm)'], \
                     ascending=False))