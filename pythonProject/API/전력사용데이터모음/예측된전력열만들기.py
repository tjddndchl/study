import joblib
import pandas as pd
import itertools

# 모델 및 Scaler 로드
loaded_scaler = joblib.load('scaler.pk1')
loaded_model = joblib.load('ensemble_model.pk1')
loaded_label_encoders = joblib.load('label_encoders.pk1')

# 필요한 특성(features) 및 label_encoders 설정 (모델을 학습한 원래 코드에서 가져옵니다)
features = ['year', 'month', 'metro', 'city']
label_encoders = loaded_label_encoders  # 필요한 경우 label_encoders도 복원

# 예측할 연도 및 월 설정
years = list(range(2013, 2024))
months = list(range(1, 13))
metros = ['서울특별시', '부산광역시', '대구광역시', '인천광역시', '광주광역시', '대전광역시', '울산광역시', '경기도', '강원도', '충청북도', '충청남도', '전라북도', '전라남도', '경상북도', '경상남도', '제주특별자치도']
cities_seoul =['중구', '용산구', '광진구', '중랑구', '양천구', '송파구', '금천구', '성동구', '은평구', '구로구', '동대문구', '성북구', '도봉구', '마포구', '동작구', '관악구', '강남구', '강동구', '종로구', '강북구', '서대문구', '강서구', '영등포구', '노원구', '서초구']
cities_busan = [
    '서구', '영도구', '중구', '부산진구', '해운대구', '수영구', '사하구', '사상구',
    '남구', '북구', '동구', '동래구', '금정구', '강서구', '연제구', '기장군'
]
cities_daegu = [
    '북구', '수성구', '서구', '동구', '달성군', '중구', '남구', '달서구', '군위군'
]

cities_incheon = [
    '동구', '연수구', '옹진군', '부평구', '서구', '중구', '남구', '계양구', '남동구', '강화군', '미추홀구'
]

cities_gwangju = [
    '북구', '광산구', '서구', '남구', '동구'
]
cities_daejeon = [
    '대덕구', '중구', '동구', '서구', '유성구'
]

cities_ulsan = [
    '중구', '북구', '울주군', '남구', '동구'
]

cities_gyeonggi=[    '과천시', '구리시', '군포시', '가평군', '안성시', '성남시 중원구', '성남시 분당구', '수원시 영통구', '용인시 수지구',
    '하남시', '화성시', '안양시 만안구', '고양시 일산동구', '안산시 상록구', '시흥시', '여주시', '연천군', '포천시',
    '안산시 단원구', '부천시 소사구', '오산시', '용인시 처인구', '부천시 원미구', '성남시 수정구', '고양시 덕양구', '용인시 기흥구',
    '의왕시', '남양주시', '양주시', '김포시', '의정부시', '평택시', '광주시', '수원시 장안구', '고양시 일산서구', '파주시',
    '부천시 오정구', '광명시', '동두천시', '양평군', '이천시', '수원시 권선구', '수원시 팔달구', '안양시 동안구', '부천시 남구',
    '부천시', '고양시', '안산시', '수원시', '안양시', '용인시', '성남시']
cities_gawang=[   '횡성군', '영월군', '정선군', '화천군', '양양군', '춘천시', '홍천군', '철원군', '동해시', '태백시',
    '삼척시', '인제군', '평창군', '원주시', '고성군', '강릉시', '양구군', '속초시']
cities_chongchungnam=[    '공주시', '홍성군', '태안군', '아산시', '예산군', '보령시', '천안시 동남구', '연기군',
    '천안시 서북구', '당진시', '금산군', '계룡시', '부여군', '서천군', '서산시', '논산시', '청양군',
    '천안시']
cities_chongchungbook=[  '단양군', '음성군', '괴산군', '청원군', '옥천군', '영동군', '청주시 상당구', '제천시',
    '진천군', '보은군', '충주시', '청주시 흥덕구', '증평군', '청주시 청원구', '청주시 서원구', '청주시']
cities_jeollanam=[   '구례군', '해남군', '여수시', '강진군', '장성군', '완도군', '함평군', '나주시',
    '영암군', '진도군', '곡성군', '장흥군', '신안군', '목포시', '순천시', '담양군',
    '고흥군', '화순군', '무안군', '영광군', '보성군', '광양시']
cities_jeollabook=[   '장수군', '순창군', '전주시 덕진구', '부안군', '군산시', '김제시', '무주군', '고창군',
    '익산시', '전주시 완산구', '정읍시', '남원시', '임실군', '진안군', '완주군', '전주시']
cities_gyeongsangbook=[   '경주시', '문경시', '청송군', '예천군', '구미시', '영주시', '상주시', '고령군', '영천시',
    '울진군', '봉화군', '안동시', '의성군', '울릉군', '청도군', '성주군', '포항시 북구', '김천시',
    '경산시', '군위군', '영양군', '영덕군', '칠곡군', '포항시 남구', '포항시']
cities_gyeongsangnam=[   '하동군', '합천군', '창원시 마산합포구', '사천시', '함안군', '남해군', '거창군', '창원시 의창구', '통영시',
    '창녕군', '고성군', '산청군', '창원시 성산구', '밀양시', '의령군', '양산시', '창원시 진해구', '김해시',
    '거제시', '진주시', '함양군', '창원시 마산회원구', '창원시 청원구', '창원시']
cities_jeju=['제주시', '서귀포시']
# 결과를 저장할 데이터프레임 생성
predictions_df = pd.DataFrame(columns=['year', 'month', 'metro', 'city', 'predicted_power_usage'])

# 결과를 저장할 리스트 생성
predictions_list = []

# 반복문을 사용하여 모든 경우에 대한 예측값 조회
for year, month, metro, city in itertools.product(years, months, metros, cities_seoul + cities_busan + cities_daegu + cities_incheon
                                                  + cities_gwangju + cities_daejeon + cities_ulsan + cities_gyeonggi + cities_gawang
                                                  + cities_chongchungbook + cities_chongchungnam + cities_jeollabook + cities_jeollanam
                                                  + cities_gyeongsangbook + cities_gyeongsangnam + cities_jeju):
    if metro == '서울특별시':
        cities = cities_seoul
    elif metro == '부산광역시':
        cities = cities_busan
    elif metro == "대구광역시":
        cities = cities_daegu
    elif metro == "인천광역시":
        cities = cities_incheon
    elif metro == "광주광역시":
        cities = cities_gwangju
    elif metro == "대전광역시":
        cities = cities_daejeon
    elif metro == "울산광역시":
        cities = cities_ulsan
    elif metro == "경기도":
        cities = cities_gyeonggi
    elif metro == "강원도":
        cities = cities_gawang
    elif metro == "충청북도":
        cities = cities_chongchungbook
    elif metro == "충청남도":
        cities = cities_chongchungnam
    elif metro == "전라북도":
        cities = cities_jeollabook
    elif metro == "전라남도":
        cities = cities_jeollanam
    elif metro == "경상북도":
        cities = cities_gyeongsangbook
    elif metro == "경상남도":
        cities = cities_gyeongsangnam

    elif metro == "제주특별자치도":
        cities = cities_jeju

    else:
        continue

    if city not in cities:
        continue

    # 새로운 입력 데이터를 2D 배열로 변환
    new_input_data = [[year, month, metro, city]]
    new_input_data_df = pd.DataFrame(new_input_data, columns=features)

    # 범주형 특성 변환 (새로운 입력 데이터에 대해서도 수행)
    for i, feature in enumerate(features):
        if feature in label_encoders:
            new_input_data_df[feature] = label_encoders[feature].transform([new_input_data[0][i]])

    # 새로운 입력 데이터를 Scaler를 사용하여 변환
    new_input_data_np = loaded_scaler.transform(new_input_data_df)

    # 모델을 사용하여 예측
    new_prediction = loaded_model.predict(new_input_data_np)

    # 결과를 리스트에 추가
    predictions_list.append([year, month, metro, city, new_prediction[0]])

# 리스트를 DataFrame으로 변환
predictions_df = pd.DataFrame(predictions_list, columns=['year', 'month', 'metro', 'city', 'predicted_power_usage'])
predictions_df = predictions_df.drop_duplicates()


# 예측 결과를 새로운 CSV 파일로 저장 (UTF-8 인코딩 사용)
predictions_df.to_csv('예측결과_전력사용량.csv', index=False, encoding='utf-8-sig')

print('예측 결과가 "예측결과_전력사용량.csv" 파일로 저장되었습니다.')