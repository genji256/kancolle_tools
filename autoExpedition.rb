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
#無反応領域
na = PositionManager.newIni(432, 242)

while true do
	#タイムスタンプ
	t = Time.now
	puts "#{t.month} #{t.day} #{t.hour} #{t.min} #{t.sec}"

	#出撃画面へ
	puts "出撃画面へ移動します"
	ma.move(syutu)
	ma.clickLeft()
	
	#母港へ戻る
	puts "母港へ移動します"
	ma.move(boko)
	ma.clickLeft()

	#無反応領域をクリック
	ma.move(na)
	ma.clickLeft()
	ma.clickLeft()
	ma.clickLeft()
	ma.clickLeft()
	ma.clickLeft()
	ma.clickLeft()
	ma.clickLeft()
	ma.clickLeft()
	ma.clickLeft()
	ma.clickLeft()

	sleep (rand(300) + 200)
end

