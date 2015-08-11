(function(){

    var module = angular.module('cronus.document.directives', []);
      
    module.directive('fileUpload', function(){
        return {
            restrict: "AE",
            replace: true,
            // template: "<p>File Upload {{hello}}</p>",
            templateUrl: '/assets/ng/modules/document/fileupload.html',
            controller: 'FileUploadPanelCtrl',
            link: function(scope, element, attributes) {
              scope.initialize(element, attributes);
            }
        }
    });
  // module.directive('validName', function(){
  //   return {
  //       require: 'ngModel',
  //       link: function (scope, elm, attrs, ctrl) {
  //           ctrl.$parsers.unshift(function (viewValue) {
  //               // Any way to read the results of a "required" angular validator here?
  //               var isBlank = viewValue === ''
  //               var invalidChars = !isBlank && !/^[A-z0-9]+$/.test(viewValue)
  //               var invalidLen = !isBlank && !invalidChars && (viewValue.length < 5 || viewValue.length > 20)
  //               ctrl.$setValidity('isBlank', !isBlank)
  //               ctrl.$setValidity('invalidChars', !invalidChars)
  //               ctrl.$setValidity('invalidLen', !invalidLen)
  //               scope.usernameGood = !isBlank && !invalidChars && !invalidLen
  //           })
  //       }
  //   }
  // });
}());