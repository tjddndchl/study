"""
import pandas as pd
df = pd.read_csv('data.csv)
print(df)
"""
#path_or_buf : csv 파일명 또는 경로
# sep 파일에 저장할 때 데이터들 구분가(기본값, ',')
#header : 첫 번쨰 행을 열 이름으로 인식할지 여부를 설정하는 속성(기본값 True)
#True : 열 이름을 포함    False:열 이름을 미포함

import pandas as pd
from sklearn.datasets import load_iris

iris = load_iris()
df = pd.DataFrame(data=iris.data, columns=iris.feature_names)
df.to_csv('data.csv', index=False)

#read_excel 함수 : 엑셀 파일로부터 데이터를 읽을 때 사용하는 함수

df = pd.read_excel('data.xlsx')
print(df)

#to_excel 엑셀파일로 저장할 때 사용하는 함수

iris =load_iris()
df = pd.DataFrame(data=iris.data, columns=iris.feature_names)

df.to_excel(excel_writer='iris.xlsx',sheet_name='data_sheet', index=False)


