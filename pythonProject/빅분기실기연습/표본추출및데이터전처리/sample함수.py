import numpy as np

numbers = np.arange(1, 11)
s = np.random.choice(numbers, size=5, replace=False) # 비복원추출
print(s)

s = np.random.choice(numbers, size=5, replace=True) # 복원추출
print(s)