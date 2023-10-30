import numpy as np

data = np.array([1, 3, 5, 7, 9])

def normalize(arr):
    return (arr - np.min(arr)) / (np.max(arr) - np.min(arr))

print(normalize(data))