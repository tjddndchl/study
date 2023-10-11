import os

dir = os.getcwd() # 해당 파일 경로
print(dir)#폴더경로
file_list = os.listdir(dir)#폴더안에있는 파일 전부
print(file_list)
#os.remove('C:/dev/pythonProject/base/dist/delay.txt') # 파일삭제

for v in file_list:
   # print(dir + "\\" + v)
    file = dir + "\\" + v
    if os.path.isfile(file):
        print(file, '파일 입니다.')
    elif os.path.isdir(file):
        print(file, '폴더 입니다.')

root = "C:\\dev\\pythonProject\\"
for dirpath, dirname, filename in os.walk(root):
    print(dirpath, dirname, filename)