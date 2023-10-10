import easyocr
import cx_Oracle
import glob
import os
import shutil  # shutil 모듈 추가
import logging

print("backup start")
# 로그 설정
logging.basicConfig(filename='script_log.txt', level=logging.INFO, format='%(asctime)s - %(levelname)s: %(message)s')
# 오라클 데이터베이스 연결
conn = cx_Oracle.connect("test", "test", "localhost:1521/xe")

# 이미지에서 텍스트 추출
reader = easyocr.Reader(['ko', 'en'])
image_directory = "C:/dev/pythonProject/OCR/test/"  # 이미지 파일이 있는 디렉토리 경로
backup_directory = "C:/dev/pythonProject/OCR/backup/"  # 백업할 디렉토리 경로


if not os.path.exists(backup_directory):
    os.makedirs(backup_directory)

# test 디렉토리 안에 있는 모든 이미지 파일 경로 가져오기
image_paths = glob.glob(os.path.join(image_directory, "*.png"))
print(image_paths)
data_to_insert = []
print("========================")
for image_path in image_paths:
    results = reader.readtext(image_path)
    print("***************************")
    arr = []
    for result in results:
        arr.append(result[1])

    a = arr[0:-1]  # 나눠진 문제
    b = arr[-1]    # 답

    q = ''  # 다시 합칠려고하는 것
    for i in a:
        q += i

    cursor = conn.cursor()
    try:
        # 중복된 quiz_pb가 있는 경우에도 INSERT 수행
        cursor.execute("""
            MERGE INTO QUIZ q
            USING DUAL
            ON (q.quiz_pb = :1)
            WHEN MATCHED THEN
                UPDATE SET q.quiz_ans = :2
            WHEN NOT MATCHED THEN
                INSERT (q.quiz_num, q.quiz_pb, q.quiz_ans)
                VALUES (SEQ_QUIZ_NUM.NEXTVAL, :1, :2)
        """, (q, b))
        print("++++++++++++++++++++++++++++++")
    except cx_Oracle.IntegrityError as e:
        cursor.execute("""
            UPDATE QUIZ
            SET quiz_ans = :2
            WHERE quiz_pb = :1
        """, (q, b))


    backup_path = os.path.join(backup_directory, os.path.basename(image_path))
    shutil.move(image_path, backup_path)

conn.commit()
conn.close()