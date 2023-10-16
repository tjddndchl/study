def solution(s, n):
    result = ""

    for char in s:
        if char.isalpha():
            # 알파벳 문자인 경우만 암호화
            if char.islower():
                # 소문자 알파벳인 경우
                shifted_char = chr(((ord(char) - ord('a') + n) % 26) + ord('a'))
            else:
                # 대문자 알파벳인 경우
                shifted_char = chr(((ord(char) - ord('A') + n) % 26) + ord('A'))
        else:
            # 알파벳이 아닌 경우 (공백, 기호 등) 그대로 유지
            shifted_char = char

        result += shifted_char

    return result
