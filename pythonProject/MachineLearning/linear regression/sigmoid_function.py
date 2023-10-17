import numpy as np
import matplotlib.pyplot as plt

z = np.arange(-5, 5 , 0.1)
phi = 1/ (1 + np.exp(-z))
plt.plot(z, phi)
plt.xlabel('z')
plt.ylabel('phi')
plt.show()

char_arr = np.array(['A', 'B', 'C', 'D', 'E'])
print(char_arr[[True, False, True, False, False]])
