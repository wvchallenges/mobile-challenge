/**
 * Created by yangtuopeng on 2016-03-14.
 */
angular.module("wvChallenge.models.products", [
  "vwChallenge.common.secret"
])
  .service("ProductsModel", [
    "$http",
    "products_business_id",
    "products_access_token",
    function($http, products_business_id, products_access_token){
      var model = this, // self reference
          products;     // model data: products

      /**
       * encapsulates and hides the implementation detail of how the data is returned
       *
       * @param response response returned by http request
       * @returns {obj[]} the products list is returned
       */
      function extract(response) {
        return response.data;
      }

      /**
       * cache the response from $http.get promise to local variable
       *
       * @param response response returned by http request
       * @returns {obj[]} product object list
       */
      function cacheResponse(response){
        products = extract(response);
        return products;
      }

      /**
       * error handler for $http.get()
       *
       * @param err error object returned by the http request
       */
      function errorHandler(err){
        console.log("ProductsModel.getProducts() error: ", err);
        return {
          error: true,
          message: err.data ? err.data.error.message : ""
        };
      }

      /**
       * make a http request to retrieve the product list data
       *
       * @returns {promiseObj} a promise contains the products list data or a rejection if the request failed
       */
      model.getProducts = function(){
        return $http({
          method: "GET",
          url: "https://api.waveapps.com/businesses/"+products_business_id+"/products/",
          params: {
            access_token: products_access_token,
          }
        }).then(cacheResponse, errorHandler);
      }
  }]);
