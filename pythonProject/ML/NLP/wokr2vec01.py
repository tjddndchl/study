# pip install gensim
import requests
import re
import os
from gensim.models.word2vec import Word2Vec

res = requests.get('https://www.gutenberg.org/files/2591/2591-0.txt')
grimm=res.text[2801:530661]
grimm=re.sub(r'[^a-zA-Z\.]',' ',grimm)
sentence=grimm.split('. ')
data=[s.split() for s in sentence]
print(data)
embedding_model = Word2Vec(data,sg=1,
                           vector_size=100,
                           window=3,  #앞뒤단어 3개씩
                           min_count=3,
                           workers=4)
embedding_model.save("book.model")
print(embedding_model)

while True:
    text1,text2=input("비교 단어를 입력(end=q):").split()
    if text1=='q':
        break
    else:
        print("가까운 단어:"
              , embedding_model.wv.most_similar(positive=[text1,text2]))
        print("먼 단어"
              , embedding_model.wv.most_similar(negative=[text1,text2]))
