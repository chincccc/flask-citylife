
import sqlalchemy
from flask import g, redirect, render_template, url_for, flash, current_app, request
from flask_login import login_required, current_user, login_user, logout_user


from . import main, news
from ..models import User, db, Count, UserLogin, Verify, Article, Message, Follow, ArticleSc, LoginLog
from .forms import LoginForm, MyselfForm, PassForm, EmailForm, YzmForm, ForgetPassForm, UserCat
from ..tools.other_tool import getnowtime, get_rand, send_email, Base64_PNG,getTopNews
from ..message.views import new_message, sum_message




@main.before_request
def before_request():
    g.user = current_user


@main.route('/index_re')
def index_re():
    current_app.art_n = 0
    return redirect(url_for('main.index'))


@main.route('/', methods=['GET', 'POST'])
def index():
    all_cnt = Article.query.count()  # 获取所有帖子数量
    if request.method == 'POST':
        id = request.form["DATA"]  # 获取前台传递的更多请求
        if id == 'more':  # 若请求为more则加载更多，否则为正常刷新
            try:
                if current_app.art_n <= all_cnt - 8:
                    current_app.art_n = current_app.art_n + 8  # 加载数量上增加8条
                else:
                    current_app.art_n = all_cnt
            except:
                current_app.art_n = 8
    else:  # 初始化current_app.art_n变量
        try:
            if current_app.art_n == 0:
                current_app.art_n = 8
        except:
            current_app.art_n = 8
    articles = Article.query.order_by(Article.article_id.desc()).limit(current_app.art_n)  # 从数据库取出相应数量的帖子
    users = User.query.order_by(User.uid.desc()).all()  # 从数据库取出用户表（加载头像）
    if current_user.is_authenticated:
        sum_message(current_user.uid)
    return render_template('all_articles.html', tip='主页', articles=articles, users=users,news=news, flag=0)  # 向前台传递数据


@main.route('/login_in/', methods=['POST', 'GET'])
def login_in():
    loginForm = LoginForm()
    tip = ''
    if current_user.is_authenticated:
        return redirect(url_for('main.user_self'))
    if loginForm.validate_on_submit():
        account = loginForm.account.data
        password = loginForm.password.data
        user1 = UserLogin.query.filter_by(account=account).first()
        user2 = UserLogin.query.filter_by(phone=account).first()
        user3 = UserLogin.query.filter_by(email=account).first()
        login_flag = 0
        user = User()
        if user1 is not None and user1.verify_password(password):
            login_flag = 1
            user = user1
        elif user2 is not None and user2.verify_password(password):
            login_flag = 1
            user = user2
        elif user3 is not None and user3.verify_password(password):
            login_flag = 1
            user = user3
        else:
            tip = "帐号或密码错误"
        if login_flag == 1:
            if user.is_enable == 0:
                tip = "该帐号还在注册审核中,或是已注销"
            else:
                user.lastlogin = getnowtime()
                g.userlogin = user
                user = User.query.filter_by(uid=user.uid).first()
                login_user(user, loginForm.remember_me.data)
                g.user = user
                print(g.user)
                g.first = user.uid
                sum_message(user.uid)
                sum_following(user.uid)
                add_login_log(user.uid)
                return redirect(request.args.get('next') or url_for('main.index'))
    return render_template('baseform.html', tit='登录', form=loginForm, action='/login_in/', tip=tip)


@main.route('/email_up/', methods=['GET', 'POST'])
def email_up():
    emailForm = EmailForm()
    if current_user.is_authenticated:
        return redirect(url_for('main.user_self'))
    tip = ''
    emails = ''
    if emailForm.validate_on_submit():
        email = emailForm.email.data
        ubyemail = UserLogin.query.filter_by(email=email).first()
        if ubyemail:
            tip = " 邮箱已存在"
        else:
            emails = email
            yzm = get_rand(6)
            if send_email(yzm, emails, 0):
                verify = Verify(email=emails, yzm=yzm, sendtime=getnowtime(''))
                db.session.add(verify)
                db.session.commit()
            return redirect(url_for('main.verify_yzm', emails=email))
    return render_template('baseform.html', form=emailForm, emails=emails, tip=tip)


@main.route('/verify_yzm/?<string:emails>', methods=['GET', 'POST'])
def verify_yzm(emails):
    tip = ''
    yzmForm = YzmForm(email=emails)
    if current_user.is_authenticated:
        return redirect(url_for('main.user_self'))
    if yzmForm.validate_on_submit():
        yzm = yzmForm.yzm.data
        email = yzmForm.email.data
        ubyemail = UserLogin.query.filter_by(email=email).first()
        if ubyemail:
            tip = " 邮箱已存在"
        else:
            results = Verify.query.filter_by(email=email).order_by(sqlalchemy.desc(Verify.email)).all()
            last_results = results[-1]
            nowtime = int(getnowtime(''))
            if email == last_results.email and yzm == last_results.yzm and nowtime - int(last_results.sendtime) < 100:
                account = yzmForm.account.data
                passwd1 = yzmForm.password.data
                passwd2 = yzmForm.password2.data
                user = UserLogin(account=account, email=email, phone='',
                                 is_admin=0, is_enable=1, lastlogin=getnowtime())
                user.password = passwd1
                ubyaccount = UserLogin.query.filter_by(account=account).first()
                ubyemail = UserLogin.query.filter_by(email=email).first()
                if ubyaccount or ubyemail:
                    tip = " 用户名或者手机号码或者邮箱已存在"
                elif passwd1 != passwd2:
                    tip = '两次密码不一致，请从新输入！'
                else:
                    db.session.add(user)
                    db.session.commit()
                    print('注册成功')
                    return redirect(url_for('main.login_in'))
            else:
                tip = '验证码错误或已过一小时有效期'
    return render_template('baseform.html', form=yzmForm, tip=tip)


@main.route('/user_self/', methods=['GET', 'POST'])
@login_required
def user_self():
    sum_message(current_user.uid)
    user = User().query.filter_by(uid=current_user.uid).first()
    userform = UserCat(tx_link=user.tx_link, account=user.account, sex=user.sex, birthday=user.birthday,
                       now_address=user.now_address, home_address=user.home_address, qq=user.qq,
                       wechat=user.wechat, weibo=user.weibo, readme=user.readme, follower_cnt=user.follower_cnt,
                       following_cnt=user.following_cnt)
    return render_template(
        'user.html', user=current_user, flag=-1, form=userform)


@main.route('/user_more/<user_id>/', methods=['GET', 'POST'])
def user_more(user_id):
    user = User().query.filter_by(uid=user_id).first()
    userform = UserCat(tx_link=user.tx_link, account=user.account, sex=user.sex, birthday=user.birthday,
                       now_address=user.now_address, home_address=user.home_address, qq=user.qq,
                       wechat=user.wechat, weibo=user.weibo, readme=user.readme, follower_cnt=user.follower_cnt,
                       following_cnt=user.following_cnt)
    if current_user.is_authenticated:
        sum_message(current_user.uid)
        if int(user_id) == current_user.uid:
            return render_template('user.html', user=current_user, flag=-1,form=userform)
        else:
            user = User().query.filter_by(uid=user_id).first()
            myfollow = Follow().query.filter(Follow.send_id == current_user.uid, Follow.receive_id == user_id).all()
            flag = len(myfollow)
            return render_template('user.html', user=user, myfollows=myfollow, flag=flag, form=userform)
    else:
        user = User().query.filter_by(uid=user_id).first()
        return render_template('user.html', user=user, flag=-2, form=userform)


@main.route('/user_list/<type>/', methods=['GET', 'POST'])
def user_list(type):
    if current_user.is_authenticated:
        sum_message(current_user.uid)
        users = User.query.filter(User.uid != current_user.uid).all()
    else:
        users = User.query.all()
    user_l = []
    if type == '关注列表':
        fllows = Follow.query.filter_by(send_id=current_user.uid).all()
        print(fllows)
        for user in users:
            for fllow in fllows:
                if fllow.receive_id == user.uid:
                    user_l.append(user)
    elif type == '粉丝列表':
        fllows = Follow.query.filter_by(receive_id=current_user.uid).all()
        for fllow in fllows:
            for user in users:
                if fllow.send_id == user.uid:
                    user_l.append(user)
    elif '用户搜索' in type:
        user_l = User.query.filter(User.account.like('%' + type.replace('用户搜索', '') + '%')).all()
        type = '用户搜索'

    print(user_l)
    return render_template('user_list.html', users=user_l, type=type)


@main.route('/user_change/', methods=['GET', 'POST'])
@login_required
def user_change():
    sum_message(current_user.uid)
    account = current_user.account
    user = User().query.filter_by(uid=current_user.uid).first()
    myselfForm = MyselfForm(tx_link=user.tx_link, sex=user.sex, birthday=user.birthday,
                            now_address=user.now_address, home_address=user.home_address, qq=user.qq,
                            wechat=user.wechat, weibo=user.weibo, readme=user.readme)
    if myselfForm.validate_on_submit():
        result = User.query.filter_by(account=account).first()
        tx_link = myselfForm.tx_link.data
        tx_link = Base64_PNG(tx_link, user.uid, type='tx')
        sex = myselfForm.sex.data
        birthday = myselfForm.birthday.data
        now_address = myselfForm.now_address.data
        home_address = myselfForm.home_address.data
        qq = myselfForm.qq.data
        wechat = myselfForm.wechat.data
        weibo = myselfForm.weibo.data
        readme = myselfForm.readme.data
        flag = 0
        if flag == 1:
            print('用户名已存在，请从新输入！')
        else:
            result.tx_link = tx_link
            result.sex = sex
            result.birthday = birthday
            result.now_address = now_address
            result.home_address = home_address
            result.qq = qq
            result.wechat = wechat
            result.weibo = weibo
            result.readme = readme
            db.session.commit()
            print('修改成功')
            return redirect(url_for('main.user_more', user_id=current_user.uid))
    return render_template('baseform.html', form=myselfForm, flag='user')


@main.route('/user_tx_change/', methods=['GET', 'POST'])
@login_required
def user_tx_change():
    sum_message(current_user.uid)
    account = current_user.account
    user = User().query.filter_by(account=account).first()
    myselfForm = MyselfForm(tx_link=user.tx_link)
    if myselfForm.validate_on_submit():
        result = User.query.filter_by(account=account).first()
        sex = myselfForm.sex.data
        birthday = myselfForm.birthday.data
        now_address = myselfForm.now_address.data
        home_address = myselfForm.home_address.data
        qq = myselfForm.qq.data
        wechat = myselfForm.wechat.data
        weibo = myselfForm.weibo.data
        readme = myselfForm.readme.data
        flag = 0
        if flag == 1:
            print('用户名已存在，请从新输入！')
        else:
            result.sex = sex
            result.birthday = birthday
            result.now_address = now_address
            result.home_address = home_address
            result.qq = qq
            result.wechat = wechat
            result.weibo = weibo
            result.readme = readme
            db.session.commit()
            print('修改成功')
            user = User().query.filter_by(account=account).first()
            return render_template(
                'user.html', user=user)
    return render_template('baseform.html', form=myselfForm, flag=True)


@main.route('/pass_change/', methods=['GET', 'POST'])
@login_required
def pass_change():
    sum_message(current_user.uid)
    tip = ''
    account = g.user.account
    user = UserLogin().query.filter_by(account=account).first()
    passForm = PassForm()
    if passForm.validate_on_submit():
        result = UserLogin.query.filter_by(account=account).first()
        oldpass = passForm.passold.data
        passwd1 = passForm.password.data
        passwd2 = passForm.password2.data
        if user is not None and user.verify_password(oldpass):
            if passwd1 != passwd2:
                tip = '新密码两次输入不一致'
            else:
                result.password = passwd1
                db.session.commit()
                print('修改成功')
                return render_template('user.html', user=current_user, flag=0)
        else:
            tip = '原密码错误请重试'
    return render_template('baseform.html', form=passForm, tip=tip)


@main.route('/pass_forget/', methods=['GET', 'POST'])
def pass_forget():
    emailForm = EmailForm()
    if current_user.is_authenticated:
        return redirect(url_for('main.user_self'))
    tip = ''
    emails = ''
    if emailForm.validate_on_submit():
        email = emailForm.email.data
        ubyemail = UserLogin.query.filter_by(email=email).first()
        if ubyemail:
            emails = email
            yzm = get_rand(6)
            if send_email(yzm, emails):
                verify = Verify(email=emails, yzm=yzm, sendtime=getnowtime(''))
                db.session.add(verify)
                db.session.commit()
            return redirect(url_for('main.verify_yzm_repass', emails=email))
        else:
            tip = "邮箱不存在,请前往注册"
    return render_template('baseform.html', form=emailForm, emails=emails, tip=tip)


@main.route('/verify_yzm_repass/?<string:emails>', methods=['GET', 'POST'])
def verify_yzm_repass(emails):
    tip = ''
    yzmForm = ForgetPassForm(email=emails)
    if current_user.is_authenticated:
        return redirect(url_for('main.user_self'))
    if yzmForm.validate_on_submit():
        yzm = yzmForm.yzm.data
        email = yzmForm.email.data
        ubyemail = UserLogin.query.filter_by(email=email).first()
        if ubyemail:
            results = Verify.query.filter_by(email=email).order_by(sqlalchemy.desc(Verify.email)).all()
            last_results = results[-1]
            nowtime = int(getnowtime(''))
            if (email == last_results.email and yzm == last_results.yzm and nowtime - int(
                    last_results.sendtime) < 100):
                result = UserLogin.query.filter_by(email=emails).first()
                passwd1 = yzmForm.password.data
                passwd2 = yzmForm.password2.data
                if ubyemail is not None:
                    if passwd1 != passwd2:
                        tip = '新密码两次输入不一致'
                    else:
                        result.password = passwd1
                        db.session.commit()
                        print('修改成功')
                        return render_template('user.html', user=current_user, flag=0)
            else:
                tip = '验证码错误或已过一小时有效期'
        else:
            tip = '邮箱不存在,请前往注册'

    return render_template('baseform.html', form=yzmForm, tip=tip)


@main.route('/login_out')
@login_required
def login_out():
    logout_user()
    flash('退出登录.')
    return redirect(url_for('main.index'))


def add_table_count(tablename):
    count = Count.query.filter_by(dbname=tablename).first()
    if count is None:
        count = Count(dbname=tablename, dbvalue=0)
        db.session.add(count)
    else:
        count.dbvalue += 1
        db.session.add(count)
    db.session.commit()
    print('添加成功')


@main.route('/follow/<user_id>/')
@login_required
def follow(user_id):
    sum_message(current_user.uid)
    follow = Follow(send_id=current_user.uid, receive_id=user_id, foolow_time=getnowtime())
    db.session.add(follow)
    db.session.commit()
    sum_following(current_user.uid)
    sum_following(user_id)
    new_message(send_type=2, send_id=current_user.uid, receive_id=user_id, mess_content="您有一个新的粉丝")
    return redirect(url_for('main.user_more', user_id=user_id))


@main.route('/unfollow/<follow_id>/')
@login_required
def unfollow(follow_id):
    sum_message(current_user.uid)
    myfollow = Follow().query.filter_by(follow_id=follow_id).first()
    try:
        db.session.delete(myfollow)
        db.session.commit()
    except:
        print('wake')
    sum_following(current_user.uid)
    sum_following(myfollow.receive_id)
    return redirect(url_for('main.user_more', user_id=myfollow.receive_id))

@main.route('/all_login_log/')
@login_required
def all_login_log():
    login_logs=LoginLog().query.filter_by(user_id=current_user.uid).all()
    return render_template('login_list.html', login_logs=login_logs)


def sum_following(uid):
    following = Follow().query.filter_by(send_id=uid).all()
    following_cnt = len(following)
    follower = Follow().query.filter_by(receive_id=uid).all()
    follower_cnt = len(follower)
    user = User.query.filter_by(uid=uid).first()
    user.following_cnt = following_cnt
    user.following_cnt = follower_cnt
    db.session.commit()


def add_login_log(uid):
    ip = request.remote_addr
    newlog = LoginLog(user_id=uid, login_ip=ip, login_time=getnowtime())
    db.session.add(newlog)
    db.session.commit()