#!/usr/bin/env ruby

#---------------------------------------------------------------------------
#
#数秒後のマウスポインタの座標を取得する
#
#---------------------------------------------------------------------------

class GetMousePos

	#初期化
	def initialize(num)
		@s = num	#秒数
	end
	
	#カウントダウン関数
	def countDown()
		puts "CountDown!"

#		inisec = Time.now.to_f
#		count = @s
#		while count >= 0 do
#			nowsec = Time.now.to_f
#			if nowsec -inisec > 1.0
#				puts count 
#				count -= 1
#			end
#		end

		@s.downto(0) { |num|
			puts num
			sleep 1
		}
	end
	
	#xmouseposコマンド実行関数
	def xmousepos
		return %x( /bin/bash './xmousepos.sh')
	end

	#xmouseposで取得した座標を整理する
	def clearPos
		value = xmousepos
		@pos = value.split(" ")
		#必要なのは画面全体からみた座標なのでそれ以外は取り除く
		@pos.delete_at(2)
		@pos.delete_at(2)
	end

	#カウントダウンから座標取得まで一連の流れを行う	
	def start
		countDown	
		clearPos
	end

	#取得した座標を配列で返す
	def getMousePos
		return @pos
	end

	#取得したX座標を返す
	def getX
		return @pos[0]
	end

	#取得したX座標を返す
	def getY
		return @pos[1]
	end

end

