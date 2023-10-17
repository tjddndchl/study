from sklearn import datasets
import pandas as pd
from sklearn.cluster import KMeans
import matplotlib.pyplot as plt

iris = datasets.load_iris()
label = pd.DataFrame(iris.target)
label.columns = ['labels']
data = pd.DataFrame(iris.data)
# sepal 꽃받침, petal 꽃잎
data.columns = ['Sepal length', 'Sepal width'
    , 'Petal length', 'Petal width']
data = pd.concat([data, label], axis=1)
x_data = data[['Sepal length', 'Sepal width']]
print(x_data.head())
# auto : 기본값 데이터 특성에 따라 k-means or 변형된 k-means 선택
model = KMeans(n_clusters=3, algorithm='auto')
model.fit(x_data)
pred = pd.DataFrame(model.predict(x_data))
pred.columns = ['predict']
print(pred.head())
all_data = pd.concat([data, pred], axis=1)
print(all_data.head())
plt.scatter(all_data['Sepal length'], all_data['Sepal width']
            , c=all_data['predict'], alpha=0.5)
center = pd.DataFrame(model.cluster_centers_
                      , columns=['Sepal length','Sepal width'])
center_x = center['Sepal length']
center_y = center['Sepal width']
plt.scatter(center_x, center_y, s=50, marker='D', c='r')
plt.show()
# full or elkan
