import statsmodels.api as sm

mtcars = sm.datasets.get_rdataset('mtcars').data

#cyl을 기준으로 mpg평균을 출력
print(mtcars.groupby('cyl')['mpg'].mean())

#info() 데이터함수의 시리즈 또는 요약정보
print(mtcars['wt'].info())

#head함수는 데이터의 앞부분을 출력

print(mtcars['wt'].head())

#tail함수는 데이터 뒷부분을 출력하는 함수이다.

print(mtcars['wt'].tail())
