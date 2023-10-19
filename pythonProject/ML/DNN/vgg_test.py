import os

import matplotlib.pyplot as plt
from keras.models import load_model
from keras.preprocessing.image import load_img, img_to_array
from keras import models, layers, optimizers
from keras.applications import vgg16

model = vgg16.VGG16()
model.summary()



def fn_predict(p_model, p_file):
    image = load_img(p_file, target_size=(224, 224))
    plt.imshow(image)
    plt.show()
    test_image = img_to_array(image).reshape((1, 224, 224, 3))
    test_image = vgg16.preprocess_input(test_image)
    pred = p_model.predict(test_image)
    label = vgg16.decode_predictions(pred)
    pred_class = label[0][0]
    print(pred_class[1], pred_class[2]*100)

path = './imageNet/'
file_list = os.listdir(path)
for f in file_list:
    fn_predict(model, path + f)