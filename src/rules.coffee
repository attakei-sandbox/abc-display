YamaRules = require('yama').rules


# 連答つき5◯2×クイズ
class Rule_5maru2batsu extends YamaRules.RuleBase
  toWin: 5
  toLose: 2

  _judgeRight: (player) ->
    player.rights++

  _judgeWrong: (player) ->
    player.wrongs++

  _checkStateWin: (player) ->
    player.rights >= @toWin

  _checkStateLose: (player) ->
    player.wrongs >= @toLose

@Rule_5maru2batsu = Rule_5maru2batsu

