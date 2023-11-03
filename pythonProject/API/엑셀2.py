import requests
import pandas as pd

api_url = "https://bigdata.kepco.co.kr/openapi/v1/powerUsage/houseAve.do"
api_key = "G9j3UecL6Z7D7IwrMAQ6cG2UIaYgy1KPQKwPbUDr"  # 본인의 API 키로 변경

metroCds = [11, 21, 22, 23, 24, 25, 26, 29, 31, 32, 33, 34, 35, 36, 37, 38, 39]

# 연도별 데이터를 저장할 딕셔너리 생성
yearly_data = {}

# 2013년부터 2023년까지 반복
for year in range(2013, 2024):
    yearly_data[year] = []  # 연도별 데이터를 저장할 빈 리스트를 초기화

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

                # 월별 데이터를 연도별 리스트에 추가
                yearly_data[year].extend(data)
            except requests.exceptions.RequestException as e:
                print(f"{year}년 {month:02d}월 데이터를 가져오는 데 실패했습니다:", str(e))
            except Exception as e:
                print(f"{year}년 {month:02d}월에 오류가 발생했습니다:", str(e))

# 연도별 데이터를 엑셀 파일로 저장
for year, data in yearly_data.items():
    df = pd.DataFrame(data)
    columns_order = ['year', 'month', 'metro', 'city', 'houseCnt', 'powerUsage', 'bill']
    df = df[columns_order]
    excel_filename = f"전력사용데이터_{year}.xlsx"
    df.to_excel(excel_filename, index=False)
    print(f"{year}년 데이터가 {excel_filename} 파일로 저장되었습니다.")