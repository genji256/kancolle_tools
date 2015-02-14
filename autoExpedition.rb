#! /usr/bin/env ruby

#---------------------------------------------------------------------------
#
#自動遠征スクリプト
#
#---------------------------------------------------------------------------

require "./lib/mouseAction.rb"
require "./lib/positionManager.rb"

#マウス操作オブジェクト
ma = MouseAction.new()
#左上の母港
boko = PositionManager.new(1021, 283, 35, 35)
#出撃
syutu = PositionManager.newIni(195, 261)

#出撃画面へ
ma.move(syutu)
ma.clickLeft()

#母港へ戻る
ma.move(boko)
ma.clickLeft()


