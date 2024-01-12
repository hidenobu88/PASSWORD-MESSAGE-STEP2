#!/bin/bash


# 今回の仕様書（Quest）には、EXITが入力されるまでプログラムは終了しないとあるので「while文のdo〜done」を使用
# trueは条件が満たされる間、ループするという意味

while true; do

  echo "パスワードマネージャーへようこそ！"
  echo "次の選択肢から入力してください(Add Password/Get Password/Exit):"


# ユーザーからの入力を受け取りは、変数 selectで対応 
  read select

# シェルスクリプトでのcase文のルールは「esac」で最後閉じる
  case $select in
     
     # Add Passwordの処理（read関数で入力受付の変数も設定）
     "Add Password")
        read -p "サービス名を入力してください: " ServiceName
	read -p "ユーザー名を入力してください: " UserName
	read -p "パスワードを入力してください: " PassWord

	# 入力された情報を保存する処理
	echo "$ServiceName:$UserName:$PassWors" >> password_manager.sh
        echo "パスワードの追加は成功しました。"
	;










 
 
  esac









done
