import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import font_manager, rc


# 데이터를 데이터프레임으로 읽어오기
data = pd.read_excel('../전력사용데이터_2013_2023.xlsx')  # 'your_data.csv'에 데이터 파일 경로를 입력하세요.


font_path = 'C:/Windows/Fonts/malgun.ttf'  # 사용할 한글 폰트 파일 경로를 지정합니다.
font_name = font_manager.FontProperties(fname=font_path).get_name()
rc('font', family=font_name)


# 'year'와 'month' 열을 기반으로 날짜를 생성
data['date'] = pd.to_datetime(data[['year', 'month']].assign(day=1))

# 월별 평균 전력 사용량 계산
monthly_avg_power_usage = data.groupby('date')['powerUsage'].mean()

# 월별 평균 전기 요금 계산
monthly_avg_bill = data.groupby('date')['bill'].mean()

# 그래프 그리기
plt.figure(figsize=(12, 6))
plt.plot(monthly_avg_power_usage, label='월평균 전력 사용량')
plt.plot(monthly_avg_bill, label='월평균 전기 요금')
plt.xlabel('날짜')
plt.ylabel('평균 값')
plt.title('월별 평균 전력 사용량 및 전기 요금 추이')
plt.legend()
plt.show()