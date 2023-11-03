"""
범주형 자료 간의 차이를 보여주는 분석방법
적합도 검정, 독립성 검정, 동질성 검정 3가지로 분류할 수 있다.
"""

#적합도 검정
import numpy as np
from scipy.stats import chisquare

num = np.array([90, 160])
expected = np.array([0.45, 0.55]) * np.sum(num)

result = chisquare(num, f_exp=expected)

print(result)

print(result.pvalue)

#독립성 검정
"""
변수가 두 개 이상의 범주로 분할되어 있을 때 사용되며, 각 범주가
서로 독립적인지, 서로 연관성이 있는지를 검정하는 기법니다.
"""

import pandas as pd
from scipy.stats import chi2_contingency

# survey = pd.read_csv("../데이터 셋/s")
#
# tb = pd.crosstab(survey['Sex'], survey['Exer'])
# print(tb)


#동질성 검정