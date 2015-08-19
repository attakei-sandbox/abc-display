# --------------------------------------
#
# 初期設定Context系パッケージ
#
# --------------------------------------


# 初期化画面用Context
class @StartupContext extends Arda.Context
  component:
    require('../components/startup').StartupComponent

  initState: (props) ->

  expandComponentProps: (props, state) ->

  delegate: (subscribe) ->
    super
