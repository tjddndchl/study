"""
다음 종량제 쓰레기 데이터(p220501.csv파일)이다. 쓰레기 데이터에서 다음 기준에 따른 데이터를 추출하고
평균 가격을 제출형식에 따라 제출하시오. (단 소수점 첫 번쨰 자리에서 반올림해서 정수형으로 출력하시오)

종량제봉투: 규격봉투
종량제봉투용도 : 음식물쓰레기
종량제봉투용량: 2L
(가격이 0인 것은 구매하지 않은 것으로 평균 계산할 때 제외한다.)
"""

import pandas as pd

waste = pd.read_csv('../데이터 셋/P220501.csv', encoding='euc-kr')


print(waste.info())

df = waste[(waste['종량제봉투종류'] == '규격봉투') &
           (waste['종량제봉투용도'] == '음식물쓰레기') &
           (waste['2L가격'] != 0)]

mean_price = df['2L가격'].mean()

print(int(mean_price))







