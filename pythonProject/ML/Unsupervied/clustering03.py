import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans

df = pd.read_csv("Mall_Customers1.csv")
# iloc 행열 접근,  [행, 열]
data = df.iloc[:, [3, 4]].values

model = KMeans(n_clusters=5, algorithm='auto'
               ,max_iter=300, random_state=0 )
pred = model.fit_predict(data)
plt.scatter(data[pred == 0, 0], data[pred == 0, 1], s=100,c='pink')
plt.scatter(data[pred == 1, 0], data[pred == 1, 1], s=100,c='yellow')
plt.scatter(data[pred == 2, 0], data[pred == 2, 1], s=100,c='cyan', label="target!!!")
plt.scatter(data[pred == 3, 0], data[pred == 3, 1], s=100,c='magenta')
plt.scatter(data[pred == 4, 0], data[pred == 4, 1], s=100,c='orange')
plt.title("mall cluster", fontsize=20)
plt.xlabel("annual income")
plt.ylabel("spending score")
plt.legend()
plt.grid()
plt.show()


