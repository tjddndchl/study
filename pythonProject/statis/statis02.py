#타이타닉 데이터 분석
###탐색적 데이터 분석(EDA, Exploratory Data Analysis)

###척도

###
# 질적척도
# 명목척도 : 관찰하는 대상의 속성에 따라 그
# 값을 숫자로 나타냄, 연구대상을 구분하거나
# 분류할 목적으로 숫자를 사용하고 숫자
# 자체가 가지고 있는 의미는 없은(남자:0,
# 여자:1)
# -서열척도 : 관찰하는 대상의 특성을 측정해서
# 그 값을 순위로 나태나는 것 (성적 1등,
#  2등..) 높낮이는 알 수 있지만 어느정도 차이
#  인지는 알 수 없음.
#  양적척도
#  -등간척도 : 관찰대상의 속성을 상대적
#  크기로 나타냄 순위를 부여할 뿐만 아니라
#  어느 정도 큰지 숫자간의 의미가 있음(온도)
#  -비율척도 : 절대적 기준이 있는 영점이
#  존재하고 모든 사칙연산이 가능, 연구대상을
#  분류할 수 있고 차이를 비교할 수 있으며
#  순위를 만들 수 있으므로 명목, 서열, 등간
#  성격을 다 가지고 있음(판매량, 점수, ..)###

import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns

#데이터 로드
titanic = sns.load_dataset('titanic')
titanic.head(10)
print(titanic)

#survived : 생존 1, 사망 0
#pclass : 1등석:1, 2등석:2, 3등석:3
#sibsp : siblings(형제), spouses(자녀)
#parch:parents(부모님), children(자녀)
#ticket :티켓일련번호
#cabin :선실번호
#embarked : 선착장
#age : 나이
#sex : 성별

#기술 통계
desc_stats = titanic.describe(include='all')
print(desc_stats)
print(titanic.isnull().sum())

gender_mean = titanic.groupby('sex')['age'].mean()
print(gender_mean)

#특정 컬럼 널이 있는 행 제거
titanic.dropna(subset=['sex'], inplace=True)
print(titanic.info())

#성별에 따른 생존율
sns.countplot(x='survived', hue='sex', data=titanic)
#plt.title('survival')

#생존자, 사망자 인원수 출력
titanic['survived'].value_counts()
print(titanic['survived'].value_counts())

#생존율
temp = titanic['survived'].value_counts()
survival_rate = temp[1]/(temp[0]+temp[1]) * 100
# survived/(dead + survived) * 100
print(f"생존율은{survival_rate:.1f}%입니다.")

titanic['survived_label'] = titanic['survived'].replace(0,'dead').replace(1, 'survived')
#titanic['survived_label'].value_counts().plot(kind='bar', rot=50)



titanic['survived_label'].value_counts().plot(kind='pie', autopct='%1.2f%%')


titanic['pclass_label']=titanic['pclass'].replace(1, 'first_class').replace(2, 'business').replace(3, 'economy')


titanic['pclass_label'].value_counts().plot(kind='pie' , autopct='%1.2f%%')

plt.show()
