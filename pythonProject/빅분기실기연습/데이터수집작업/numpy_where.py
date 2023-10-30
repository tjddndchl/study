import numpy as np
# where 함수는 배열에서 조건에 따라 원하는 값을 선택하기 위한 함수이다.
a = np.array([1, 2, 3, 4])
print(a)

a =np.where(a > 2, 2, a)

print(a)