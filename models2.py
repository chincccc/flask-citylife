# coding: utf-8
from sqlalchemy import Column, DateTime, Float, Integer, String, Text
from sqlalchemy.schema import FetchedValue
from flask_sqlalchemy import SQLAlchemy


db = SQLAlchemy()



class Article(db.Model):
    __tablename__ = 'article'

    article_id = db.Column(db.Integer, primary_key=True)
    article_title = db.Column(db.String(100), nullable=False)
    article_summary = db.Column(db.String(3000, 'utf8_general_ci'), nullable=False)
    article_read_cnt = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())
    article_pl = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())
    article_sc = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())
    article_date = db.Column(db.String(255))
    article_url = db.Column(db.String(255, 'utf8_general_ci'))
    article_type = db.Column(db.String(20, 'utf8_general_ci'))
    user_id = db.Column(db.Integer, nullable=False)



class ArticleSc(db.Model):
    __tablename__ = 'article_sc'

    sc_id = db.Column(db.Integer, primary_key=True)
    article_id = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())
    user_id = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())
    sc_time = db.Column(db.String(255, 'utf8_general_ci'), nullable=False, server_default=db.FetchedValue())



class Comment(db.Model):
    __tablename__ = 'comment'

    comment_id = db.Column(db.Integer, primary_key=True)
    comment_text = db.Column(db.Text)
    comment_date = db.Column(db.DateTime)
    article_id = db.Column(db.String(20), nullable=False)
    comment_name = db.Column(db.String(30))
    comment_support = db.Column(db.Integer, server_default=db.FetchedValue())
    comment_oppose = db.Column(db.Integer, server_default=db.FetchedValue())
    user_id = db.Column(db.Integer, nullable=False)



class Count(db.Model):
    __tablename__ = 'count'

    dbname = db.Column(db.String(30, 'utf8_general_ci'), primary_key=True)
    dbvalue = db.Column(db.Integer, server_default=db.FetchedValue())



class Follow(db.Model):
    __tablename__ = 'follow'

    follow_id = db.Column(db.Integer, primary_key=True)
    send_id = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())
    receive_id = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())
    foolow_time = db.Column(db.String(255, 'utf8_general_ci'), nullable=False, server_default=db.FetchedValue())



class LoginLog(db.Model):
    __tablename__ = 'login_log'

    login_id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer)
    login_ip = db.Column(db.String(255))
    login_time = db.Column(db.String(255))



class Message(db.Model):
    __tablename__ = 'message'

    mess_id = db.Column(db.Integer, primary_key=True)
    send_type = db.Column(db.Integer, server_default=db.FetchedValue())
    send_id = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())
    receive_id = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())
    send_time = db.Column(db.String(255), nullable=False)
    mess_content = db.Column(db.String(255))
    read_state = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='1未读，0已读，-1已删')



class User(db.Model):
    __tablename__ = 'user'

    uid = db.Column(db.Integer, primary_key=True)
    account = db.Column(db.String(255))
    tx_link = db.Column(db.String(15000, 'utf8_general_ci'), info='头像')
    sex = db.Column(db.String(255, 'utf8_general_ci'), info='性别')
    birthday = db.Column(db.String(255), info='出生日期')
    now_address = db.Column(db.String(255, 'utf8_general_ci'), info='现居地')
    home_address = db.Column(db.String(255, 'utf8_general_ci'), info='家乡')
    qq = db.Column(db.String(255, 'utf8_general_ci'), info='QQ')
    wechat = db.Column(db.String(255, 'utf8_general_ci'), info='微信')
    weibo = db.Column(db.String(255, 'utf8_general_ci'), info='微博')
    readme = db.Column(db.String(255, 'utf8_general_ci'), info='个人简介')
    money = db.Column(db.Float(255, True), info='余额')
    register_date = db.Column(db.String(255), info='注册日期')
    following_cnt = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='关注人数')
    follower_cnt = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='粉丝人数')
    mess_cnt = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='消息数')



class UserLogin(db.Model):
    __tablename__ = 'user_login'

    uid = db.Column(db.Integer, primary_key=True)
    account = db.Column(db.String(255, 'utf8_general_ci'), nullable=False, info='帐号( 昵称）唯一')
    email = db.Column(db.String(255, 'utf8_general_ci'), info='邮箱 唯一')
    phone = db.Column(db.String(255, 'utf8_general_ci'), info='手机 唯一')
    password_hash = db.Column(db.String(255, 'utf8_general_ci'), nullable=False, info='密码')
    is_admin = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='是否管理员,0否1是')
    is_enable = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue(), info='是否启用,用于封禁')
    lastlogin = db.Column(db.String(255), nullable=False, info='上次登录时间')
    pay_password_hash = db.Column(db.String(255, 'utf8_general_ci'), info='支付密码')



class Verify(db.Model):
    __tablename__ = 'verify'

    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(255))
    yzm = db.Column(db.String(255))
    sendtime = db.Column(db.String(255))
