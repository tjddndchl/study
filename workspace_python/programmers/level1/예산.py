def solution(d, budget):
    answer = 0
    b = d
    result = 0
    while b:
        min_val = min(b)
        if result + min_val <= budget:
            result += min_val
            answer += 1
            b.remove(min_val)
        else:
            break

    return answer

d = [1, 3, 2, 2, 5] # [] 중복허용, {} 중복 허용하지않음
budget = 9

print(solution(d, budget))