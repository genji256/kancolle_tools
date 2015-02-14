#! /usr/bin/env ruby

#---------------------------------------------------------------------------
#
#座標を保持するクラス
#
#---------------------------------------------------------------------------

class Position
	
	#初期化
	def initialize(x, y)
		@x = x
		@y = y
	end

	#座標を配列で返す
	def getPos()
		return [@x, @y]
	end

	#X座標を返す
	def getX()
		return @x
	end

	#Y座標を返す	
	def getY()
		return @y
	end
end


