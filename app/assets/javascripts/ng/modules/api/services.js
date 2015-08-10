(function(){

  var module = angular.module('cronus.api.services', ['ngResource']);
  	module.factory('Api', [ '$resource',   
  		function($resource) {
  			return {
  				Products: $resource('/api/v1/products/:collectionCtrl:id/:memberCtrl',{
  					id: '@id',
  					collectionCtrl: '@collectionCtrl',
                    memberCtrl: '@memberCtrl'
  				},{
  					index: {
                    	method: 'GET',
                      	isArray: true,
                      	responseType: 'json'
                    },
                    products_is_public: {
                    	method: 'GET',
                     	params: {
                        	collectionCtrl: 'products_is_public'
                      	},
                      	isArray: true
                    }
  				})
                Documnets: $resource('/api/v1/documnets/:collectionCtrl:id/:memberCtrl',{
                    id: '@id',
                    collectionCtrl: '@collectionCtrl',
                    memberCtrl: '@memberCtrl'
                },{
                    index: {
                        method: 'GET',
                        isArray: true,
                        responseType: 'json'
                    },
                    create: {
                        method: 'POST'
                    }
                })
  			};
  		}
  	]);
 }());