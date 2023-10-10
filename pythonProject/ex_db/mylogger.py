import logging

def make_logger(name=None):
    #로그생성
    logger = logging.getLogger(name)
    #logger level
    logger.setLevel(logging.DEBUG)
    #formatter 설정
    formatter = logging.Formatter("%(asctime)s-%(name)s-%(levelname)s-%(message)s")
    #handler 설정
    console = logging.StreamHandler()
    file_handler = logging.FileHandler(filename="logfile.log")
    console.setFormatter(logging.INFO)
    file_handler.setLevel(logging.DEBUG)

    #출력 format 지정
    console.setFormatter(formatter)
    file_handler.setFormatter(formatter)
    #logger에 handler 추가
    logger.addHandler(console)
    logger.addHandler(file_handler)
    return logger