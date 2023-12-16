import pandas as pd
from sqlalchemy import create_engine

# MySQL 연결 설정
connection_config = {
    'host': '192.168.0.40',
    'user': 'care',
    'password': 'care',
    'database': 'caredb'
}

# MySQL 연결 엔진 생성
db_connection_str = f"mysql+pymysql://{connection_config['user']}:{connection_config['password']}@{connection_config['host']}:3306/{connection_config['database']}"
db_connection = create_engine(db_connection_str)

# CSV 파일 읽기

df = pd.read_csv("다른평균가구전기가스수도사용량.csv", encoding='cp949')

# MySQL 테이블에 데이터프레임 삽입 (열을 지정하지 않음)
df.to_sql('TB_USE_OF_FURNITURE', con=db_connection, if_exists='replace', index=False)

print('데이터가 MySQL 테이블에 성공적으로 적재되었습니다.')

