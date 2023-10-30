#astype 함수는 데이터 유형을 변환하는 함수이다.

import pandas as pd

df = pd.DataFrame({'Class':[1, 2, 3,1, 2, 1],
                   'Age': [1, 3.2, 11.8, 33.2, 42.9, 33.2],
                   'Part':[3, 7, 2, 1, 3, 5]})

print(df.info())

print(df)

df['Class'] =df['Class'].astype('category')
df['Age'] = df['Age'].astype(int)
df['Part'] = df['Part'].astype(float)

print(df.info())

print(df)