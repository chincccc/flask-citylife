import os, uuid

import markdown
from flask import g, redirect, render_template, request, url_for, Response, jsonify
from flask_login import login_required, current_user
from werkzeug.utils import secure_filename

from . import article
from ..models import db, Article, Comment, User
from .forms import ArticleForm
from ..tools.other_tool import getnowtime, re_filename, HtmlToText, Base64_PNG, get_new, getTopNews
from ..message.views import new_message, sum_message


@article.route('/add_article/', methods=['GET', 'POST'])
@login_required
def add_article():
    sum_message(current_user.uid)
    articleForm = ArticleForm()  # 构建帖子类型的表单样式
    if articleForm.validate_on_submit():  # 获取前台提交的表单内容
        article_url = articleForm.article_url.data
        article_title = articleForm.article_title.data
        article_type = articleForm.article_type.data
        article_summary = articleForm.article_summary.data
        article = Article(article_title=article_title, article_summary=article_summary,
                          article_date=getnowtime('-'), article_type=article_type,
                          user_id=current_user.uid)  # 根据表单内容构造对象
        db.session.add(article)  # 将构造的对象存入数据库
        db.session.commit()
        thisarticles = Article.query.filter_by(article_id=article.article_id).first()
        article_url = Base64_PNG(article_url, article.article_id, type='article')
        thisarticles.article_url = article_url
        db.session.commit()
        return redirect(url_for('main.index'))  # 返回首页
    else:
        return render_template('baseform.html', form=articleForm, flag='article')  # 向前台传递构造的表单样式




@article.route('/get_article/<article_id>', methods=['GET', 'POST'])
def get_article(article_id):
    if current_user.is_authenticated:
        sum_message(current_user.uid)
    article = Article().query.filter_by(article_id=article_id).first()  # 根据帖子id从数据库获取帖子实例
    article.article_read_cnt = article.article_read_cnt + 1  # 帖子阅读量+1
    db.session.add(article)  # 阅读量更改写入数据库
    db.session.commit()
    comments = Comment().query.filter_by(article_id=article_id).all()  # 根据帖子id获取改帖子下所有的恢复信息
    account = User().query.filter_by(uid=article.user_id).first().account
    return render_template(
        'article.html', article=article, comments=comments,account=account)  # 向前台传递数据


@article.route('/add_comment/<article_id>', methods=["POST"])
@login_required
def add_comment(article_id):
    sum_message(current_user.uid)
    if request.method == 'POST':
        commentary = request.form.get("commentary")
        commentary = markdown.markdown(commentary, ['extra', 'codehilite'])
        comment = Comment(
            comment_text=commentary,
            comment_date=getnowtime(''),
            comment_name='  ',
            user_id=current_user.uid,
            article_id=article_id)
        db.session.add(comment)
        db.session.commit()
        article = Article().query.filter_by(article_id=article_id).first()
        article.article_pl = article.article_pl + 1
        db.session.add(article)
        db.session.commit()
        article = Article().query.filter_by(article_id=article_id).first()
        comments = Comment().query.filter_by(article_id=article_id).all()
        if current_user.uid != article.user_id:
            new_message(send_type=1, send_id=current_user.uid, receive_id=article.user_id,
                        mess_content=HtmlToText(comment.comment_text))
    return render_template(
        'article.html', article=article, comments=comments)


@article.route('/comment_oppose/<comment_id>')
@login_required
def comment_oppose(comment_id):
    sum_message(current_user.uid)
    comment = Comment().query.filter_by(comment_id=comment_id).first()
    comment.comment_oppose += 1
    db.session.add(comment)
    db.session.commit()
    return redirect(url_for("article.get_article", article_id=comment.article_id))


@article.route('/comment_support/<comment_id>')
@login_required
def comment_support(comment_id):
    sum_message(current_user.uid)
    comment = Comment().query.filter_by(comment_id=comment_id).first()
    comment.comment_support += 1
    db.session.add(comment)
    db.session.commit()
    return redirect(url_for("article.get_article", article_id=comment.article_id))


@article.route('/add_article_sc/<article_id>', methods=['GET', 'POST'])
@login_required
def add_article_sc(article_id):
    sum_message(current_user.uid)
    article = Article().query.filter_by(article_id=article_id).first()
    article.article_sc = article.article_sc + 1
    db.session.add(article)
    db.session.commit()
    return render_template('base/tool.html')


@article.route('/cut_article_sc/<article_id>', methods=['GET', 'POST'])
@login_required
def cut_article_sc(article_id):
    sum_message(current_user.uid)
    article = Article().query.filter_by(article_id=article_id).first()
    if (article.article_sc >= 1):
        article.article_sc = article.article_sc - 1
    db.session.add(article)
    db.session.commit()
    return render_template('base/tool.html')


@article.route('/seach/', methods=['GET', 'POST'])
def seach():
    if current_user.is_authenticated:
        sum_message(current_user.uid)
    if request.method == 'POST':
        content = request.form.get('content')
        seach_type = request.form.get('seach_type')
    if seach_type == 1:
        articles = Article().query.filter(Article.article_title.like('%' + content + '%')).all()
        return render_template('all_articles.html', articles=articles, flag=1)
    else:
        return redirect(url_for('main.user_list', type='用户搜索' + content))


@article.route('/manage_article/', methods=['GET', 'POST'])
@login_required
def manage_article():
    sum_message(current_user.uid)
    articles = Article().query.filter_by(user_id=current_user.uid).all()
    return render_template('manage_article.html', articles=articles)


@article.route('/del_article/<article_id>/')
@login_required
def del_article(article_id):
    sum_message(current_user.uid)
    article = Article().query.filter_by(article_id=article_id).first()
    db.session.delete(article)
    comments = Comment().query.filter_by(article_id=article_id).delete(
        synchronize_session=False)
    db.session.commit()
    print('删除文章成功!!!!')
    return redirect(url_for('article.manage_article'))


@article.route('/img', methods=['POST'])
@login_required
def img():
    username = ''
    try:
        username = current_user.account
    except:
        username = 'other'
    print(username)
    finalpath = './static/upload/' + username
    if not os.path.exists(finalpath):
        os.makedirs(finalpath)

    file = request.files['upload']

    suffix = file.filename.rsplit('.', 1)[1]
    if suffix not in ('jpeg', 'jpg', 'png', 'gif'):
        response = {
            'uploaded': False,
            'url': '/upload/' + username
        }
        return jsonify(response)

    name = re_filename(file.filename, username)
    while os.path.exists(os.path.join(os.getcwd(), 'static/upload/' + username, name)):
        name = uuid.uuid4().hex + '.' + suffix

    file.save(os.path.join(os.getcwd(), 'static/upload/' + username, name))

    response = {
        'uploaded': True,
        'url': '/static/upload/' + username + '/' + name
    }
    return jsonify(response)


@article.route('/imgs/<img_name>')
@login_required
def load(img_name):
    print('wwww')
    image = os.path.join(os.getcwd(), 'static', img_name)
    if not os.path.exists(image):
        return redirect('page_not_found')

    suffix = {
        'jpeg': 'image/jpeg',
        'jpg': 'image/jpeg',
        'png': 'image/png',
        'gif': 'image/gif'
    }
    mine = suffix[str(image.rsplit('.', 1)[1])]

    with open(image, 'rb') as file:
        img = file.read()

    return Response(img, mimetype=mine)


@article.route('/ckupload/', methods=['GET', 'POST'])
def ckupload():
    print('qqqq')
    if request.method == 'POST':
        f = request.files['file']
    basepath = os.path.dirname(__file__)  # 当前文件所在路径
    try:
        username = g.user.account
    except:
        username = 'other'
    finalpath = './static/upload/' + username
    if not os.path.exists(finalpath):
        os.makedirs(finalpath)
    print(finalpath)
    print(os.path.exists(finalpath))
    upload_path = os.path.join(basepath, '../../static/upload/' + username,
                               secure_filename(re_filename(f.filename, username)))
    f.save(upload_path)
    return render_template('base/tool.html')

@article.route('/news/<link>', methods=['GET', 'POST'])
def news(link):
    return render_template('news.html',summary=get_new(link))

@article.route('/more_news/', methods=['GET', 'POST'])
def more_news():
    return render_template('news_list.html',news=getTopNews(0))


@article.route('/upload/', methods=['POST', 'GET'])
def upload():
    if request.method == 'POST':
        f = request.files['file']
        basepath = os.path.dirname(__file__)  # 当前文件所在路径
        upload_path = os.path.join(basepath, '../../static/tx_upload/',
                                   secure_filename(f.filename))  # 注意：没有的文件夹一定要先创建，不然会提示没有该路径
        f.save(upload_path)
        return render_template('tx_change.html')
    return render_template('tx_change.html')


@article.route('/tx_change/', methods=['GET', 'POST'])
def tx_change():
    return render_template('tx_change.html')
