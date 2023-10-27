import easyocr
import cv2

reader = easyocr.Reader(['en', 'ko'])
def fn_get_text(path):
    img = cv2.imread(path, cv2.IMREAD_GRAYSCALE)
    height, width = img.shape
    result = reader.readtext(img)
    print(result)
    result_dataset = []
    for bbox, text, prob in result:
        if prob > 0.1:
            result_dataset.append({'text':text, 'bbox':bbox, 'prob':prob})
    for i, v in enumerate(result_dataset):
        print(v['text'], v['bbox'], v['prob'])
    draw_bbox(path, result_dataset)
def draw_bbox(path, data):
    img = cv2.imread(path)
    for d in data:
        bbox = d['bbox']
        start_point = (int(bbox[0][0]), int(bbox[0][1]))  # Convert to integers
        end_point = (int(bbox[2][0]), int(bbox[2][1]))  # Convert to integers
        #사각형 그리기
        color = (0, 255, 0)
        thinkness = 2
        img = cv2.rectangle(img, start_point, end_point, color, thinkness)
    cv2.imwrite('output.jpg', img)


if __name__ == '__main__':
    fn_get_text('text.jpg')
