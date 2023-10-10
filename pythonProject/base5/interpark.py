import time
from selenium import webdriver
from bs4 import BeautifulSoup
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import requests
driver = webdriver.Edge('./msedgedriver.exe')
driver.implicitly_wait(3) # 브라우저 켜질때까지 기다리기
url = 'https://book.interpark.com/bookPark/html/book.html#'
driver.get(url)
time.sleep(1)
soup =BeautifulSoup(driver.page_source, 'html.parser')
div = soup.find('div',class_='bestSellerRank current')
lis = div.find_all('li')
div2 =soup.find('div',class_='sliderContents')
lis2 = div.find_all('li')



print("="*100)
arr = []
arr2 = []
for i, li in enumerate(lis):
    print(li)
    title = li.find('strong',class_='title').text
    arr.append(title)
#print(arr)

print(lis2)

for i, li in enumerate(lis2):
    images =""
    images_d = li.find('span', class_='imageWrap')
    print(images_d)
    if images_d:
        images = images_d.find('img')['src']
    arr2.append(images)

print(arr2)
#print(soup.prettify())