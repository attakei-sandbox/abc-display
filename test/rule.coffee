# --------------------------------------
# ルール系モデルのテストケース
# --------------------------------------
require('./spec_helper')
target = require('../lib/rules')
Judge = require('yama').rules.Judge
PlayerState = require('yama').players.PlayerState


describe '5maru2batsu tests', () ->
  describe '#judge', () ->
    rule = new target.Rule_5maru2batsu

    it 'with right', () ->
      player = {rights: 0, wrongs: 0}
      rule.judge(player, Judge.Right)
      assert.equal 1, player.rights
      assert.equal player, rule.currentRightAnswer

    it 'with right after right', () ->
      player = {rights: 0, wrongs: 0}
      rule.judge(player, Judge.Right)
      rule.judge(player, Judge.Right)
      assert.equal 3, player.rights
      assert.equal player, rule.currentRightAnswer

    it 'with wrong', () ->
      player = {rights: 0, wrongs: 0}
      rule.judge(player, Judge.Wrong)
      assert.equal 1, player.wrongs

    it 'with wrong after right', () ->
      player = {rights: 0, wrongs: 0}
      rule.currentRightAnswer = player
      rule.judge(player, Judge.Wrong)
      assert.equal null, rule.currentRightAnswer

  describe '#checkNextState', () ->
    rule = new target.Rule_5maru2batsu
    player = {rights: 0, wrongs: 0}

    it 'win regular', () ->
      player.rights = 5
      player.wrongs = 0
      assert.equal PlayerState.Win, rule.checkNextState(player)

    it 'lose regular', () ->
      player.rights = 0
      player.wrongs = 2
      assert.equal PlayerState.Lose, rule.checkNextState(player)

  it '#provideAdvantage', () ->
    rule = new target.Rule_5maru2batsu
    players = [
      {rights: 0, wrongs: 0},
      {rights: 0, wrongs: 0},
      {rights: 0, wrongs: 0},
      {rights: 0, wrongs: 0},
      {rights: 0, wrongs: 0},
      {rights: 0, wrongs: 0},
      {rights: 0, wrongs: 0},
    ]
    rule.provideAdvantage(players)
    assert.equal 3, players[0].rights
    assert.equal 2, players[1].rights
    assert.equal 1, players[3].rights
    assert.equal 0, players[6].rights
