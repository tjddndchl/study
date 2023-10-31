"""
최빈수는 데이터값 중에서 빈도수가 가장 높은 데이터 값이다.
bincount 함수를 통해 각 요소의 빈도를 계산하여 반환하고, argmax 함수를 사용하여 최댓값의
인덱스인 최빈수를 출력한다.
"""

import numpy as np

x = np.array([0,0,0,0,0,5,5,1,1,2,2,3,3,4,4,4])
print(np.bincount(x).argmin())