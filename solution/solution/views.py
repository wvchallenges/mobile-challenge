from flask import render_template
from requests import get

from config import WaveAppsConfig
from solution import app
from solution.product import ObjectProduct


@app.route('/')
def run_app():
    '''
    run the flask applicatoin
    '''
    # Get access to the API and return USER information as a dictionary
    get_request('user')

    # Get business product data as a dictionary
    products = get_request('businesses')

    # Convert each entry into an object
    for i in range(len(products)):
        products[i] = ObjectProduct(**products[i])

    return render_template('index.html', welcome="Hello, Welcome", products=products)


def get_request(type):
    '''
    :param:: String
    :return:: Dictionary
    '''
    url = WaveAppsConfig.URL
    token = WaveAppsConfig.ACCESS_TOKEN
    if type == 'user':
        url += type + '/'
    elif type == 'businesses':
        url += type + '/' + WaveAppsConfig.BUSINESS_ID + '/products/'
    print("URL: ", url)
    print("Access Token: ", token)
    return get(url, headers={'Authorization': "Bearer " + token}).json()

