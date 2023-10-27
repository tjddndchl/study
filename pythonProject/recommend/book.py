import os
import re
import nltk
import requests
import warnings
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt


from nltk.corpus import stopwords
nltk.download("stopwords")

from sklearn.feature_extraction.text import CountVectorizer
from sklearn.metrics.pairwise import cosine_similarity

from PIL import Image
warnings.filterwarnings('ignore')
for dirname, _, filenames in os.walk('dataset/kaggle/input'):
    for filename in filenames:
        print(os.path.join(dirname, filename))

books = pd.read_csv('dataset/kaggle/input/Books Data with Category Language and Summary/Preprocessed_data.csv')
print(books.head(3))

#결측치 정제
df = books.copy()
df.dropna(inplace=True) #데이터 프레임에서 결측치 제거
df.reset_index(drop=True, inplace=True)#데이터 프레임의 인덱스를 재설정 새로운열을 추가하지 않도록설정


df.drop(index=df[df['Category']== '9'].index, inplace=True) # 제거

df.drop(index=df[df['rating'] == 0].index, inplace=True) # 0인 비율 제거


#각 카테고리별의 특수문자와 밑줄을 공백으로 바꾸고 문자열 앞뒤의 공백을 제거
df['Category'] = df['Category'].apply(lambda  x: re.sub('[\W_]+', ' ',x).strip())

print(df.head())


def item_based_recommender(book_title):
    book_title = str(book_title)
    if book_title in df['book_title'].values:

        rating_counts = pd.DataFrame(df['book_title'].value_counts())
        rare_books = rating_counts[rating_counts['book_title'] <= 180].index
        common_books = df[~df['book_title'].isin(rare_books)]

        if book_title in rare_books:

            random = pd.Series(common_books['book_title'].unique()).sample(2).values
            print('There are no recommendations for this book')
            print('Try: \n')
            print('{}'.format(random[0]), '\n')
            print('{}'.format(random[1]), '\n')

        else:
            user_book_df = common_books.pivot_table(index=['user_id'],
                                                    columns=['book_title'],
                                                    values='rating')

            book = user_book_df[book_title]
            recom_data = pd.DataFrame(user_book_df.corrwith(book). \
                                      sort_values(ascending=False)).reset_index(drop=False)

            if book_title in [book for book in recom_data['book_title']]:
                recom_data = recom_data.drop(recom_data[recom_data['book_title'] == book_title].index[0])

            low_rating = []
            for i in recom_data['book_title']:
                if df[df['book_title'] == i]['rating'].mean() < 5:
                    low_rating.append(i)

            if recom_data.shape[0] - len(low_rating) > 5:
                recom_data = recom_data[~recom_data['book_title'].isin(low_rating)]

            recom_data = recom_data[0:5]
            recom_data.columns = ['book_title', 'corr']

            fig, axs = plt.subplots(1, 5, figsize=(18, 5))
            fig.suptitle('You may also like these books', size=22)
            for i in range(len(recom_data['book_title'].tolist())):
                url = books.loc[books['book_title'] == recom_data['book_title'].tolist()[i], 'img_l'][:1].values[0]
                im = Image.open(requests.get(url, stream=True).raw)
                axs[i].imshow(im)
                axs[i].axis("off")
                axs[i].set_title('Rating: {}'.format(
                    round(df[df['book_title'] == recom_data['book_title'].tolist()[i]]['rating'].mean(), 1)),
                                 y=-0.18,
                                 color="red",
                                 fontsize=18)
                fig.show()
    else:
        print('Cant find book in dataset, please check spelling')


item_based_recommender('Fahrenheit 451')


item_based_recommender('Divine Secrets of the Ya-Ya Sisterhood: A Novel')


def content_based_recommender(book_title):
    book_title = str(book_title)
    if book_title in df['book_title'].values:
        rating_counts = pd.DataFrame(df['book_title'].value_counts())
        rare_books = rating_counts[rating_counts['book_title'] <= 100].index
        common_books = df[~df['book_title'].isin(rare_books)]

        if book_title in rare_books:

            random = pd.Series(common_books['book_title'].unique()).sample(2).values
            print('There are no recommendations for this book')
            print('Try: \n')
            print('{}'.format(random[0]), '\n')
            print('{}'.format(random[1]), '\n')

        else:

            common_books = common_books.drop_duplicates(subset=['book_title'])
            common_books.reset_index(inplace=True)
            common_books['index'] = [i for i in range(common_books.shape[0])]
            target_cols = ['book_title', 'book_author', 'publisher', 'Category']
            common_books['combined_features'] = [' '.join(common_books[target_cols].iloc[i,].values) for i in
                                                 range(common_books[target_cols].shape[0])]
            cv = CountVectorizer()
            count_matrix = cv.fit_transform(common_books['combined_features'])
            cosine_sim = cosine_similarity(count_matrix)
            index = common_books[common_books['book_title'] == book_title]['index'].values[0]
            sim_books = list(enumerate(cosine_sim[index]))
            sorted_sim_books = sorted(sim_books, key=lambda x: x[1],
                                      reverse=True)[1:6]

            books = []
            for i in range(len(sorted_sim_books)):
                books.append(common_books[common_books['index'] == sorted_sim_books[i][0]]['book_title'].item())

            fig, axs = plt.subplots(1, 5, figsize=(18, 5))
            fig.suptitle('You may also like these books', size=22)
            for i in range(len(books)):
                url = common_books.loc[common_books['book_title'] == books[i], 'img_l'][:1].values[0]
                im = Image.open(requests.get(url, stream=True).raw)
                axs[i].imshow(im)
                axs[i].axis("off")
                axs[i].set_title('Rating: {}'.format(round(df[df['book_title'] == books[i]]['rating'].mean(), 1)),
                                 y=-0.18,
                                 color="red",
                                 fontsize=18)
                fig.show()

    else:

        print('Cant find book in dataset, please check spelling')


content_based_recommender('The Testament')

content_based_recommender('1st to Die: A Novel')


content_based_recommender('Harry Potter and the Order of the Phoenix (Book 5)')


def content_based_recommender2(book_title):
    book_title = str(book_title)
    if book_title in df['book_title'].values:
        rating_counts = pd.DataFrame(df['book_title'].value_counts())
        rare_books = rating_counts[rating_counts['book_title'] <= 100].index
        common_books = df[~df['book_title'].isin(rare_books)]

        if book_title in rare_books:

            random = pd.Series(common_books['book_title'].unique()).sample(2).values
            print('There are no recommendations for this book')
            print('Try: \n')
            print('{}'.format(random[0]), '\n')
            print('{}'.format(random[1]), '\n')

        else:
            common_books = common_books.drop_duplicates(subset=['book_title'])
            common_books.reset_index(inplace=True)
            common_books['index'] = [i for i in range(common_books.shape[0])]

            summary_filtered = []
            for i in common_books['Summary']:
                i = re.sub("[^a-zA-Z]", " ", i).lower()
                i = nltk.word_tokenize(i)
                i = [word for word in i if not word in set(stopwords.words("english"))]
                i = " ".join(i)
                summary_filtered.append(i)

            common_books['Summary'] = summary_filtered
            cv = CountVectorizer()
            count_matrix = cv.fit_transform(common_books['Summary'])
            cosine_sim = cosine_similarity(count_matrix)
            index = common_books[common_books['book_title'] == book_title]['index'].values[0]
            sim_books = list(enumerate(cosine_sim[index]))
            sorted_sim_books = sorted(sim_books, key=lambda x: x[1], reverse=True)[1:6]

            books = []
            for i in range(len(sorted_sim_books)):
                books.append(common_books[common_books['index'] == sorted_sim_books[i][0]]['book_title'].item())

            fig, axs = plt.subplots(1, 5, figsize=(18, 5))
            fig.suptitle('You may also like these books', size=22)
            for i in range(len(books)):
                url = common_books.loc[common_books['book_title'] == books[i], 'img_l'][:1].values[0]
                im = Image.open(requests.get(url, stream=True).raw)
                axs[i].imshow(im)
                axs[i].axis("off")
                axs[i].set_title('Rating: {}'.format(round(df[df['book_title'] == books[i]]['rating'].mean(), 1)),
                                 y=-0.18,
                                 color="red",
                                 fontsize=18)
                fig.show()

    else:

        print('Cant find book in dataset, please check spelling')


content_based_recommender2('To Kill a Mockingbird')

content_based_recommender2('A Walk to Remember')