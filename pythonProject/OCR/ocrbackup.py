import easyocr
import cx_Oracle
import glob
import os
import shutil
import logging
import openai

# 로그 설정
logging.basicConfig(filename='script_log.txt', level=logging.INFO, format='%(asctime)s - %(levelname)s: %(message)s')

# 오라클 데이터베이스 연결
conn = cx_Oracle.connect("test", "test", "localhost:1521/xe")

# 이미지에서 텍스트 추출
reader = easyocr.Reader(['ko', 'en'])
image_directory = "C:/dev/study/pythonProject/OCR/test/"
backup_directory = "C:/dev/study/pythonProject/OCR/backup/"

if not os.path.exists(backup_directory):
    os.makedirs(backup_directory)

# test 디렉토리 안에 있는 모든 이미지 파일 경로 가져오기
image_paths = glob.glob(os.path.join(image_directory, '*.png'))

# OpenAI API 키 설정
api_key = "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"
openai.api_key = api_key

for image_path in image_paths:
    results = reader.readtext(image_path)
    arr = [result[1] for result in results]

    # 이미지에서 추출한 텍스트를 기반으로 문제 생성 (GPT-3 활용)
    answer = " ".join(arr)  # 전체다
    prompt = (f"Create a quiz with this {answer} as the answer. Please ensure that this {answer} is not included in the question")

    response = openai.Completion.create(
        engine="davinci",
        prompt=prompt,
        max_tokens= 70,  # 생성할 문제 길이 제한
        n=1,  # 생성할 문제 수
        stop=None,
        temperature=0.6  # 난수 생성 옵션
    )

    question = response.choices[0].text.strip()


    cursor = conn.cursor()
    try:
        cursor.execute("""
            MERGE INTO QUIZ q
            USING DUAL
            ON (q.quiz_pb = :1)
            WHEN MATCHED THEN
                UPDATE SET q.quiz_ans = :2
            WHEN NOT MATCHED THEN
                INSERT (q.quiz_num, q.quiz_pb, q.quiz_ans)
                VALUES (SEQ_QUIZ_NUM.NEXTVAL, :1, :2)
        """, (question, answer))
    except cx_Oracle.IntegrityError as e:
        cursor.execute("""
            UPDATE QUIZ
            SET quiz_ans = :2
            WHERE quiz_pb = :1
        """, (question, answer))

    backup_path = os.path.join(backup_directory, os.path.basename(image_path))
    shutil.move(image_path, backup_path)

conn.commit()
conn.close()