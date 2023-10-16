def solution(sizes):
    answer = 0
    max_width = 0
    max_height = 0
    for w, h in sizes:
        max_width = max(max_width,max(w, h))
        max_height =max(max_height,min(w, h))

    return max_height * max_width
sizes =[[14, 4], [19, 6], [6, 16], [18, 7], [7, 11]]

print(solution(sizes))