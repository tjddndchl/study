from keras.models import load_model
from keras.datasets import mnist
from PIL import Image
import matplotlib.pyplot as plt
import numpy as np


model = load_model("./model/15-0.0599.hdf5")
model.summary()

#이미지 로드

image = Image.open("888.JPG")

#이미지 크기 변환

image = image.resize((28, 28)).convert("L") # 흑백 28 x 28 변환
image = 255 - np.array(image)
plt.imshow(image, cmap='Greys')
plt.show()
#데이터 전처리
image_arr = np.array(image)
image_arr = image_arr.reshape(1, 784).astype('float32') / 255.0
pred = model.predict(image_arr)
print(np.argmax(pred))




