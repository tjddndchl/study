"""
순위 계산
pandas 패키지의 Series(x).rank 함수를 이용하여 method 파라미터로 순위를 계산

pd.Series(x).rank(method)
method : 순위를 계산하는 방법을 지정하는 파라미터 (기본값 'average')
"""
import numpy as np
import pandas as pd

x = np.array([1, 1, 5, 5, 9, 7])

print(pd.Series(x).rank(method='first')) # 데이터가 나타나는 대로 순서부여

print(pd.Series(x).rank(method='min')) # 동일한 값을 가진 항목들에 대해서 가장 작은 순위를 부여

print(pd.Series(x).rank(method='dense')) # 순위를 부여할 때 연속적인 정수를 사용하여 순위를 부여

"""
반올림
round 함수는 반올림하는 함수이다.
round(number, ndigits)
ndigits : 반올림하여 표시할 소수 자릿수
"""

print(round(3.1455, 2))

print(int(3.1425))

