# Wave Challenge | Product List

## To use

### Node

```sh
npm install
node server.js
```

And visit <http://localhost:3000/>. 

Developed and tested with Chrome 49.0.2623.87 on Windows 10.

## Description

This wave product list was built with React.js running on a Node.js server. Our product list was queried via the Wave API using the very recently implemented CORS with AJAX requests. Using the provided Wave business ID and access token, we were able to send an AJAX GET request to the "https://api.waveapps.com/businesses/products/" endpoint to fetch that businesses list of products. We leveraged the Datatables.js library to present the list of products in a smart and aesthetically pleasing way.

The solution is clean, simple and reusable thanks to the React.js framework. We can easily replace the static business ID and access token with a customer authentication form to make the service available to any client. The Datatables library automatically presents the list in a useful and elegant way, and provides several sorting and search features to the user.