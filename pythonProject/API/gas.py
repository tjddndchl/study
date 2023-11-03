import requests

url = 'http://apis.data.go.kr/1611000/BldEngyService/getBeElctyUsgInfo'
params ={'serviceKey' : 'YU1Ek5RBPNntb5PoT4u%2BKqu2dw1fvp7hI%2BIDYJ5jU7normSeymKywve5JHr1EuVIsypsPzac5Dk9PniIPd5nIg%3D%3D', 'numOfRows' : '10', 'pageNo' : '1', 'sigunguCd' : '11680', 'bjdongCd' : '10300', 'bun' : '0012', 'ji' : '0000', 'useYm' : '201501' }

response = requests.get(url, params=params)
print(response.content)