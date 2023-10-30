import pandas as pd
import numpy as np

data = np.array([1, 3, 5, 7, 9])

def standardize(a):
    return (a - np.mean(a)) / np.std(a, ddof=1)

data_zscore = standardize(data)
print(np.mean(data_zscore))

print(np.std(data_zscore, ddof=1))

print(data_zscore)