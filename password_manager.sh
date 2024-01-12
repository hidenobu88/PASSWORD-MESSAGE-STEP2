#!/bin/bash


# 今回の仕様書（Quest）には、EXITが入力されるまでプログラムは終了しないとあるので「while文のdo〜done」を使用
# trueは条件が満たされる間、ループするという意味

while true; do

  echo "パスワードマネージャーへようこそ！"
  echo "次の選択肢から入力してください(Add Password/Get Password/Exit):"


# ユーザーからの入力を受け取りは、変数 selectで対応 
  read select

# シェルスクリプトでのcase文の閉じタグは「esac」

  case $select in

     # Add Passwordが選択された場合の処理コード
         "Add Password")
         read -p "サービス名を入力してください: " ServiceName
	 read -p "ユーザー名を入力してください: " UserName
	 read -p "パスワードを入力してください: " PassWord

        # 入力された情報を保存する処理と成功のお知らせを表示
	   echo "$ServiceName:$UserName:$PassWors" >> password_manager.sh
           echo "パスワードの追加は成功しました。"
	   ; 

     # Get Passwordが選択された場合の処理コード
         "Get Password")
         read -p "サービス名を入力してください: " ServiceName
         
              # ServiceName変数に対応するpassをファイルから取得
	      # grepはファイル中の文字列を検索するコマンド
	      # cutはテキストファイルを横方向に分割するコマンド
              PassWord=$(grep "^$ServiceName:" password_manager.sh | cut -d: -f3)


              # サービス名が登録されていなかった場合の処理はif文
              # シェルスクリプトでのif文の閉じタグは「fi」
         
	      if [ -z "$PassWord" ]; then
                  echo "そのサービスは登録されていません。"
              else
                  echo "サービス名：$ServiceName"
                  # 保存されている情報が見つかれば表示
                  echo "ユーザー名：$(grep "^$ServiceName:" password_manager.sh | cut -d: -f2)"
                  # 保存されている情報が見つかれば表示
                  echo "パスワード：$password"
              fi
              ;



















  esac













































done
