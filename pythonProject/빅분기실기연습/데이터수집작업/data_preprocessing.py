from sklearn.datasets import load_iris
import pandas as pd

iris = load_iris()

df=pd.DataFrame(data=iris.data, columns=iris.feature_names)
print(df['sepal length (cm)'])
print(df.iloc[:, 3])

iris = load_iris()
df = pd.DataFrame(data=iris.data, columns=iris.feature_names)
df['target'] = iris.target
a = df[df['target'] == 0]
print(a[['sepal length (cm)', 'sepal width (cm)']])#a변수에서 꽃받침의 길이와 너비 열을 출력

print(df.iloc[3, ]) # df 변수에서 3번쨰 행을 추출

#apply(메서드)
#기존의 변수를 조합하여 새로운 변수인 파생 변수를 생성한다.

iris = load_iris()
df=pd.DataFrame(data=iris.data, columns=iris.feature_names)
df['target'] = iris.target

def fn(x):
    if x > 6:
        return 'L'
    else:
        return 'S'

df['Len'] = df['sepal length (cm)'].apply(fn)
print(df[['target', 'Len']])


# 원-핫 인코딩
#원핫 인코딩은 표현하고 싶은 단어의 인덱스에 1의값을 부여하고, 다른 인덱스에는 0을 부여하는 방식


df =pd.DataFrame({'Species': \
                  ['Versicolor', 'Setosa', 'Virginica', 'Setosa', 'Setosa']})
encode_df = pd.get_dummies(df['Species'])

print(encode_df)

encode_df = pd.get_dummies(df['Species'], drop_first=True)
print(encode_df)


#gorup by 함수
# group by 함수는 데이터를 특정 기준으로 그룹화하는 기능을 제공하는 함수
# mean: 그룹별 평균, var:그룹별 분산, std:그룹별 표준편차, SUM:그룹별 합계, size:그룹별 빈도
iris = load_iris()
df = pd.DataFrame(data=iris.data, columns=iris.feature_names)
df['target'] = iris.target
a = df.groupby('target').std()
print(df.groupby('target').mean())