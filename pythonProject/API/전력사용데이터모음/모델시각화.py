import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import font_manager, rc
import sys

# 엑셀 파일 로드
data = pd.read_excel('전력사용데이터.xlsx')

# 사용할 한글 폰트 파일 경로를 지정
font_path = 'C:/Windows/Fonts/malgun.ttf'

# 폰트 설정
plt.rcParams['axes.unicode_minus'] = False
plt.rcParams['font.family'] = font_manager.FontProperties(fname=font_path).get_name()

print(data.describe())