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


class MessageForm(RenderForm):
    mess_content = TextAreaField(label='回复内容', validators=[Length(min=1, max=500, message="必须介于1-500个字符")],
                                    render_kw={"placeholder": "1-500个字符", "id": "editor"})
    submit = SubmitField('发送', render_kw={"class": "btn btn-success"})


