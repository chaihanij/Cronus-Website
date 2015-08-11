(function(){
    
    var module = angular.module('cronus.document.controllers',['cronus.api.services','cronus.api.token']);
    module.controller('FileUploadPanelCtrl', function($scope, Api, Token, $http, Upload){
        // console.log(Upload);
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
        $scope.createDocumnet = function () {

            

            var formData = new FormData();
            // formData.append("authenticity_token]", $scope.csrf_token_content);
            formData.append("document[name]", $scope.doc.name);
            formData.append("document[description]", $scope.doc.description);
            formData.append("document[is_public]", $scope.doc.is_public);
            formData.append("document[product_id]", $scope.doc.product_id);
            formData.append("document[document]" , $scope.doc.file);
            var doc = [];
            doc['name']= $scope.doc.name;
            doc['description']= $scope.doc.description;
            doc['is_public']= $scope.doc.is_public;
            doc['product_id']= $scope.doc.product_id;
            doc['document']=  $scope.doc.file;
            console.log(doc);
            Api['Documnets'].create(doc, function(data){
                console.log(data);
            }, function(error){
                console.log(error)
            });
    
        }
    });

}());