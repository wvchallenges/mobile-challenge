from solution import app
from flask import request, render_template, redirect

@app.route('/')
def hello_world():
    return render_template('product-lists.html', welcome="Hello, Welcome")
