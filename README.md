# Wave Software Development Challenge
## Project Description
In this project, we're going to be creating a simple app that shows a Wave user the products that they can charge for on their invoices. 

You'll be using the public Wave API in this challenge. You can find the documentation [here](http://docs.waveapps.io/). You will specifically be interested in [the products endpoint](http://docs.waveapps.io/endpoints/products.html#get--businesses-business_id-products-), and [using an access token with the API](http://docs.waveapps.io/oauth/index.html#use-the-access-token-to-access-the-api). 

Your Wave contact will supply you with a business ID and a Wave API token before you begin.

## Developer's Notes
The given solution uses MVVM architecture to decouple views and related data. Meaning, we can easily change the underlying view without modifying the mechanism of retrieving data or vice versa.
Also, it makes use of Data Binding library for Android which saves development time. Developers need not have to write extra lines of code for assigning values to views.

Secondly, the solution is scalable for WAVE API endpoints. It can be easily expanded to get any other information related to products.
