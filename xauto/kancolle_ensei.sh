#!/bin/bash

#------------------------------
#遠征自動スクリプト
#
#第2艦隊：警備任務
#第3艦隊：海上護衛
#第4艦隊：防空射撃
#
#艦隊と遠征先の対応は上を予定
#それ以外に行きたい場合は
#内容変えてね
#------------------------------

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

#-----帰還処理関数-----
#遠征が帰還した際のクリック処理
#クリック→約5秒→クリック→クリック
returnHome()
{
	#
	defX=700
	defY=300


	mouseOpe $defX $defY

	sleep 6s

	mouseOpe $defX $defY

	mouseOpe $defX $defY

}

#-----出撃関数-----
#引数で指定された艦隊が遠征する
#遠征開始した時間を返す
sortie()
{
	echo "sortie"

	#遠征ボタンの座標
	expedX=700
	expedY=200

	#遠征先の座標
	enseiX=200	
	enseiRateY=30
	keibiY=200	#警備任務
	kaijouY=260	#海上護衛
	boukuY=290	#防空射撃

	#決定/遠征開始ボタンの座標
	decisionX=700
	decisionY=400

	#艦隊選択の座標
	kantaiRateX=30
	kantaiX=390
	kantaiY=80

	#出撃画面へ
	mouseOpe $SORTIE_X $SORTIE_Y

	#遠征画面へ
	mouseOpe $expedX $expedY

	sleep 2s

	#遠征先選択(警備任務、海上護衛、防空射撃)
	if [ $1 -eq 0 ]
	then
		mouseOpe $enseiX $keibiY	#警備任務
		echo "$1"
	elif [ $1 -eq 1 ]
	then 
		mouseOpe $enseiX $kaijouY	#海上護衛
		echo "$1"
	elif [ $1 -eq 2 ]
	then
		mouseOpe $enseiX $boukuY	#防空射撃
		echo "$1"
	fi

	#決定ボタンをクリック
	mouseOpe $decisionX $decisionY

	#艦隊の選択
	mouseOpe $((kantaiX+$1*kantaiRateX)) $kantaiY

	#遠征開始
	mouseOpe $decisionX $decisionY

	#遠征開始の時間を記録
	enseiStartTime=`date +%s`

	sleep 6s

	#ホーム画面へ
	mouseOpe 0 0

	echo $enseiStartTime
	return 
	
}

#-----補給関数-----
#第2〜4艦隊を補給する
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

	#補給画面へ
	mouseOpe $SUPPLY_X $SUPPLY_Y

	#3艦隊分繰り返す
	max=3
	for ((i=0; i<max; ++i))
	do
		echo "loop$i"
		#艦隊番号を指定
		mouseOpe $((kantaiX+rateX*i)) $kantaiY
		sleep 1s
	
		#全艦娘にチェックを入れる
		mouseOpe $checkKanX $checkKanY
		sleep 1s
	
		#補給ボタンをクリック
		mouseOpe $supplyBtnX $supplyBtnY
		sleep 1s
	done
	
	sleep 1s
	#ホーム画面へ戻る
	mouseOpe 0 0
}

#-----main-----
main()
{
	#-----遠征時間-----
	enseiTime=()
	enseiTime[0]=1260		#警備任務
	enseiTime[1]=5460		#海上護衛
	enseiTime[2]=2460		#防空射撃

	#-----遠征に出発した時間記録-----
	enseiStartTime=()
	enseiStartTime[0]=`sortie 1`
	enseiStartTime[1]=`sortie 2`
	enseiStartTime[2]=`sortie 3`
	
	while true
	do
		#5分毎処理する	
		sleep 5m

		for ((i=0; i<3; ++i))
		do
			#経過時間を求める
			t=`date +%s`
			et=$((t-{enseiStartTime[i]}))

			if [$et -gt ${enseiTime[$i]}]
			then
			#帰還フラグを立てる

			fi
			
	
		done
	
	done
	
	echo "Done"
	
}

main


#----todo-----
#各ボタンの座標を調べる

#-----memo-----

