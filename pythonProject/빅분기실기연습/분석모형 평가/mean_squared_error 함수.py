from sklearn.metrics import mean_squared_error

y_true = [3, 5, 7 ,9]
y_pred = [2, 5, 8, 10]

#MSE 값을 계산하여 출력
print(mean_squared_error(y_true, y_pred))

#RMSE 값을 계산하여 출력
print(mean_squared_error(y_true, y_pred, squared=False)) 