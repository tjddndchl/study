import os
from PIL import Image

img_dir = "./dataset/"
keyword = ['니체', '칸트', '카뮈']

for dir in  keyword:
    main_path = img_dir + dir
    arr = os.listdir(main_path)
    for file in arr:

        with Image.open(main_path + "/" + file) as img:
            width, height = img.size

        if img.width < 100 or img.height < 100:
            os.remove(main_path + "/" + file)