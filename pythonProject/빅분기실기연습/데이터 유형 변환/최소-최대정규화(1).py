import numpy as np
from sklearn.preprocessing import MinMaxScaler

data = np.array([1, 3, 5, 7, 9])
x = data.reshape(-1, 1)
scaled_data = MinMaxScaler().fit_transform(x)

print(scaled_data.flatten()) #flatten() 평탄화 작업