# pip install easyOCR
# pip install opencv-python
import easyocr
reader = easyocr.Reader(['ko','en'])

results = reader.readtext('./test/1.png')
for result in results:
    text = result[1]
    print(text)