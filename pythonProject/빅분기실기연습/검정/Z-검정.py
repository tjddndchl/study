import numpy as np
from scipy.stats import norm

x = np.array([25, 27, 31, 23, 24, 30, 26])

print(np.mean(x))


z = (np.mean(x)- 26) /  (5 / np.sqrt(7))

print(z)

p = (1 - norm.cdf(z)) * 2

print(p)