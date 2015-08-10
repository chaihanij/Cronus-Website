(function(){
    
    var module = angular.module('cronus.document.controllers',['cronus.api.services','cronus.api.token']);
    module.controller('FileUploadPanelCtrl', function($scope, Api, Token, $http){
        
        /**
        * Initialize  all the variables
        */
        $scope.initialize = function(element, attributes){
            // console.log(element);
            // console.log(attributes);
            $scope.element = element;
           
        }


        $scope.csrf_param_content = Token.csrf_param_content();
        $scope.csrf_token_content = Token.csrf_token_content();
         

        $scope.products_is_public = Api['Products'].products_is_public();

        $scope.param = {};
        $scope.createDocumnet = function (documents) {

            var file = document.getElementById('document_document').files[0];
            var file = file ? file : null;
            var documentValue =[] ;
            documentValue['name'] = documents.name;
            documentValue['description'] = documents.description;
            documentValue['is_public'] = documents.is_public;
            documentValue['product_id'] = documents.product_id;
            documentValue['document'] = file;
            // documentValue['authenticity_token'] =  Api['Products'].products_is_public();
            
            // console.log(documentValue); 

            var formData = new FormData();
            formData.append("authenticity_token]", $scope.csrf_token_content);
            formData.append("document[name]", documents.name);
            formData.append("document[description]", documents.description);
            formData.append("document[is_public]", documents.is_public);
            formData.append("document[product_id]", documents.product_id);
            formData.append("document[document]" ,file);

            $http({
                method: 'POST',
                url: '/api/v1/documents',
                data: formData,
                headers: {
                    contentType: false,
                }
            }).success(function(data, status, headers, config) {
                console.log(data, status, headers, config);
            }).error(function (data, status, headers, config) {
                // handle error things
                console.log(data, status, headers, config);
            });
        }
    });

}());