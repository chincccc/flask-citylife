import os, uuid

import markdown
from flask import g, redirect, render_template, request, url_for, Response, jsonify
from flask_login import login_required, current_user
from sqlalchemy import or_, and_
from collections import Counter
from werkzeug.utils import secure_filename

from . import message
from ..models import db, Article, Comment, Message, User
from ..tools.other_tool import getnowtime, HtmlToText
from .forms import MessageForm


@message.route('/all_message/', methods=['GET', 'POST'])
@login_required
def all_message():
    sum_message(current_user.uid)
    sc = Message().query.filter(and_(Message.send_type == 3, Message.receive_id == current_user.uid,Message.read_state == 1)).count()  # 获取未读的获赞信息数
    fan = Message().query.filter(and_(Message.send_type == 2, Message.receive_id == current_user.uid,Message.read_state == 1)).count()  # 获取未读的新粉丝信息数
    pl = Message().query.filter(and_(Message.send_type == 1, Message.receive_id == current_user.uid,Message.read_state == 1)).count()  # 获取未读的评论信息数
    chat = Message().query.filter(and_(Message.send_type == 0, Message.receive_id == current_user.uid,Message.read_state != 0)).count()  # 获取未读的私聊赞信息数
    cnt = [chat, pl, fan, sc]
    list = []
    messages_new = Message().query.filter(
        and_(Message.send_type == 0, Message.receive_id == current_user.uid, Message.read_state != 0)).all()# 获取未读的私聊信息
    for message in messages_new:# 将未读的私信发送者id存入list
        list.append(message.send_id)
    uidlist_new = dict(Counter(list))# 统计每个发送者id发送的未读信息数量
    list = []
    messages_old = Message().query.filter(
        and_(Message.send_type == 0, Message.receive_id == current_user.uid, Message.read_state == 0)).all()# 获取已读的私聊信息
    for message in messages_old:# 将已读的私信发送者id存入list
        list.append(message.send_id)
    uidlist_old = dict(Counter(list))# 统计每个发送者id发送的已读信息数量
    for key_old, value_old in uidlist_old.items():# 整合已读和未读的信息数量
        for key_new, value_new in uidlist_new.items():
            if key_new == key_old:
                uidlist_old[key_old] = -1
    users = User.query.order_by(User.uid.desc()).all()
    return render_template('message_console.html', users=users, uidlist_new=uidlist_new, uidlist_old=uidlist_old,cnt=cnt)


@message.route('/chat_put/', methods=['GET', 'POST'])
def chat_put():
    if request.method == 'POST':
        id = request.form["DATA"]
        other = request.form["OTHER"]
        print(other)  # 获取前台传递的更多请求
        if id != '':  # 若请求为more则加载更多，否则为正常刷新
            newmessage = Message(send_type=0, send_id=current_user.uid, receive_id=int(other), send_time=getnowtime(),
                                 mess_content=id)  # 构造发送实例
            db.session.add(newmessage)  # 写入数据库
            db.session.commit()
    return redirect(url_for('message.chat', user_id=other))#刷新界面


@message.route('/chat/<user_id>', methods=['GET', 'POST'])
@login_required
def chat(user_id):
    sum_message(current_user.uid)
    messageform = MessageForm()#构造发送框表单样式
    messages = Message().query.filter(
        and_(Message.send_type == 0, or_(and_(Message.receive_id == current_user.uid, Message.send_id == user_id), and_(
            Message.send_id == current_user.uid, Message.receive_id == user_id)))).all()#获取所有双方间的聊天信息
    for message in messages:
        if message.receive_id == current_user.uid and message.read_state == 3:#=3意味着用户在聊天界面停留4秒，视为已读
            message.read_state = 0#标记为0表示已读
        if message.receive_id == current_user.uid and message.read_state != 0:
            message.read_state = message.read_state + 1#read_state默认为1，每在与当前用户的私聊界面停留2秒+1（2秒刷新一次页面）
    db.session.commit()
    user = User.query.filter_by(uid=user_id).first()
    try:
        account = user.account
    except:
        account = ''
    if messageform.validate_on_submit():
        mess_content = messageform.mess_content.data# 获取前台传来的发送框内容
        newmessage = Message(send_type=0, send_id=current_user.uid, receive_id=user_id, send_time=getnowtime(),
                             mess_content=mess_content)#构造发送实例
        db.session.add(newmessage)#写入数据库
        db.session.commit()
        return redirect(url_for('message.chat', user_id=user_id))#刷新界面
    else:
        return render_template('chat.html', messages=messages, form=messageform, account=account,user_id=user_id)#向前台传递表单样式、信息列表


@message.route('/message_list/<send_type>', methods=['GET', 'POST'])
@login_required
def message_list(send_type):
    sum_message(current_user.uid)
    flag = ''
    messages_old = Message().query.filter(
        and_(Message.send_type == send_type, Message.receive_id == current_user.uid, Message.read_state == 0)).all()
    messages_new = Message().query.filter(
        and_(Message.send_type == send_type, Message.receive_id == current_user.uid, Message.read_state == 1)).all()
    messages_new2 = messages_new
    for message in messages_new:
        message.read_state = 0
    db.session.commit()
    if send_type == '3':
        flag = '获赞'
    elif send_type == '2':
        flag = '关注'
    elif send_type == '1':
        flag = '评论'
    return render_template('message_list.html', messages_old=messages_old, messages_new=messages_new2, flag=flag)


def new_message(send_type, send_id, receive_id, mess_content):
    newmessage = Message(send_type=send_type, send_id=send_id, receive_id=receive_id,
                         mess_content=HtmlToText(mess_content),
                         send_time=getnowtime())
    db.session.add(newmessage)
    db.session.commit()
    sum_message(send_id)
    sum_message(receive_id)


def sum_message(uid):
    cnt = Message().query.filter(Message.receive_id == uid, Message.read_state == 1).count()
    user = User.query.filter_by(uid=uid).first()
    user.mess_cnt = cnt
    db.session.commit()
