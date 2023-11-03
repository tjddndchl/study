"""
F-검정은 두 표본의 분산에 대한 차이가 통계적으로
유의한가를 판별하는 검정기법이다.
두 모집단 분산 간의 비율에 대한 검정이다.
"""

import numpy as np
from scipy.stats import f

df1 = np.array([1, 2, 3, 4, 6])
print(np.var(df1, ddof=1))

df2 = np.array([4, 5, 6, 7, 8])
print(np.var(df2, ddof=1))

def f_test(x, y):
    if np.var(x, ddof=1) < np.var(y, ddof=1):
        x, y = y, x
    f_value = np.var(x, ddof=1) / np.var(y, ddof=1)
    x_dof = x.size - 1
    y_dof = y.size - 1
    p_value = (1 - f.cdf(f_value, x_dof, y_dof)) * 2
    return f_value, p_value

result = f_test(df1, df2)
print(result)