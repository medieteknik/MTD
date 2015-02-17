@mtdApp.controller 'HostsCtrl', ['$scope', '$http', ($scope, $http) ->
  #
  # When the moon is in the correct position and there's a eagle sitting on top
  # of the Kåkenhus tower, this controller should be refactored. It's a mess.
  #
  dispatcher = new WebSocketRails WEBSOCKET_URL

  # view setup
  $scope.view = 'cards'
  # are we editing the host need?
  $scope.editNeed = false
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
        $scope.message = $scope.message + 'Could not load hosts. Please contact webmaster.'
      )

  # load host positions
  $http.get('/admin/hosts/positions.json')
    .success((data) ->
        $scope.message = ''
        $scope.positions = data
      )
    .error((data) ->
        $scope.message = $scope.message + 'Could not load host positions. Please contact webmaster.'
      )

  # call this function when we need to update the need section of the page
  # it's ugly, but it works
  $scope.updatePosition = ->
    # $('.ui.progress').progress()
    angular.forEach $scope.positions, (position, key) ->
      res = $.grep $scope.hosts, (host) ->
        console.log(host)
        host.position is position.id
      $scope.positions[key].total = res.length

  # give $scope access to Math.min
  $scope.min = (a, b) ->
    return Math.min a, b

  # update host
  $scope.updateHost = (id, position) ->
    console.log 'Updating host: ', id, position
    dispatcher.trigger 'update_hosts', {id: id, position: position}

  $scope.updateNeed = (id, need) ->
    console.log 'Updating need: ', id, need
    dispatcher.trigger 'update_need', {id: id, need: need}

  # recieve update events
  dispatcher.bind 'update_hosts', (data) ->
    console.log 'Updating hosts...', data
    # find correct host
    angular.forEach $scope.hosts, (host, key) ->
      # make sure each client's scope is updated as it should
      if data.id is host.id
        $scope.$apply(->
          $scope.hosts[key].position = data.position
          )
    $scope.updatePosition()

  dispatcher.bind 'update_need', (data) ->
    console.log 'Updating need...', data
    # find correct host
    angular.forEach $scope.positions, (position, key) ->
      # make sure each client's scope is updated as it should
      if data.id is position.id
        $scope.$apply(->
          $scope.positions[key].need = data.need
          )
    $scope.updatePosition()

  return
]
