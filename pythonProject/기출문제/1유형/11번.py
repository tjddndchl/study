"""
p220502
BMI계산하여 분류하고, 정상 체중 범위의 구간에 있는 인원과 위험체중 범위의구간에 있는 인원 차이를
절댓값으로 구하시오.(단 BMI 계산시 단위에 유의하고, 답안은 소수점 첫 번째 자리에서
반올림해서 정수로 출력하시오)
"""

import pandas as pd

body = pd.read_csv("p220502.csv")

body['bmi'] = body['Weight'] / ((body['Height']/100)**2)

normal = body[(body['bmi'] >= 18.5) & (body['bmi'] < 23)]

cnt_normal = len(normal)

print(cnt_normal)

overweight