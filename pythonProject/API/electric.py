import requests

api_url = "https://bigdata.kepco.co.kr/openapi/v1/powerUsage/houseAve.do"
api_key = "G9j3UecL6Z7D7IwrMAQ6cG2UIaYgy1KPQKwPbUDr"  # 본인의 API 키로 변경

year = "2022"
month = "08"
metroCd = "25"  # 모든 시도를 조회하려면 빈 문자열로 설정
cityCd = ""  # 모든 시군구를 조회하려면 빈 문자열로 설정

# API 요청을 보낼 URL 생성
request_url = f"{api_url}?year={year}&month={month}&metroCd={metroCd}&cityCd={cityCd}&apiKey={api_key}&returnType=json"

try:
    response = requests.get(request_url)
    response.raise_for_status()  # 요청이 성공적으로 이루어졌는지 확인

    data = response.json()

    # API 응답 데이터 처리
    for item in data['data']:
        year = item['year']
        month = item['month']
        metro = item['metro']
        city = item['city']
        houseCnt = item['houseCnt']
        powerUsage = item['powerUsage']
        bill = item['bill']

        print("Year:", year)
        print("Month:", month)
        print("Metropolitan:", metro)
        print("City:", city)
        print("House Count:", houseCnt)
        print("Power Usage:", powerUsage)
        print("Bill:", bill)
except requests.exceptions.RequestException as e:
    print("API 요청 실패:", str(e))
except Exception as e:
    print("오류 발생:", str(e))