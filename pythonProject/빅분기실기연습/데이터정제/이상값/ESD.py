import pandas as pd

df = pd.DataFrame({'score':[1,1,1,1,1,1,1,1,1,1,1,10000000],
                    'name':['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H','I', 'J','K','L']})

def esd(x):
    return abs((x-x.mean())/x.std()) < 3

print(df[esd(df['score'])])