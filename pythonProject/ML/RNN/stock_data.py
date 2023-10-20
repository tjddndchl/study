import FinanceDataReader as fdr
import pandas as pd
import datetime
from pandas.tseries.offsets import BDay
from pytimekr import pytimekr
# pip install -u finance-datareader
# pip install pytimekr

stock = fdr.DataReader('AAPL')
stock['Close'].plot()
# print(stock.head())
# print(stock.info())

def fn_get_stock(p_code, p_start, p_end):
    df = fdr.DataReader(p_code, p_start,p_end)
    # 기존에 index는 날짜를 -> 년원일로 저장
    df_stock  = df.reset_index()
    seq = df_stock['Date'].dt.strftime('%Y-%m-%d')
    x_data = df_stock[['Close']].astype(str)
    x_data['Date'] = seq
    file_nm = "{0}_{1}_{2}.xlsx".format(p_code
                                        ,p_start.replace('-',''), p_end.replace('-', ''))
    writer = pd.ExcelWriter(file_nm, engine='openpyxl')
    x_data.to_excel(writer, 'Sheet1')
    writer._save()
    print(x_data.head())
fn_get_stock('AAPL', '2000-01-01', '2023-10-20')


def fn_workingday(b_day):
    today = datetime.datetime.now()
    start = datetime.datetime.today() - BDay(b_day)
    end = datetime.datetime.today()
    #print(start.strftime('%Y-%m-%d'), end.strftime('%Y-%m-%d'))
    return start.strftime('%Y-%m-%d'), end.strftime('%Y-%m-%d')

#p_st, p_end = fn_workingday(51)
# print(p_st, p_end)
# fn_get_stock('AAPL',p_st, p_end)
