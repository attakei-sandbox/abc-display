Arda = require('arda')
React = require('react/addons')

# StartupComponent用mixn
StartupComponentActions = {}


@StartupComponent = React.createClass
  mixins: [
    Arda.mixin,
    StartupComponentActions,
  ]

  getInitialState: ->
    {}

  render: ->
    require("./StartupComponent") @
