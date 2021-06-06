from flask import Blueprint

from ..tools.other_tool import getTopNews

main = Blueprint(name='main', import_name=__name__)

global news
news=getTopNews()

from . import views