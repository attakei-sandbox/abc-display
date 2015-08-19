Promise = require 'bluebird'
Promise.resolve require './globals'

StartupContext = require('./contexts/startup').StartupContext
RuleSelector = require('./rules').RuleSelector
PlayerManager = Yama.players.PlayerManager

initProps =
  ruleSelector: new RuleSelector
  PlayerManager: new PlayerManager(12)

window.addEventListener 'DOMContentLoaded', ->
  App.router = new Arda.Router Arda.DefaultLayout, document.body
  App.router.pushContext StartupContext, initProps
