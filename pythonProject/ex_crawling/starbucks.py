from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium import webdriver
from bs4 import BeautifulSoup
import time
from  tkinter import *
import chromedriver_autoinstaller
import img_util
search_word = ""
chromedriver_autoinstaller.install()
url="https://www.starbucks.co.kr/store/store_map.do"
def fn_search_market():
    print('market search')
    search_word = word_entry.get()
    driver = webdriver.Chrome()
    driver.implicitly_wait(3)
    driver.get(url)
    time.sleep(1)
    # input_search = driver.find_element(By.ID, 'input_keyword')
    # input_search.send_keys(search_word)
    driver.find_element(By.XPATH, '//*[@id="container"]/div/form/fieldset/div/section/header[1]/h2/a').click()

    time.sleep(1)

    driver.find_element(By.XPATH, '//*[@id="container"]/div/form/fieldset/div/section/article[1]/article/header[2]/h3/a').click()
    time.sleep(3)
    driver.find_element(By.XPATH,'//*[@id="container"]/div/form/fieldset/div/section/article[1]/article/article[2]/div[1]/div[2]/ul/li[5]/a').click()#바뀔때마다 XPATH값 바뀌어야함
    time.sleep(3)
    driver.find_element(By.XPATH,'//*[@id="mCSB_2_container"]/ul/li[1]/a').click()



    soup = BeautifulSoup(driver.page_source, 'html.parser')
    lis = soup.select('quickResultLstCon li')

    for li in lis:
        info = li.select_one('.txt_info').text
        if info == None:
            continue
        text.insert(END, info+'\n')


    driver.quit()

app = Tk()
app.title("tour search")
word_entry = Entry(app, width=100)
word_entry.pack()
search_btn = Button(app, text='search & save', command=fn_search_tour)
search_btn.pack()
text = Text(app, width=100, height=50)
text.pack()
app.mainloop()
