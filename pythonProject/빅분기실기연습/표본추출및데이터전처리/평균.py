import numpy as np
from scipy.stats import trim_mean

x = np.concatenate([np.arange(0, 51), [50]])
print(np.mean(x))