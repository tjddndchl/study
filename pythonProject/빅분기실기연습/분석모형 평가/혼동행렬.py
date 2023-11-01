from sklearn.metrics import confusion_matrix #혼동행렬
from  sklearn.metrics import accuracy_score # 정확도
from sklearn.metrics import recall_score  # 재현율
from sklearn.metrics import precision_score # 정밀도
from sklearn.metrics import f1_score       # F1 점수
from sklearn.metrics import roc_auc_score  # AUC

y_true = [1, 0, 1, 0, 1]
y_pred = [1, 1, 1, 0, 0]

cm = confusion_matrix(y_true, y_pred)

print(cm)

print(accuracy_score(y_true, y_pred))

print(recall_score(y_true, y_pred))

print(precision_score(y_true, y_pred))

print(f1_score(y_true, y_pred))

print(roc_auc_score(y_true, y_pred))