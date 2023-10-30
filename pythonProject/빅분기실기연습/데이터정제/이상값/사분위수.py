import pandas as pd
import matplotlib.pyplot as plt

df = pd.DataFrame({'score':[65, 60 ,70, 75, 200],
                    'name':['Bell', 'Cherry', 'Don', 'Jake', 'Fox'] })

box_score = plt.boxplot(df['score'])

minimum = box_score['whiskers'][0].get_ydata()[1]
q1 =box_score['boxes'][0].get_ydata()[1]
q2 = box_score['medians'][0].get_ydata()[0]
q3 =box_score['boxes'][0].get_ydata()[2]
maximum = box_score['whiskers'][1].get_ydata()[1]

outliers = []

for point in df['score']:
    if point < minimum or point > maximum:
        outliers.append(point)


print("최솟값:", minimum)

print("1사분위:", q1)

print("2사분위:", q2)

print("3사분위:", q3)

print("최닶값:", maximum)

print("이상값:", outliers)