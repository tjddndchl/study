from flask import Flask, request, jsonify, render_template
import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.model_selection import train_test_split
from sklearn.metrics.pairwise import linear_kernel
from sklearn.metrics import precision_score, recall_score, f1_score, average_precision_score

app = Flask(__name__)

# 데이터 로드 및 전처리
data = pd.read_csv("./dataset/imdb_anime.csv")
data = data[pd.to_numeric(data['User Rating'], errors='coerce').notna()]
data['Genres'] = data['Genre'].str.split('. ')
data['User Rating'] = data['User Rating'].astype(float)
data['Gross'] = data['Gross'].str.replace(',', '').astype(float)

tfidf_Vectorizer = TfidfVectorizer(token_pattern=r'[a-zA-Z0-9]+', lowercase=True)
tfidf_matrix = tfidf_Vectorizer.fit_transform(data['Genre'].apply(lambda x: ' '.join(x)))

cosine_sim = linear_kernel(tfidf_matrix, tfidf_matrix)


# 데이터 분할 (평가 지표 개선을 위한 추가적인 데이터 준비)



def get_recommendations(title):
    idx = data[data['Title'] == title].index[0]
    sim_scores = list(enumerate(cosine_sim[idx]))
    sim_scores = sorted(sim_scores, key=lambda x: x[1], reverse=True)
    sim_scores = sim_scores[1:11]
    anime_indices = [i[0] for i in sim_scores]

    return data[['Title', 'Genre', 'User Rating', 'Gross']].iloc[anime_indices].to_dict(orient='records')

@app.route('/recommendations', methods=['GET','POST'])
def index():
    recommendations = []
    if request.method == 'POST':
        user_input = request.form['anime_title']
        recommendations = get_recommendations(user_input)
        return jsonify(recommendations)
    else:
        return render_template('index.html')
if __name__ == '__main__':
    app.run(debug=True)