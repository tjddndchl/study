"""
p220403 은 netfilx에서 상영된 작품들의 목록이다. 2018년 1월에 넷플릭스에서 추가한 작품중
united kingdom에서 단독으로 제작된 작품의 개수를 구하시오
"""

import pandas as pd

net = pd.read_csv('../데이터 셋/P220403.csv')

print(net.info())

print(net['date_added'].head())


net['date_added'] = \
    pd.to_datetime(net['date_added'], format="%B %d, %Y")

result = net[(net['country'] == "United Kingdom") &
             (net['date_added'].dt.year == 2018) &
             (net['date_added'].dt.month == 1)]

print(len(result))