# -*- coding: utf-8 -*-
# w rite, a ppend, r eadd
f = open('delay.txt', 'a')
f.write('오늘은 지각자\n')
while True:
    n = input('오늘 지각한 사람!!!(종료: q')
    if 'q' == n:
        break
    f.write(n)
    f.writelines('\n')
f.close()