from sklearn.metrics import r2_score

y_true = [3, 5, 7, 9]
y_pred = [2, 5, 8, 10]

#결정계수 출력
print(r2_score(y_true, y_pred))