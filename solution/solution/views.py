from flask import render_template
from requests import get

from config import WaveAppsConfig
from solution import app
from solution.product import ObjectProduct



@app.route('/')
def hello_world():
    testing = get_request('user')
    print(testing)

    products = get_request('businesses')
    print(products)

    for i in range(len(products)):
        products[i] = ObjectProduct(**products[i])

    print(products)
    return render_template('index.html', welcome="Hello, Welcome", products=products)


def get_request(type):
    url = WaveAppsConfig.URL
    token = WaveAppsConfig.ACCESS_TOKEN
    if type == 'user':
        url += type + '/'
    elif type == 'businesses':
        url += type + '/' + WaveAppsConfig.BUSINESS_ID + '/products/'
    print("URL: ", url)
    print("Access Token: ", token)
    return get(url, headers={'Authorization': "Bearer " + token}).json()


# def get_access():
#     url = WaveAppsConfig.URL + 'user/'
#     token = WaveAppsConfig.ACCESS_TOKEN
#     print("URL: ", url)
#     print("Access Token: ", token)
#     return get(url, headers={'Authorization': "Bearer " + token}).json()
#
#
# def get_product():
#     url = WaveAppsConfig.URL + 'businesses/' + WaveAppsConfig.BUSINESS_ID + '/products/'
#     token = WaveAppsConfig.ACCESS_TOKEN
#     print("URL: ", url)
#     print("Access Token: ", token)
#     return get(url, headers={'Authorization': "Bearer " + token}).json()
