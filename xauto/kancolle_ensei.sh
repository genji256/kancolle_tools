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

}

#-----補給関数-----
supply()
{

}

#-----main-----
mouseOpe $SUPPLY_X $SUPPLY_Y

echo "Done"

#-----todo-----
#各ボタンの座標を調べる
#補給艦数作成

#-----memo-----
#遠征からの帰還
#クリック→約5秒→クリック→クリック

