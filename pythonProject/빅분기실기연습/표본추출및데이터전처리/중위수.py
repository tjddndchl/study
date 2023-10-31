"""
중위수는 모든 데이터 값을 순서대로 배열하였을때 중앙에 위치한 데이터값
median은 데이터의 중위수를 출력하는 함수이다.

nanmedian 함수는 결측값을 제거한 데이터의 중위수를 출력하는 함수이다.
"""

import numpy as np

x = np.array([12, 7, 4, -5, np.nan])

print(np.median(x))

print(np.nanmedian(x))

