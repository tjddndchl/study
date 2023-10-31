"""
범위는 최댓값에서 최솟값을 뺸 값이다.
ptp함수는 범위를 계산하는 함수이다.
"""

import numpy as np

x = np.array([1, 7, 3, 5, 11, 4, 6])
print(np.ptp(x)) #범위계산

print(np.min(x))#최솟값계산

print(np.max(x))#최댓값계산

"""
percentile 함수는 데이터의 백분위를 계산한다.
np.percentile(a, q)
a = 계산할 데이터의 배열
q = 계산할 백분위수 값
0 ~ 100 의 값을 가짐

iqr 함수는 사분위수 범위를 계산하는 함수이다.
iqr(x) 
"""
import numpy as np
from scipy.stats import iqr

x = np.array([3, 4, 5, 2, 4, 3, 4])
q1 = np.percentile(x, 25)
q3 = np.percentile(x, 75)
print(q3 - q1)
print(iqr(x))

