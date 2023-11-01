# Python3 샘플 코드 #


import requests

url = 'http://apis.data.go.kr/B553530/CAR/CAR_01_LIST'
params ={'serviceKey' : 'YU1Ek5RBPNntb5PoT4u%2BKqu2dw1fvp7hI%2BIDYJ5jU7normSeymKywve5JHr1EuVIsypsPzac5Dk9PniIPd5nIg%3D%3D', 'pageNo' : '1', 'numOfRows' : '10', 'apiType' : 'xml', 'q1' : '가', 'q2' : '카', 'q3' : '4' }

response = requests.get(url, params=params)
print(response.content)