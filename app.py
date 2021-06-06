from flask import Flask, g, render_template,current_app
from flask_bootstrap import Bootstrap
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager, current_user
from flask_ckeditor import CKEditor
from flask_wtf.csrf import CSRFProtect
import os

from apps.tools.other_tool import getTopNews

bootstrap = Bootstrap()
db = SQLAlchemy()
login_manager = LoginManager()

login_manager.session_protection = 'strong'
login_manager.login_view = 'main.login_in'
ckeditor = CKEditor()


def create_app():
    app = Flask(__name__, static_folder='static', static_url_path='/static/')
    app.config.from_object('config')
    # app.config['BOOTSTRAP_SERVE_LOCAL'] = True
    app.jinja_env.auto_reload = True
    # app.config['TEMPLATES_AUTO_RELOAD'] = True
    # app.config['CKEDITOR_FILE_UPLOADER'] = 'main.ckupload'

    # app.config['UPLOAD_FOLDER'] = '/static/upload'
    # app.config['ALLOWED_EXTENSIONS'] = set(['txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'])
    # app.config['MAX_CONTENT_LENGTH'] = 32 * 1024 * 1024  # 16MBpipenv install bootstrap-flask
    db = SQLAlchemy(app)
    bootstrap.init_app(app)
    db.init_app(app)
    ckeditor.init_app(app)
    login_manager.init_app(app)
    from apps.main import main as main_blueprint
    app.register_blueprint(main_blueprint)
    from apps.article import article as article_blueprint
    app.register_blueprint(article_blueprint)
    from apps.message import message as message_blueprint
    app.register_blueprint(message_blueprint)
    # CSRFProtect(app)
    return app


# application = app = create_app(threaded = True)
app = create_app()


if __name__ == '__main__':
    app.run(host="0.0.0.0", debug=True, port=5000, threaded=True)


@app.errorhandler(404)
def page_not_found(e):
    return render_template('/base/404.html'), 404


@app.errorhandler(500)
def page_not_found(e):
    return render_template('/base/500.html'), 500
