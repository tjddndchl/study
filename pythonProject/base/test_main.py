#import lotto_file
#arr = lotto_file.fn_lotto(5)
#from lotto_file import  fn_lotto
from lotto_file import*
arr = fn_lotto(3)
print(arr)

from lotto_file import fn_lotto as l
arr2 = l(10)
print(arr2)
from  base2.lotto_file import fn_lotto as la

arr3 = la(5)
print(arr3)