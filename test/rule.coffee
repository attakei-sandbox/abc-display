# --------------------------------------
# ルール系モデルのテストケース
# --------------------------------------
require('./spec_helper')
target = require('../lib/rules')
Judge = require('yama').rules.Judge
PlayerState = require('yama').players.PlayerState


describe '5maru2batsu tests', () ->
  rule = new target.Rule_5maru2batsu
  player = {rights: 0, wrongs: 0}

  describe '#judge', () ->
    it 'with right', () ->
      rule.judge(player, Judge.Right)
      assert.equal 1, player.rights

    it 'with wrong', () ->
      rule.judge(player, Judge.Wrong)
      assert.equal 1, player.wrongs

  describe '#checkNextState', () ->
    it 'win regular', () ->
      player.rights = 5
      player.wrongs = 0
      assert.equal PlayerState.Win, rule.checkNextState(player)

    it 'lose regular', () ->
      player.rights = 0
      player.wrongs = 2
      assert.equal PlayerState.Lose, rule.checkNextState(player)
