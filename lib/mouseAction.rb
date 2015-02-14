#! /usr/bin/env ruby

#---------------------------------------------------------------------------
#
#マウス操作を行うクラス
#
#---------------------------------------------------------------------------

require "./lib/positionManager.rb"

class MouseAction

	#初期化
	def initialize()

	end

	#マウスポインタを移動させる
	def move(pm)
		%x(xte "mousemove #{pm.getX} #{pm.getY}")
		sleep 1
	end

	#左クリックを行う
	def clickLeft
		%x(xte "mouseclick 1")
		sleep 4
	end

end

