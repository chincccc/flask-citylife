import threading, time

flag = 0


def listen(str):
    while (True):
        print(str)
        if (check):
            send_email('邮箱地址')
        time.sleep(10)  # 检查间隔时间


def check():
    bool = True  # 写查库存方法
    return bool


def send_email(email):
    global flag
    if (flag == 0):
        print(email)
        # 这里写发邮件代码,
        flag = 1


def send_cd():
    global flag
    while (True):
        flag = 0
        time.sleep(3600)  # cd一小时


t1=threading.Thread(target=listen, args=("参数",)).start()
t2=threading.Thread(target=send_cd).start()


import inspect
import ctypes
def _async_raise(tid, exctype):
    """raises the exception, performs cleanup if needed"""
    tid = ctypes.c_long(tid)
    if not inspect.isclass(exctype):
        exctype = type(exctype)
    res = ctypes.pythonapi.PyThreadState_SetAsyncExc(tid, ctypes.py_object(exctype))
    if res == 0:
        raise ValueError("invalid thread id")
    elif res != 1:
        # """if it returns a number greater than one, you're in trouble,
        # and you should call it again with exc=NULL to revert the effect"""
        ctypes.pythonapi.PyThreadState_SetAsyncExc(tid, None)
        raise SystemError("PyThreadState_SetAsyncExc failed")
def stop_thread(thread):
    _async_raise(thread.ident, SystemExit)

threading.Thread(target=send_cd).Condition()
