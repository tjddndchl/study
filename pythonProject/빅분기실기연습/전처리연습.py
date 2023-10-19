import pandas as pd
import pandas.core.frame

dir(pd)

df = pd.read_csv("https://raw.githubusercontent.com/Datamanim/pandas/main/lol.csv", sep='\t')

print(df)

