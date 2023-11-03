import requests
import pandas as pd

api_url = "https://bigdata.kepco.co.kr/openapi/v1/powerUsage/houseAve.do"
api_key = "G9j3UecL6Z7D7IwrMAQ6cG2UIaYgy1KPQKwPbUDr"  # 본인의 API 키로 변경

metroCds = [11 ,21 ,22 ,23 ,24 ,25 ,26 ,29 ,31 ,32 ,33 ,34 ,35 ,36 ,37 ,38 ,39]

# 2013년부터 2023년까지 반복
for year in range(2013, 2024):
    for month in range(1, 13):
        for metroCd in metroCds:

            year_str = str(year)
            month_str = str(month).zfill(2)
            metroCd_str = str(metroCd)
            cityCd = ""
            # API 요청을 보낼 URL 생성
            request_url = f"{api_url}?year={year_str}&month={month_str}&metroCd={metroCd_str}&cityCd={cityCd}&apiKey={api_key}&returnType=json"

            try:
                response = requests.get(request_url)
                response.raise_for_status()  # 요청이 성공적으로 이루어졌는지 확인

                data = response.json()['data']

                # 데이터를 저장할 DataFrame을 생성
                df = pd.DataFrame(data)

                # 열의 순서를 지정합니다 (이 부분을 사용자 정의할 수 있습니다)
                columns_order = ['year', 'month', 'metro', 'city', 'houseCnt', 'powerUsage', 'bill']
                df = df[columns_order]

                # 데이터를 엑셀 파일로 저장합니다
                excel_filename = f"전력사용데이터_{year_str}_{month_str}_{metroCd_str}.xlsx"
                df.to_excel(excel_filename, index=False)

                print(f"{year_str}년 {month_str}월 데이터가 {excel_filename} 파일로 저장되었습니다.")
            except requests.exceptions.RequestException as e:
                print(f"{year_str}년 {month_str}월 데이터를 가져오는 데 실패했습니다:", str(e))
            except Exception as e:
                print(f"{year_str}년 {month_str}월에 오류가 발생했습니다:", str(e))