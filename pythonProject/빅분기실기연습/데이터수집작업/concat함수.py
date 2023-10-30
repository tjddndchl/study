#concat 함수는 데이터를 결합하는 함수이다.
#axis 행/열을 기준으로 결합할지 정하는 속성(기본값 0)
# 0: 행을 기준으로 결합, 1:열을 기준으로 결합
import pandas as pd
x = pd.DataFrame({'a':['s1', 's2', 's3'],
                  'b':['A','B', 'C']})
y = pd.DataFrame({'a':['s5', 's6', 's7'],
                  'b':['E', 'F', 'G']})

print(pd.concat([x, y], axis=0))