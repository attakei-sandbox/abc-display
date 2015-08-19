# --------------------------------------
# ルール系モデルのテストケース
# --------------------------------------
require('./spec_helper')
target = require('../lib/contexts/startup')


describe 'MaruBatsuRule test', () ->
  context = new target.StartupContext
