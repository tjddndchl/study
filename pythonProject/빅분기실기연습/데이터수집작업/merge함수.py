#merge 함수는 공통된 열을 하나 이상 가지고 있는 두 데이터 프레임에 대하여 기준이 되는
#특정 컬럼의 값이 같은 행끼리 묶어 주는 병합 함수이다.
#pd.merge(left, right, how, on)
#how : 병합할 때 기준이 되는 열을 지정하는 파라미터
# inner: 두 데이터 프레임에서 공통으로 존재하는 모든 열을 병합
# left : 왼쪽데이터 프레임을 기준으로 병합
# right : 오른쪽데이터 프레임을 기준으로 병합
# outer : 두 데이터 프레임에 존재하는 모든 열을 병합하는 함수

import pandas as pd
x =pd.DataFrame({'name':['a', 'b', 'c'],
                 'math':['1', '2', '3']})

y =pd.DataFrame({'name':['c', 'b', 'd'],
                 'english':['4', '5', '6']})

print(pd.merge(x, y, how='inner', on='name'))
print(pd.merge(x, y, how='left', on='name'))
print(pd.merge(x, y, how='right', on='name'))
print(pd.merge(x, y, how='outer', on='name'))