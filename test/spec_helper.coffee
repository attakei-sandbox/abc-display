jsdom = require('jsdom').jsdom
global.document  = jsdom('<html><body></body></html>')
# global.window    = document.parentWindow # 追記 jsdom v4.0で parentWindow -> defaultView
global.window    = document.defaultView
global.navigator = window.navigator

# TestUtilsを使うためにreact/addonsを読み込む
global.Promise = require('bluebird')
global.React = require('react/addons')
global.Arda = require('arda')

# Assert
global.assert = require('power-assert')
