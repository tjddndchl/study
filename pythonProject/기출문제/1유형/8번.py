"""
자료에서 (num_loves)좋아효 수 와 놀랐어요 수(num_wows)를 긍정의 평가로 보고 전체 반응(num_reactions)에서 긍정인 비율이
0.4보다 크고 0.5보다 작은 비디오 개수를 구하시오
"""
import pandas as pd

f = pd.read_csv('../데이터 셋/P220402.csv')

print(f.info())

f['pos'] = (f['num_loves'] + f['num_wows']) / f['num_reactions']

result = f[(f['pos'] > 0.4) & (f['pos'] < 0.5)]

print(len(result))