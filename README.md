# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# アプリケーション名

bookmark_calendar

# アプリケーション概要

カレンダーからイベントの内容が共有が出来るアプリです。自身のイベント内容はもちろん、自身の好きなアーティストのライブ予定もお気に入り登録(フォロー)をする事で知りたいイベント内容が簡単に閲覧出来るようになっています。お気に入り(フォロー)機能を駆使してたくさん友好関係を築いて頂き、気になった人のイベント内容を共有出来たらすごく便利なツールだと思ってアプリの作成をしました。たくさんの方にぜひ使って欲しいと願っております。

# アプリのURL

・https://devise-bookmark-calendar.herokuapp.com/  
・アプリのログイン方法  
→ ユーザー側でサインイン方をお願いします  
【ユーザー名】テスト  
【e-mail】test@gmail.com  
【password】ab0000  

# 使用技術（開発環境

・言語：Html,Css,Ruby,Ruby on rails
・フレームワーク：Ruby on Rails
・DB：mysql
・デプロイ先：heroku

# アプリ作成に至るまでの経緯と拘りを持った部分

今回のアプリ作成に至る経緯ですが、私を含め、周りの友人や先輩方にはライブ鑑賞するの方が非常に多い事もあり、そういったユーザーの課題、強いてはお好みのアーティストのライブ予定やイベント内容をカレンダーひとつで簡単に共有が出来れば便利になるのでは思い今回のアプリ作成に臨みました。また、アプリを作成する上で自身のレベルアップも目標に掲げていたので、敢えて自身が作ってみたいオリジナリティーを優先する形でアプリを作成しました。各機能自体は文献も多く存在するメジャーな機能ばかりになっておりますが、ユーザー・アーティストとアカウントテーブルを敢えて別々に設ける事で文献のコピペだけでは簡単には実装出来ないようにしてアプリの作成に臨みました。数多のトライ＆エラーを繰り返す事で、自分が作りたいアプリの仕様をお陰様で完成する事が出来ました。

# ご利用方法と各機能の説明

①トップページからユーザー、アーティストのどちらかで新規登録が出来る仕様になっています。  
[https://i.gyazo.com/bf1b6c7c0de318e926304b01259bd6f1.png  
②イベント作成のボタンからイベントの作成(追加)が可能になっており、カレンダーにもイベントが追加される仕様になっております。  
https://i.gyazo.com/78e0195648b6af0f5915a7c944c5847d.png  
③作成されたイベント内容は詳細の閲覧・編集・削除がそれぞれ出来る仕様になっております。  
https://i.gyazo.com/279182942e02f6dbdd16849a10905ce7.png  
④作成されたイベント内容は他のユーザー(アーティスト)からは編集・削除が出来ない仕様になっております。  
https://i.gyazo.com/40258c7c1f708591716bca61c23163fb.png  
⑤ユーザー(アーティスト)のリストからプロフィール・スケジュールが閲覧出来る仕様になっております。  
https://i.gyazo.com/57fc42fb85f040203f48fb86203c823c.png  
⑥ユーザー(アーティスト)からそれぞれフォロー・フォロー解除が出来る仕様になっております。  
https://i.gyazo.com/1a4001d60546512601e8cb65001d163a.png  
⑦フォロー・フォロワー画面からそれぞれのユーザー(アーティスト)の一覧が見れる仕様なっております。
https://i.gyazo.com/7f6c14ca2e50e22350c5a0c30d430123.png

# 工夫したポイント

・ユーザーとアーティストで登録する内容や発信する情報が違うためアカウントの登録方法を別々にした点  
・イベント作成した内容をカレンダーから分かりやすく内容を確認出来るようにした点  
・フォロー機能を追加する事で自身がお気にり登録したユーザー、アーティストの情報のみ閲覧出来るようにした点

# 課題解決の為に今後追加したい実装内容

・日本語化機能  
・テストユーザー機能の実装  
・アイコン画像のプレビュー機能  
・フォローした人のイベントをタイムライン化する実装

# DB設計

## users テーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| nickname | string  | null: false |
| sex      | integer | null: false |
| birthday | date    | null: false |
| email    | string  | null: false |
| password | string  | null: false |

### Association

- has_many :has_many :active_user_bookmarks, class_name: 'Bookmark', foreign_key: 'follower_id', dependent: :destroy
- has_many :has_many :passive_user_bookmarks, class_name: 'Bookmark', foreign_key: 'following_id', dependent: :destroy
- has_many :front_user_bookmarks, class_name: 'Bookmark', foreign_key: 'follower_id', dependent: :destroy
- has_many :back_artist_bookmarks, class_name: 'Bookmark', foreign_key: 'following_id', dependent: :destroy
- has_many :followers, through: :passive_user_bookmarks, source: :follower
- has_many :followings, through: :active_user_bookmarks, source: :following
- has_many :artist_followers, through: :back_artist_bookmarks, source: :followed
- has_many :artist_followings, through: :front_user_bookmarks, source: :follow
- has_many :events, dependent: :destroy

## artists テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| artistname  | string  | null: false |
| sex         | integer | null: false |
| discography | date    |             |
| twitter     | string  |             |
| facebook    | string  |             |
| instagram   | string  |             |
| email       | string  | null: false |
| password    | string  | null: false |

### Association

- has_many :active_artist_bookmarks, class_name: 'Bookmark', foreign_key: 'followed_id', dependent: :destroy
- has_many :passive_artist_bookmarks, class_name: 'Bookmark', foreign_key: 'follow_id', dependent: :destroy
- has_many :front_artist_bookmarks, class_name: 'Bookmark', foreign_key: 'followed_id', dependent: :destroy
- has_many :back_user_bookmarks, class_name: 'Bookmark', foreign_key: 'follow_id', dependent: :destroy
- has_many :followed_ids, through: :passive_artist_bookmarks, source: :followed
- has_many :follow_ids, through: :active_artist_bookmarks, source: :follow
- has_many :user_followed_ids, through: :back_user_bookmarks, source: :follower
- has_many :user_follow_ids, through: :front_artist_bookmarks, source: :following
- has_many :events, dependent: :destroy

## events テーブル

| Column      | Type      | Options                        |
| ----------- | --------- | ------------------------------ |
| title       | string    | null: false                    |
| content     | text      | null: false                    |
| start_time  | date_time | null: false                    |
| user_id     | integer   | null: false, foreign_key: true |
| artist_id   | integer   | null: false, foreign_key: true |

### Association

- belongs_to :belongs_to :user, optional: true
- belongs_to :belongs_to :artist, optional: true

## bookmarks テーブル

| Column       | Type    | Options    |
| ------------ | ------- | ---------- |
| following_id | integer |            |
| follower_id  | integer |            |
| follow_id    | integer |            |
| followed_id  | integer |            |

### Association

- belongs_to :following, class_name: 'User', optional: true
- belongs_to :follower, class_name: 'User', optional: true
- belongs_to :follow, class_name: 'Artist', optional: true
- belongs_to :followed, class_name: 'Artist', optional: true