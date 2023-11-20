import sklearn
print(dir(sklearn)) # 시험장에서 안보일수있음

cnt = 0
for att in dir(sklearn):
    print(att, end=' ')
    cnt +=1
    if cnt % 10 == 0:
        print()

#print(help(sklearn))
# from sklearn.preprocessing import MinMaxScaler
# #print(dir())
# for att in dir(MinMaxScaler):
#     print(att, end=' ')
#     cnt +=1
#     if cnt % 10 == 0:
#         print(help(MinMaxScaler))

import pandas

#print(help(pandas.DataFrame.sort_values))

from sklearn.tree import DecisionTreeClassifier
#print(help(DecisionTreeClassifier))

model = DecisionTreeClassifier()
print(help(model.fit))