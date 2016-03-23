from flask import Flask
from flask.ext.mobility import Mobility

app = Flask(__name__, static_url_path='')
Mobility(app)

from solution import views