import os
from keras.preprocessing.image import load_img, img_to_array
from keras.utils import load_img, img_to_array
from keras.models import load_model
from keras import models, layers, optimizers, Sequential
from keras.layers import Flatten, Dense, Dropout
from keras.applications import VGG16
from keras.preprocessing.image import ImageDataGenerator


train_dir = "./dental_image/train"
test_dir = "./dental_image/test"

train_datagen = ImageDataGenerator(
     rotation_range=180 # 180회전
    ,width_shift_range=0.2 # 좌우이동
    ,height_shift_range=0.2 # 상하 이동
    ,horizontal_flip=True # 좌우 반전
    ,vertical_flip=True # 상하 반전
    ,brightness_range=[0.5, 1.5] # 명암 증강
)

test_datagen = ImageDataGenerator()



train_generator = train_datagen.flow_from_directory(
    train_dir, target_size=(224, 224), batch_size=32
    ,class_mode='categorical', shuffle=True
)

test_generator = test_datagen.flow_from_directory(
    test_dir, target_size=(224, 224), batch_size=32
    ,class_mode='categorical', shuffle=True
)

#class 수, label 수
class_num = len(train_generator.class_indices)
labels = list(test_generator.class_indices.keys())

from keras.models import load_model
import matplotlib.pyplot as plt
import numpy as np
model = load_model('dental_model.h5')

def fn_predict(p_model, p_file):
    image = load_img(p_file, target_size=(224, 224))
    plt.imshow(image)
    plt.show()
    test_image = img_to_array(image).reshape((1, 224, 224, 3))
    pred = p_model.predict(test_image)
    idx = np.argmax(pred)
    print(labels[idx], pred[0][idx]*100)

path = './dental_image/test/cured/'
file_list = os.listdir(path)
for f in file_list:
    fn_predict(model, path + f)