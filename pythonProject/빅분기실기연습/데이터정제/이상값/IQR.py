import pandas as pd
from scipy.stats import iqr

df = pd.DataFrame({'score':[65, 60, 70, 75, 200],
                   'name': ['Bell', 'Cherry', 'Don', 'Jake', 'Fox']})

min_score = df['score'].median() - 1.5*iqr(df['score'])
max_score = df['score'].median() + 1.5*iqr(df['score'])

print(df[(df['score'] >= min_score) & (df['score']<=max_score)])