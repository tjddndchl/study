import random
def fn_lotto(user_num):
    arr = []
    for i in range(user_num):
        lotto = set()
        while True:
            lotto.add(random.randint(1, 45))  # 랜덤 정수 1~ 45
            if len(lotto) == 6:
                break
        arr.append(lotto)
    print("good luck")
    return  arr

# 사용자가 로또 번호에 포함시키고 싶은 번호를 입력 받아
# 원하는 수량 만큼 로또 번호를 생성해주세요

# param1 : 수량, param2: 0~ 6 개의 1 ~ 45 사이의 수
# user = input("로또 수량과 희망하는 숫자를 띄어쓰리고 입력해주세요").split()
# print(user)
# user_1 = user[0]
# user_2 = user[1: ]
# print(user_2)
# 1 .수량만 있을 경우
# 2. 희망 하는 숫자가 1 ~6개 경우
# 3.희망 하는 숫자가 6개를 넘는 경우 -> 다시 입력 받기

def fn_lotto2(user_1,user_2):

    arr = []
    for i in range(int(user_1)):
        while True:
            if(len(user_2)>6):
                print("희망하는 숫자는 1개에서 6개 사이여야 합니다. 다시 입력하세요.")
                user_2 = input("희망하는 숫자를 입력하세요 (공백으로 구분): ").split()
            break
        lotto = set()
        while True:
            lotto.add(random.randint(1, 45))  # 랜덤 정수 1~ 45
            a = (lotto | (set(user_2)-lotto))
            if len(a) == 6:
                break
        arr.append(a)

    return arr

user = input("로또 수량과 희망하는 숫자를 띄어쓰리고 입력해주세요").split()

user_1 = user[0]
user_2 = user[1: ]

arr = fn_lotto2(user_1,user_2)
for i,v in enumerate(arr):
    print(v)
    
if __name__ == '__main__':
    my_lotto=fn_lotto(5)
    print(my_lotto)
else:
    print('임포트했을때')



# def fn_lotto2(user_1, user_2):
#     arr = []
#
#     for i in range(int(user_1)):
#         while True:
#             if len(user_2) < 1 or len(user_2) > 6:
#                 print("희망하는 숫자는 1개에서 6개 사이여야 합니다. 다시 입력하세요.")
#                 user_2 = input("희망하는 숫자를 입력하세요 (공백으로 구분): ").split()
#                 continue
#
#             try:
#                 user_numbers = [int(num) for num in user_2]
#                 if len(set(user_numbers)) != len(user_numbers):
#                     print("중복된 숫자가 있습니다. 다시 입력하세요.")
#                     user_2 = input("희망하는 숫자를 입력하세요 (공백으로 구분): ").split()
#                     continue
#                 if any(num < 1 or num > 45 for num in user_numbers):
#                     print("숫자는 1부터 45 사이의 값이어야 합니다. 다시 입력하세요.")
#                     user_2 = input("희망하는 숫자를 입력하세요 (공백으로 구분): ").split()
#                     continue
#             except ValueError:
#                 print("올바른 숫자를 입력하세요. 다시 입력하세요.")
#                 user_2 = input("희망하는 숫자를 입력하세요 (공백으로 구분): ").split()
#                 continue
#
#             lotto = set(user_numbers)
#             while len(lotto) < 6:
#                 lotto.add(random.randint(1, 45))
#
#             arr.append(lotto)
#             break
#
#     return arr
#
#
# user_1 = input("생성할 로또 번호의 수량을 입력하세요: ")
# user_2 = input("희망하는 숫자를 입력하세요 (공백으로 구분): ").split()
#
# print(fn_lotto2(user_1, user_2))