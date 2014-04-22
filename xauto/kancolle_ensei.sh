#!/bin/sh

#-----艦これFlashの左上の座標-----
KAN_X=450
KAN_Y=200

#-----出撃ボタンの座標-----
SORTIE_X=170
SORTIE_Y=250

#----補給ボタンの座標-----
SUPPLY_X=50
SUPPLY_Y=210

#-----マウス操作関数-----
mouseOpe()
{
	posX=$(($1+KAN_X))
	posY=$(($2+KAN_Y))

	echo "$posX, $posY"
	xte "mousemove $posX $posY"
	sleep 1s
	xte "mouseclick 1"
}

#-----出撃関数-----
sortie()
{
	echo "sortie"
}

#-----補給関数-----
supply()
{
	echo "supply"

	#艦隊番号ボタンの座標
	rateX=30
	kantaiY=80
	kantaiX=165
	kantai3X=190
	kantai4X=220

	#艦娘チェックボタンの座標
	checkKanX=110
	checkKanY=80

	#補給ボタンの座標
	supplyBtnX=700
	supplyBtnY=400

	#補給ボタンをクリックして補給画面へ
	mouseOpe $SUPPLY_X $SUPPLY_Y

	#3艦隊分繰り返す
	i=0
	max=3

	while [ $i -lt $max ]
	do
		echo "loop$i"
		#艦隊番号を指定
		mouseOpe $((kantaiX+rateX\*i)) $kantaiY
		sleep 1s
	
		#全艦娘にチェックを入れる
		mouseOpe $checkKanX $checkKanY
		sleep 1s
	
		#補給ボタンをクリック
		mouseOpe $supplyBtnX $supplyBtnY
		sleep 1s

		i=$((i+1))

	done
	
	sleep 1s
	#ホーム画面へ戻る
	mouseOpe 0 0

}

#-----main-----
supply


echo "Done"

#-----todo-----
#各ボタンの座標を調べる
#補給艦数作成

#-----memo-----
#遠征からの帰還
#クリック→約5秒→クリック→クリック

