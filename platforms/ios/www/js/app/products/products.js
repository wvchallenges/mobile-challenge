/**
 * Created by yangtuopeng on 2016-03-14.
 */
angular.module("wvChallenge.products", [
  "wvChallenge.models.products"
])
  .config(["$stateProvider", function($stateProvider){
    $stateProvider
      .state("products", {
        url: "/products",
        templateUrl: "js/app/products/products.tmpl.html",
        controller: "ProductsController as prodCtrl"
      })
  }])
  /**
   * Products view main controller
   */
  .controller("ProductsController", ["$scope", "$rootScope", "ProductsModel", "PtrService", function($scope, $rootScope, ProductsModel, PtrService){
    var prodCtrl = this;

    /* status setup */
    prodCtrl.online = true; // default online status is true
    prodCtrl.error = false; // page error indicator
    prodCtrl.errorMsg = ""; // error message

    /**
     * Show error message in the view
     *
     * @param {string} errMsg error message to show
     */
    function showErr(errMsg){
      prodCtrl.error = true;
      prodCtrl.errorMsg = errMsg ? errMsg : "An unknown error has occured.";
    }

    /**
     * Clear out the error status in view
     */
    function clearErr(){
      prodCtrl.error = false;
      prodCtrl.errorMsg = "";
    }

    /**
     * Load products list
     */
    prodCtrl.loadProducts = function(){

      if(!prodCtrl.online){ // offline, do nothing
        $scope.$broadcast('scroll.refreshComplete');  // stop refresher
        return false;
      }

      ProductsModel.getProducts()
        .then(
          function(response){
            if(response.error){   // error
              // show error message
              showErr(response.message);
            }else{                // success
              prodCtrl.products = response;
              // reset error status
              clearErr();
            }
          }
        )
        .finally(
          function(){ // broadcast the complete signal to reset the refresher
            $scope.$broadcast('scroll.refreshComplete');
          }
        );
    };

    /**
     * Create the title for the page view
     *
     * @returns {string} the title of the page
     */
    prodCtrl.title = function(){
      if(prodCtrl.online){
        return "Products";
      }else{
        return "Products (offline)";
      }
    }

    /* online/offline watcher */
    $scope.$watch(
      function(){
        return $rootScope.online;
      },
      function(newVal, oldVal){
        console.log("online status change: "+oldVal+"->"+newVal);
        prodCtrl.online = newVal; // update online status

        if(!newVal){  // offline, show error message
          showErr("Please check you internet connection.");
        }else{        // online, trigger refresh
          PtrService.triggerPtr("products-ptr-content");
        }
    });

  }])
;
