from flask import Flask, request, render_template
from werkzeug.utils import secure_filename
import os
app = Flask(__name__)

#사용자가 파일을 업로드하면 서버 img 폴더에 파일이 저장되는
imgPath = './img/'
if not os.path.exists(imgPath):
    os.mkdir(imgPath)

@app.route('/')
def index():
    return "hi, Nick"

@app.route("/file_upload", methods=['GET', 'POST'])
def file_upload():
    if request.method == 'POST':
        f = request.files['file']
        filename = secure_filename(f.filename)
        save_path = os.path.join(imgPath, filename)
        f.save(save_path)
        return "파일 저장됨"
    else:
        return render_template('file_upload.html')
if __name__ == '__main__':
    app.run(debug=True)