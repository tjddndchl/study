import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans

df = pd.read_csv("Mall_Customers1.csv")
df['Gender'] = df['Gender'].map({"Female":1, "Male":0})
print(df.columns)
data = df[['Gender', 'Age', 'Annual Income', 'Spending Score']]
print(data.info())
print(data.describe())
# 좋은 군집 찾기
# 그룹에 포함된 데이터들의 퍼짐 정도를 inertia 라고 하는데
# 좋은 군집은 퍼짐 정도가 낮은 군집
cnt = list(range(1, 11))
inertia = []
for i in cnt:
    model = KMeans(n_clusters=i, algorithm='auto')
    model.fit(data)
    inertia.append(model.inertia_)
plt.plot(cnt, inertia, '-0')
plt.xlabel("number of clusters (k)")
plt.ylabel("Inertia")
plt.show()
