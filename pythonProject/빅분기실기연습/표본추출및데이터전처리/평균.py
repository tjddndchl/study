import numpy as np
from scipy.stats import trim_mean

x = np.concatenate([np.arange(0, 2), [50]])
print(np.mean(x))

#trim_mean 함수는 양쪽 끝의 일정 부분을 제외한 값들에 대한 평균을 출력하는 함수이다.
print(trim_mean(x, 0.1))

y = np.array([12, 7, 4, -5, np.nan])

print(np.mean(y)) # 결측값 포함 평균

print(np.nanmean(y)) # 결측값 제외 평균


