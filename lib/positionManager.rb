#! /usr/bin/env ruby


#---------------------------------------------------------------------------
#
#絶対値で座標を管理するクラス
#
#---------------------------------------------------------------------------

require "./lib/position.rb"

class PositionManager

	#初期化
	def initialize(defX, defY, x, y)
		@@defPos = Position.new(defX, defY)
		@pos = Position.new(x, y)
	end
	
	#コンストラクタのオーバーロード
	def self.newIni(x, y)
		return PositionManager.new(@@defPos.getX, @@defPos.getY, x, y)	
	end

	#画面全体からみたX座標を返す
	def getX()
		return @@defPos.getX() + @pos.getX()
	end

	#画面全体からみたY座標を返す
	def getY()
		return @@defPos.getY() + @pos.getY()
	end

end

