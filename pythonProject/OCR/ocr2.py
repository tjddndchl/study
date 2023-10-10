import easyocr
import cx_Oracle
import glob
import os

# 오라클 데이터베이스 연결
conn = cx_Oracle.connect("test", "test", "localhost:1521/xe")

# 이미지에서 텍스트 추출
reader = easyocr.Reader(['ko', 'en'])
image_directory = "./test/"  # 이미지 파일이 있는 디렉토리 경로

# test 디렉토리 안에 있는 모든 이미지 파일 경로 가져오기
image_paths = glob.glob(os.path.join(image_directory, "*.png"))
data_to_insert = []


for image_path in image_paths:
    results = reader.readtext(image_path)

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
    except cx_Oracle.IntegrityError as e:

        cursor.execute("""
            UPDATE QUIZ
            SET quiz_ans = :2
            WHERE quiz_pb = :1
        """, (q, b))

conn.commit()


conn.close()

