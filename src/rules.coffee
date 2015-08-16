YamaRules = require('yama').rules


# 連答つき5◯2×クイズ
class Rule_5maru2batsu extends YamaRules.RuleBase
  # 勝抜正解数
  toWin: 5
  # 失格誤答数
  toLose: 2
  # 正解数アドバンテージ
  advantages: [3, 2, 2, 1, 1, 1, ]

  constructor: ->
    # 連答権所持プレイヤー
    @currentRightAnswer = null

  # 正解時に◯を1個付与する。また、連答権を得る
  # 連答権を持っている状態で正解すると、無条件で勝抜け分の◯を得る
  _judgeRight: (player) ->
    if @currentRightAnswer == player
      player.rights = @toWin
    else
      player.rights++
      @currentRightAnswer = player

  # 正解時に✕を1個付与する。また、連答権を持っていた場合に失う
  _judgeWrong: (player) ->
    player.wrongs++
    if @currentRightAnswer == player
      @currentRightAnswer = null

  _checkStateWin: (player) ->
    player.rights >= @toWin

  _checkStateLose: (player) ->
    player.wrongs >= @toLose

  provideAdvantage: (players) ->
    for value, idx in @advantages
      players[idx].rights = value

@Rule_5maru2batsu = Rule_5maru2batsu
