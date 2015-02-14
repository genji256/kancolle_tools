#! /usr/bin/env ruby

#---------------------------------------------------------------------------
#
#艦これで使われているボタンの座標を調べるスクリプト
#
#---------------------------------------------------------------------------

require "./getMousePos/getMousePos.rb"


x = 1021
y = 283

o = GetMousePos.new(3)
#o.start
while true do
	sleep 1
	o.clearPos
	puts "x:#{o.getX.to_i - x} y:#{o.getY.to_i - y}"
end


