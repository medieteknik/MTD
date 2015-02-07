@mtdApp.controller 'HostsCtrl', ['$scope', '$http', ($scope, $http) ->
  dispatcher = new WebSocketRails WEBSOCKET_URL

  # view setup
  $scope.view = 'cards'
  # prepare hosts scope
  $scope.positions = []
  $scope.hosts = []
  $scope.message = 'Loading hosts...'
  # ordering
  $scope.predicate = 'id'
  $scope.reverse = false

  # load hosts
  $http.get('/admin/hosts.json')
    .success((data) ->
        $scope.message = ''
        $scope.hosts = data
      )
    .error((data) ->
        $scope.message = 'Could not load hosts. Please contact webmaster.'
      )
  # load host positions
  $http.get('/admin/hosts/positions.json')
    .success((data) ->
        $scope.message = ''
        $scope.positions = data
      )
    .error((data) ->
        $scope.message = 'Could not load host positions. Please contact webmaster.'
      )

  # connect socket
  dispatcher.on_open = (data) ->
    console.log 'Connection has been established: ', data

  # recieve update event
  dispatcher.bind 'update_hosts', (data) ->
    console.log 'Updating hosts...', data
    # find correct host
    angular.forEach $scope.hosts, (host, key) ->
      # make sure each client's scope is updated as it should
      $scope.$apply(->
        $scope.hosts[key].position = data.position
        ) if data.id is host.id

  # update host
  $scope.updateHost = (id, position) ->
    console.log 'Updating host: ', id, position
    dispatcher.trigger 'update_hosts', {id: id, position: position}

  return
]
