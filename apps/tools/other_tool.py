import datetime,glob,smtplib,time
from email.mime.text import MIMEText
from email.header import Header
from email.mime.multipart import MIMEMultipart
import random
from PIL import Image
import re
import os,base64
from lxml import etree
from lxml import html
import requests


def getnowtime(type='cn'):
    if type == '/':
        return str(datetime.datetime.now().strftime('%Y/%m/%d/%H/%M'))
    if type == '':
        return str(datetime.datetime.now().strftime('%y%m%d%H%M'))
    if type == 'cn':
        return str(datetime.datetime.now().strftime('%Y年%m月%d日 %H:%M'))
    if type == '-':
        return str(datetime.datetime.now().strftime('%Y-%m-%d %H:%M'))


def send_email(yzm, user_email, test=0):
    if test == 1:
        return True
    from_addr = 'chin.cc@qq.com' #改自己的邮箱
    qqCode = 'vey**********fej' #改自己的邮箱口令
    smtp_server = 'smtp.qq.com'
    smtp_port = 465
    stmp = smtplib.SMTP_SSL(smtp_server, smtp_port)
    stmp.login(from_addr, qqCode)
    message = MIMEMultipart()
    message['From'] = Header("阿拉宁波", 'utf-8')
    message['To'] = Header(" ", 'utf-8')
    subject = '阿拉宁波-注册验证码'
    message['Subject'] = Header(subject, 'utf-8')
    message.attach(MIMEText(user_email +
                            '您好：\n    感谢您注册阿拉宁波。\n\n    这是一封注册激活邮件，请将下列6位数字激活码输入到激活页面。\n\n激活码：'
                            + yzm + '\n\n    上述6位数字激活码的有效期为1小时，如果你收到多封邮件，请以最后一封邮件中的激活码为准。\n\n如果你没有注册过阿拉宁波，你可以忽略这封邮件。',
                            'plain', 'utf-8'))
    try:
        stmp.sendmail(from_addr, user_email, message.as_string())
    except Exception as e:
        print('发送失败' + str(e))
        return False
    print('邮件发送成功')
    return True


def get_rand(n):
    yzm = ''
    for i in range(n):
        yzm = yzm + str(random.randrange(10))
    return yzm


def HtmlToText(str, n=0):
    str = str.replace('</', ' </')
    pattern = re.compile(r'<[^>]+>', re.S)
    result = pattern.sub('', str)
    if n!=0:
        result=result[0:n]
    return result

def re_filename(filename,user):
    f_type=filename[filename.rfind('.'):]
    new_name = time.strftime(user+"_%Y%m%d_%H%M%S", time.localtime())
    return new_name+f_type


def get_FileSize(picture):
    f1 = os.path.getsize(picture)
    f2 = f1 / float(1024)
    return f2


def zip_img():
    # 按比例减小分辨率
    def small(SIZE):
        SIZE *= 0.99
        return SIZE
    a = float(input("图片大小限制kb："))

    # 处理过程
    for infile in glob.glob('*.jpg'):
        file, ext = os.path.splitext(infile)
        im = Image.open(infile)

        # 获取图片像素
        b = get_FileSize(infile)
        size = im.size
        size1, size2 = size

        # 循环至达到要求
        while b > a:
            size1, size2 = small(size1), small(size2)
            size = size1, size2
            im.thumbnail(size, Image.ANTIALIAS)
            im.save(file + 'add.jpg', 'jpeg')
            b = get_FileSize(file + 'add.jpg')




def Base64_PNG(str_base64='',id='none',type=''):
    if str_base64 =='':
        return ''
    elif '/static/' in str_base64:
        return str_base64
    else:
        str_base64 = str_base64.split("data:image/png;base64,")[1]
        print(len(str_base64))
        imagedata = base64.b64decode(str.encode(str_base64))  # 解码
        if type=='tx':
            filedir = './static/tx_upload/uid' + str(id)+'_'+getnowtime('')+'.png'
        elif type=='article':
            filedir = './static/upload/top_img/uid' + str(id)+'_'+getnowtime('') + '.png'
        file = open(filedir, "wb")
        file.write(imagedata)
        file.close()
        filedir = filedir[1:]
        return filedir


def test():
    from collections import Counter
    print(dict(Counter([1, 2, 2, 2, 2, 3, 3, 3, 4, 4, 4, 4])))
    n=dict(Counter([1, 2, 2, 2, 2, 3, 3, 3, 4, 4, 4, 4]))
    for key, value in n.items():
        print(str(key) + ": " + str(value))


def getTopNews(num=8):
    headers = {
        'User-Agent': 'User-Agent:Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_8; en-us) AppleWebKit/534.50 (KHTML, like Gecko) Version/5.1 Safari/534.50'}
    r = requests.get(
        'https://quark.sm.cn/s?from=kkframenew&uc_param_str=dnntnwvepffrgibijbprsvpidsdichei&q=%E6%96%B0%E9%97%BB%E7%83%AD%E7%82%B9',
        headers=headers)
    r.encoding = r.apparent_encoding
    tree = etree.HTML(r.text)
    all_title = tree.xpath('//*[@class="c-title-s news-top-list-item-title"]/text()')
    all_link = tree.xpath('//*[@class="news-top-list-item c-padding-top-l c-border-bottom c-padding-bottom-l"]/@href')
    all_watch = tree.xpath('//*[@class="news-top-list-item-number c-font-s c-font-dark"]/text()')

    class news:
        def __init__(self, index, title, link, watch):
            self.newsindex = index
            self.newstitle = title
            self.newslink = link
            self.newswatch = watch

        def speak(self):
            return str(self.newsindex) + " " + self.newstitle + " " + self.newslink + " " + self.newswatch

    all = []
    for i in range(len(all_title)):
        all.append(news(i + 1, all_title[i], all_link[i], all_watch[i]))
    if num==0:
        num=len(all_title)
    re_news = []
    for i in range(num):
        re_news.append(all[i])
    return re_news


def get_new(link):
    headers = {
        'User-Agent': 'User-Agent:Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_8; en-us) AppleWebKit/534.50 (KHTML, like Gecko) Version/5.1 Safari/534.50'}
    res = requests.get(str(base64.b64decode(link),"utf-8"), headers=headers)
    tree = etree.HTML(res.content)
    div = tree.xpath('//div[@class="c-weibo--v1_0_0"]')[0]
    div_str = etree.tostring(div, encoding='utf-8')
    return div_str.decode('utf-8')

if __name__ == '__main__':
    test()
