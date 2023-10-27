#index 화면에서 파일 선택 후 예측 버튼을 클릭하면
# 어떤 이미지 인지 분류하여 화면에 출력
from flask import Flask, render_template, request, jsonify
import tensorflow as tf
from PIL import Image
import numpy as np
import os
from werkzeug.utils import secure_filename

app = Flask(__name__)
#모델 불러오기
model = tf.keras.models.load_model('dental_model.h5')
labels = ['cured', 'decayed', 'healthy']

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/upload', methods=['POST'])
def upload_file():
    if 'image' not in request.files:
        return jsonify({'error': 'no file upload'}), 400
    f = request.files['image']
    if f.filename == '':
        return jsonify({'error': 'no file selected'}), 400
    image = Image.open(f)
    image = image.resize((224, 224))
    image_array = np.array(image)
    #reshape 함수와 같이
    image_array = image_array.reshape(1, *image_array.shape)
    #image_array = image_array[tf.newaxis, ...]

    pred = model.predict(image_array)
    print(pred)
    pred_class = np.argmax(pred, axis=-1)[0]
    return jsonify({'prediction': labels[pred_class]})

if __name__ == '__main__':
    app.run(debug=True)
