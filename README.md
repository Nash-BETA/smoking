# アプリケーションについて

## 概要

喫煙可能店舗のみ掲載したレストラン紹介ポータルサイト

## 機能一覧

* ログイン機能
* スクレイピング（都道府県と店舗情報）
* 一覧ページのページネーション
* 口コミ投稿（テキスト）
* 口コミ投稿（画像）
* robots.txt
* sitemap.xml
* テストコード作成


【未実装】
* お気に入り

## 使用技術

* サーバー：GAE
* DB：sqlite3

# その他

## 目的
ruby,railsの勉強の為のポータルサイト
勉強に終わりがないように随時機能は追加して完成はありません。
「やっていくこと」と「できたこと」をこちらに記載して自分ができるようになったことを記録していきます。
また、上記記載の通り完成はありませんので「やっていくこと」は常に増えていきます。

（出来るだけ、issueを作成しそれに関するmergeはコメントにURLを記載して置くようにする）

## やっていくこと(勉強したい事)

* お気に入り機能
    ∟お気に入りページ
    ∟お気に入り登録

* 検索機能（ヘッダーにつける）

* 閲覧履歴

* etc...

## できたこと（実装できた内容）

* クローリング
* クローリングデータの自動DB登録
* お店のDBの作成
* お店の詳細ページ作成
* rubyのバージョンアップ 
* GCP（GAE）を利用してサイトを公開する
* 都道府県のDB作成
* TOPに都道府県ページへのリンク追加
* クローリングデータの加工
* 都道府県ページの作成（一覧にする）
　∟神奈川県のみお店の情報あり
* ヘッダーの作成（掲載店舗数,TOP導線）
* TOPデザイン（地域区切り）
* 一覧にリンク追加
* ルート設定にasをつけてPrefix設定
* 正規表現、gsub、文字列[nth, len]
* TOPの都道府県導線にDBがない場合、リンクを付けない
* デザインの設定 
* 会員登録
* ページネーション
* 口コミ投稿（画像投稿、テキスト投稿、ユーザーID、storeID取得）
* robots.txtの作成（もともとpublicにあった）
* sitemap.xml（.html.erbを.xml.erbにするとxmlで出てくる）
* ユーザー編集画面の作成
* ユーザーの画像設定
* Rspec導入ー勉強中


## Qiitaにまとめるもの
* クローリング方法

https://qiita.com/Nash-BETA/items/e9742f71c330e1a5f740

* クローリングをCSVダウンロード

https://qiita.com/Nash-BETA/items/fdc2c7b8878d0ffe9aea

* rubyのバージョンを上げようとしたら最新バージョンが表示されない

https://qiita.com/Nash-BETA/items/ad514b79421f8460042b

* GitHubでセキュリティ脆弱性のアラートが来てビビりながら対応した話（GemfileとGemfile.locの違い）

https://qiita.com/Nash-BETA/items/0d4e876cf9460778b985

* 開発中のrubyアプリのバージョンアップしようとしたらバージョン変わらなくて大変だった【2.5.5から2.6.3】

https://qiita.com/Nash-BETA/items/4c9e43b7ab12a0b45994

* Ruby on RailsのアプリをGAEでデプロイする方法

https://qiita.com/Nash-BETA/items/4c9e43b7ab12a0b45994

* DBにカラムを追加する

https://qiita.com/Nash-BETA/items/8dd34684b65f3c29861a

⇨数が増えてきたため追記は終了

https://qiita.com/Nash-BETA

## ポートフォリオとして利用するためにやっておくタスクリスト（9/15記載）
* ユーザー機能 (済)
* 口コミ機能 (済)
* 口コミに画像挿入 (済)
* お気に入り機能 ()
* 一覧ページのページネーション (済)
* テストコードの作成 (途中)

### 参考元 http://ur0.work/YxAe
* 記事一覧表示機能 
* 記事詳細表示機能
* 記事投稿機能
* 記事削除機能
* ユーザログイン機能
* ユーザログアウト機能
* 画像アップロード機能
* ページネーション機能
* 単体テスト機能（テストコード）
