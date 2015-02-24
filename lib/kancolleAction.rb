#! /usr/bin/env ruby

#---------------------------------------------------------------------------
#
#艦これで行う操作をまとめたクラス
#
#ip対応表
#i pos
#0 無反応領域
#1 左上母港ボタン
#2 出撃ボタン
#3 補給ボタン
#4 遠征ボタン
#5 鎮守府海域
#6 南西諸島海域
#7 北方海域
#8 西方海域
#9 南方海域
#10 基準遠征名
#11 遠征決定ボタン
#12 遠征開始ボタン
#13 補給艦隊番号1
#14 補給艦隊番号2
#15 補給艦隊番号3
#16 補給艦隊番号4
#17 補給艦全選択ボタン
#18 まとめて補給ボタン
#19遠征艦隊番号1
#20遠征艦隊番号2
#21遠征艦隊番号3
#22遠征艦隊番号4
#---------------------------------------------------------------------------

require "./lib/mouseAction.rb"
require "./lib/inputPosition.rb"

class KancolleAction

	#初期化	
	def initialize(plist)
		@plist = plist
		@ma =MouseAction.new
	end

	#補給
	def supply(num)
		#補給画面へ
		@ma.move(@plist[3])
		@ma.clickLeft

		#補給する艦隊選択
		@ma.move(@plist[13 + num.to_i - 1])
		@ma.clickLeft

		#補給艦選択
		@ma.move(@plist[17])
		@ma.clickLeft

		#補給する
		@ma.move(@plist[18])
		@ma.clickLeft

		#母港へ戻る
		@ma.move(@plist[1])
		@ma.clickLeft

	end

	#遠征
	def exped(kai, i, num)
		#出撃画面へ
		@ma.move(@plist[2])
		@ma.clickLeft

		#遠征画面へ
		@ma.move(@plist[4])
		@ma.clickLeft

		#遠征先海域選択
		@ma.move(@plist[5 + kai - 1])
		@ma.clickLeft

		#遠征先選択
		@ma.moveEx(@plist[10].getX, (@plist[10].getY + 30 * (i - 1)))
		@ma.clickLeft
	
		#遠征決定
		@ma.move(@plist[11])
		@ma.clickLeft
	
		#遠征艦隊選択
		@ma.move(@plist[19 + num.to_i - 1])
		@ma.clickLeft
		
		#遠征開始
		@ma.move(@plist[12])
		@ma.clickLeft

		#母港へ戻る
		@ma.move(@plist[1])
		@ma.clickLeft

	end

end

pl = InputPosition.new.getData
ka = KancolleAction.new(pl)
#ka.supply(3)
ka.exped(2, 2, 3)
