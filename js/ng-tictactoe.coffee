game = game || {}

game.TicTacToe = angular.module("TicTacToe", [])

game.TicTacToe.controller("GameController", ($scope) ->
    
    $scope.players = [
        name: "Baloo"
        marker: "X"
        img_url: "img/baloo.gif"
        tilesSelected: []
        indicator: "current"
      ,
        name: "King Louie"
        marker: "O"
        img_url: "img/kingLouie.png"
        tilesSelected: []
        indicator: null
    ]

    $scope.board = [
        position: 0
        clicked: false
        img_url: null
      ,
        position: 1
        clicked: false
        img_url: null
      ,
        position: 2
        clicked: false
        img_url: null
      ,
        position: 3
        clicked: false
        img_url: null
      ,
        position: 4
        clicked: false
        img_url: null
      ,
        position: 5
        clicked: false
        img_url: null
      ,
        position: 6
        clicked: false
        img_url: null
      ,
        position: 7
        clicked: false
        img_url: null
      ,
        position: 8
        clicked: false
        img_url: null
    ]

    $scope.currentPlayer = $scope.players[0]

    $scope.turns = 0

    $scope.winCombos = [
        [0,1,2]
      ,
        [3,4,5]
      ,
        [6,7,8]
      ,
        [0,3,6]
      ,
        [1,4,7]
      ,
        [2,5,8]
      ,
        [0,4,8]
      ,
        [2,4,6]
    ]

    $scope.selectTile = (tile) ->
      if tile.clicked
        alert("Position already selected.  Please select another tile.")
      else
        tile.clicked = true
        $scope.turns += 1
        tile.img_url = $scope.currentPlayer.img_url
        $scope.currentPlayer.tilesSelected.push(tile.position)
        if not $scope.isWin($scope.currentPlayer.tilesSelected)
          if not $scope.isTie()
            $scope.togglePlayer()

    $scope.togglePlayer = ->
      if $scope.currentPlayer is $scope.players[0]
        $scope.currentPlayer = $scope.players[1]
        $scope.players[1].indicator = "current"
        $scope.players[0].indicator = null
        return
      else
        $scope.currentPlayer = $scope.players[0]
        $scope.players[0].indicator = "current"
        $scope.players[1].indicator = null
        return

    $scope.isWin = (playerTiles) ->
      for combo in $scope.winCombos
        if playerTiles.indexOf(combo[0]) >= 0 and playerTiles.indexOf(combo[1]) >= 0 and playerTiles.indexOf(combo[2]) >= 0
          alert("Winner! Game Over")
          return true
      return false

    $scope.isTie = ->
      if $scope.turns is 9
        alert("Game ends in a tie.")
        return true

    return

)