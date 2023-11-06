import requests
import pandas as pd

api_url = "https://bigdata.kepco.co.kr/openapi/v1/powerUsage/houseAve.do"
api_key = "G9j3UecL6Z7D7IwrMAQ6cG2UIaYgy1KPQKwPbUDr"  # 본인의 API 키로 변경

metroCds = [11, 21, 22, 23, 24, 25, 26, 29, 31, 32, 33, 34, 35, 36, 37, 38, 39]

# 데이터를 저장할 빈 리스트 생성
all_data = []

# 2013년부터 2023년까지 반복
for year in range(2013, 2024):
    for month in range(1, 13):
        for metroCd in metroCds:
            # API 요청을 보낼 URL 생성
            year_str = str(year)
            month_str = str(month).zfill(2)
            metroCd_str = str(metroCd)
            cityCd = ""
            request_url = f"{api_url}?year={year_str}&month={month_str}&metroCd={metroCd_str}&cityCd={cityCd}&apiKey={api_key}&returnType=json"

            try:
                response = requests.get(request_url)
                response.raise_for_status()  # 요청이 성공적으로 이루어졌는지 확인

                data = response.json()['data']

                # 모든 데이터 리스트에 추가
                all_data.extend(data)
            except requests.exceptions.RequestException as e:
                print(f"{year}년 {month:02d}월 데이터를 가져오는 데 실패했습니다:", str(e))
            except Exception as e:
                print(f"{year}년 {month:02d}월에 오류가 발생했습니다:", str(e))

# 모든 데이터를 데이터프레임으로 변환
df = pd.DataFrame(all_data)

# 엑셀 파일로 저장
excel_filename = "전력사용데이터_2013_2023.xlsx"
df.to_excel(excel_filename, index=False)
print(f"모든 데이터가 {excel_filename} 파일로 저장되었습니다.")