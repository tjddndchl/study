from bs4 import BeautifulSoup
import requests

url = 'https://movie.daum.net/ranking/boxoffice/weekly'
res = requests.get(url)
soup = BeautifulSoup(res.content, 'html.parser')
# print(soup.prettify())
ol = soup.select_one('.list_movieranking')
lis = ol.select('li')
# /movie_img/영화명.png로 저장하세요
# 폴더생성

# -----------------------------
# 랭킹 기간 23.08.28 ~ 23.09.03
# 230828_230903.csv 파일로 저장
# 영화명|개봉일자(숫자만)|관객수(숫자만)|상세내용url|포스터저장경로
# 형태로 저장하세요
# -----------------------------
import re
text = '2023.07.12'
print(text)
print(re.sub(r'[^0-9]', '', text))


import os
import urllib.request as req
path = "movie_img/"
if not os.path.exists(path):
    os.mkdir(path)
for li in lis:
    print("="*100)
    # print(li)
    title = li.select_one('.link_txt').text.replace(":","")
    src = li.select_one('img').get('src')
    print(title, src)
    req.urlretrieve(src, path+title+'.png')
print('저장완료')

import csv
arr =[]
def fn_get_movie(page):
    # 검색할 디렉토리 경로 설정
    directory_path = r'C:\dev\pythonProject\ex_crawling\movie_img'

    # 디렉토리 내의 파일 목록 얻기
    file_list = os.listdir(directory_path)

    # 파일 목록 출력

    url = f'https://movie.daum.net/ranking/boxoffice/weekly?date=' + str(page)
    res = requests.get(url)
    soup = BeautifulSoup(res.content, 'html.parser')
    ols = soup.find('ol', class_='list_movieranking')
    lis = ols.find_all('li')
    arr = []
    for i, li in enumerate(lis):

            #print(li)
            # 영화명/개봉일자(숫자만),관객수(숫자만)/상세내용url/포스터저장경로
            title = li.find('strong', class_='tit_item').find('a').text
            open = li.find('span', class_='txt_num').text
            cnt = li.find('span', class_='txt_info').find_all('span')[2].text
            info = li.find('div', class_='poster_info').find('a')['href']
            #poster =li.find('div',
            #         class_='poster_movie').find_all('img')[0]['src']
            poster =  directory_path+'\\'+str(title)
            arr.append([title, re.sub(r'[^0-9]','',open),re.sub(r'[^0-9]','',cnt), info, poster.replace(":","")+".png"])
    return arr

if __name__ == '__main__':
    print(fn_get_movie(20230828))

all_arr=fn_get_movie(20230828)
with open('20230828-20230903.csv', 'w', encoding='utf-8') as f:
    write = csv.writer(f, delimiter='|', quotechar='"')
    for v  in  all_arr:
        write.writerow(v)
