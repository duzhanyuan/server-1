'use strict';

angular.module('beeeOnWebApp')
  .controller('ActiveGatewayCtrl',[ '$scope','$state','$stateParams','$log','$mdBottomSheet','$mdComponentRegistry', '$window' ,'Gateways','SidePanel','dialogs','navbar',
    function ($scope,$state,$stateParams,$log,$mdBottomSheet,$mdComponentRegistry,$window,Gateways,SidePanel,dialogs,navbar) {
      $scope.toggleRight= function (){
        SidePanel.toggleRight();
      };

      $scope.rightPanelOptions = SidePanel.getRightPanelOptions();

      navbar.setLocation('MENU.ACTIVE_GATEWAY');
      var forceReload = false;
      if($stateParams.reloadData){
        forceReload = true;
      }
      //retrieve gateway info
      Gateways.getSelectedInfo($stateParams.gatewayId,forceReload).then(function(data){
        $scope.gatewayInfo = data;
      },function(err){
        //TODO error handling
        $log.error(err);
      });



      $scope.showDevices = function(){
        $state.go('devices',{gatewayId:$scope.gatewayInfo.id});
      };

      $scope.showRightPanel = function(option){
        var newLocation = 'active-gateway.' + option;
        if(newLocation === $state.current.name){
          SidePanel.toggleRight();
        }else{
          $state.go(newLocation, {}, { location: false });
          /*$state.go(newLocation);*/
        }
      };
      $scope.showGridBottomSheet = function($event) {
        $mdBottomSheet.show({
          templateUrl: 'components/gateway/gateway-bottom-sheet/gateway-bottom-sheet.html',
          controller: 'GatewayBottomSheetCtrl',
          targetEvent: $event
        }).then(function(clickedItem) {
          if(clickedItem.id === 'delete'){
            $scope.showDeleteModal();
          }else{
            $scope.showRightPanel(clickedItem.id);
          }
        });
      };

      $scope.showDeleteModal = function () {
        dialogs.create(
          'components/modal/gateway/delete/delete.html',
          'DeleteGatewayCtrl',
          {
            name : Gateways.findGatewayById(Gateways.getSelectedId()).name
          },
          'lg'
        ).result.then(function(){
            Gateways.deleteGateway(Gateways.getSelectedId()).
              then(function(){
                $log.info('Gateway successfully deleted.');
                $state.go('home',{},{reload:true});
              },function(err){
                $log.error(err);
              });
          });
      };
    }]);
