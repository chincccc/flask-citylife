from flask_wtf import FlaskForm, RecaptchaField
from flask_ckeditor import CKEditorField
from wtforms import StringField, BooleanField, PasswordField, TextAreaField, DateField, FloatField, SubmitField, \
    IntegerField, RadioField, SelectField
from wtforms.validators import DataRequired, Length, email, NumberRange


class RenderForm(FlaskForm):
    class Meta(FlaskForm.Meta):
        def render_field(self, field, render_kw):
            other_kw = getattr(field, 'render_kw', None)
            if other_kw is not None:
                class1 = other_kw.get('class', None)
                class2 = render_kw.get('class', None)
                if class1 and class2:
                    render_kw['class'] = class2 + ' ' + class1
                render_kw = dict(other_kw, **render_kw)
            return field.widget(field, **render_kw)


class LoginForm(RenderForm):
    account = StringField(
        label='邮箱',
        validators=[
            DataRequired("必填"),
            Length(min=4, max=20, message="用户名必须介于4-20个字符")
        ],
        render_kw={"placeholder": "用户名必须介于4-20个字符"})
    password = PasswordField(
        label="用户密码",
        validators=[DataRequired("密码必填！")],
        render_kw={
            "placeholder": '密码必须大于6个字符',
        })
    remember_me = BooleanField('记住我')
    # recaptcha = RecaptchaField()
    submit = SubmitField(label='登录', render_kw={"class": "btn btn-success"})


class EmailForm(RenderForm):
    email = StringField(
        '邮箱',
        validators=[email(message="邮箱格式不正确！")],
        render_kw={"placeholder": "xxxx@xxxx.com"})
    submit = SubmitField(label='发送验证码', render_kw={"class": "btn btn-success"})


class YzmForm(RenderForm):
    email = StringField('邮箱')
    yzm = StringField(
        '邮箱验证码',
        validators=[Length(min=6, max=6, message="验证码为6位数值")],
        render_kw={"placeholder": "验证码为6位数值"})
    account = StringField(
        label='用户名',
        validators=[
            DataRequired("用户名必填"),
            Length(min=2, max=10, message="2-10个字符")
        ],
        render_kw={"placeholder": "用户名必须介于4-20个字符"})
    password = PasswordField(
        label="用户密码",
        validators=[DataRequired("密码必填！")],
        render_kw={
            "placeholder": '密码必须大于6个字符',
        })
    password2 = PasswordField(
        label="确认密码",
        validators=[DataRequired("密码必填！")],
        render_kw={
            "placeholder": '再次输入',
        })
    submit = SubmitField(label='确认使用此邮箱进行注册', render_kw={"class": "btn btn-success"})


class PassForm(RenderForm):
    passold = PasswordField(
        label="原先密码",
        validators=[DataRequired("密码必填")],
        render_kw={
            "placeholder": '密码必须大于6个字符',
        })
    password = PasswordField(
        label="新密码",
        validators=[DataRequired("密码必填")],
        render_kw={
            "placeholder": '密码必须大于6个字符',
        })
    password2 = PasswordField(
        label="再输入一次新密码",
        validators=[DataRequired("密码必填！")],
        render_kw={
            "placeholder": '再次输入',
        })
    submit = SubmitField(label='修改', render_kw={"class": "btn btn-success"})


class ForgetPassForm(RenderForm):
    yzm = StringField(
        '邮箱验证码',
        validators=[Length(min=6, max=6, message="验证码为6位数值")],
        render_kw={"placeholder": "验证码为6位数值"})
    password = PasswordField(
        label="新密码",
        validators=[DataRequired("密码必填")],
        render_kw={
            "placeholder": '密码必须大于6个字符',
        })
    password2 = PasswordField(
        label="再输入一次新密码",
        validators=[DataRequired("密码必填！")],
        render_kw={
            "placeholder": '再次输入',
        })
    submit = SubmitField(label='修改', render_kw={"class": "btn btn-success"})


class TxForm(RenderForm):
    tx_link = StringField(label='', validators=[Length(min=0, max=20, message="必须介于0-20个字符")],
                          render_kw={"placeholder": "0-20个字符", "id": "date_input", "onclick": "newdate()",
                                     "type": "text", "readonly": "readonly"})
    submit = SubmitField(label='修改', render_kw={"class": "btn btn-success"})


class MyselfForm(RenderForm):
    tx_link = StringField(label='',
                          render_kw={"placeholder": "0-20个字符", "id": "tx_input", "class": "invisible", "type": "text",
                                     "readonly": "readonly"})
    birthday = StringField(label='', validators=[Length(min=0, max=20, message="必须介于0-20个字符")],
                           render_kw={"placeholder": "0-20个字符", "id": "date_input","class": "visible", "onclick": "newdate()",
                                      "type": "text", "readonly": "readonly"})
    sex = RadioField('性别', choices=[('男', '男'), ('女', '女')], validators=[DataRequired("性别必填！")])
    now_address = StringField(label='现居地', validators=[Length(min=0, max=50, message="必须介于0-10个字符")],
                              render_kw={"placeholder": "0-50个字符"})
    home_address = StringField(label='家乡', validators=[Length(min=0, max=50, message="必须介于0-10个字符")],
                               render_kw={"placeholder": "0-50个字符"})
    qq = StringField(label='QQ号', validators=[Length(min=0, max=10, message="必须介于0-10个字符")],
                     render_kw={"placeholder": "0-10个字符"})
    wechat = StringField(label='微信号', validators=[Length(min=0, max=10, message="必须介于0-10个字符")],
                         render_kw={"placeholder": "0-20个字符"})
    weibo = StringField(label='微博地址', validators=[Length(min=0, max=50, message="必须介于0-50个字符")],
                        render_kw={"placeholder": "0-50个字符"})
    readme = StringField(label='个人介绍', validators=[Length(min=0, max=50, message="必须介于0-50个字符")],
                         render_kw={"placeholder": "0-50个字符"})
    submit = SubmitField(label='修改', render_kw={"class": "btn btn-success"})

class UserCat(RenderForm):
    tx_link = StringField(label='',
                          render_kw={"placeholder": "0-20个字符", "id": "tx_input", "class": "invisible", "type": "text",
                                     "readonly": "readonly"})
    account = StringField(label='用户名', validators=[Length(min=0, max=20, message="必须介于0-20个字符")],
                           render_kw={"placeholder": "0-20个字符", "id": "date_input", "onclick": "newdate()",
                                      "type": "text", "readonly": "readonly"})
    birthday = StringField(label='', validators=[Length(min=0, max=20, message="必须介于0-20个字符")],
                           render_kw={"placeholder": "0-20个字符", "id": "date_input", "onclick": "newdate()",
                                      "type": "text", "readonly": "readonly"})
    sex = RadioField('性别', choices=[('男', '男'), ('女', '女')], validators=[DataRequired("性别必填！")],render_kw={"type": "text",
                                     "readonly": "readonly"})
    now_address = StringField(label='现居地', validators=[Length(min=0, max=50, message="必须介于0-10个字符")],
                              render_kw={"placeholder": "0-50个字符", "type": "text",
                                     "readonly": "readonly"})
    home_address = StringField(label='家乡', validators=[Length(min=0, max=50, message="必须介于0-10个字符")],
                               render_kw={"placeholder": "0-50个字符", "type": "text",
                                     "readonly": "readonly"})
    qq = StringField(label='QQ号', validators=[Length(min=0, max=10, message="必须介于0-10个字符")],
                     render_kw={"placeholder": "0-10个字符", "type": "text",
                                     "readonly": "readonly"})
    wechat = StringField(label='微信号', validators=[Length(min=0, max=10, message="必须介于0-10个字符")],
                         render_kw={"placeholder": "0-20个字符", "type": "text",
                                     "readonly": "readonly"})
    weibo = StringField(label='微博地址', validators=[Length(min=0, max=50, message="必须介于0-50个字符")],
                        render_kw={"placeholder": "0-50个字符", "type": "text",
                                     "readonly": "readonly"})
    readme = StringField(label='个人介绍', validators=[Length(min=0, max=50, message="必须介于0-50个字符")],
                         render_kw={"placeholder": "0-50个字符", "type": "text",
                                     "readonly": "readonly"})
    following_cnt = StringField(label='关注着', validators=[Length(min=0, max=50, message="必须介于0-50个字符")],
                         render_kw={"placeholder": "0-50个字符", "type": "text",
                                     "readonly": "readonly"})
    follower_cnt = StringField(label='粉丝数', validators=[Length(min=0, max=50, message="必须介于0-50个字符")],
                         render_kw={"placeholder": "0-50个字符", "type": "text",
                                     "readonly": "readonly"})
