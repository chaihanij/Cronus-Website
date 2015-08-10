(function(){

  var module = angular.module('cronus.api.token', ['ngResource']);
    module.factory('Token', [ '$resource',   
        function($resource) {
            var metas = document.getElementsByTagName('meta');
            return {
                csrf_param_name: function() {
                    return metas["csrf-param"].getAttribute("name");
                },
                csrf_param_content: function() {
                    return metas["csrf-param"].getAttribute("content");
                },
                csrf_token_name: function() {
                    return metas["csrf-token"].getAttribute("name");
                },
                csrf_token_content: function() {
                    return metas["csrf-token"].getAttribute("content");
                }
            }
        }
    ]);

 }());