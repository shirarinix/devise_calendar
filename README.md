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

この度はお忙しい中、アプリ概要をご覧頂き本当に有難うございます。本アプリには大きく分けて２つの機能がございます。一つはイベントの内容をカレンダーに反映させる機能。もう一つはお気に入り登録(相互フォロー)が出来る機能になっております。自身が気になっているユーザー(ファン同士)、もしくは応援しているアーティストをフォローしていく事でイベントの内容をフォローした一覧から共有・確認が出来る仕様になっております。フォロー機能を上手く使ってい頂き、たくさんのアーティスト、ファン同士で友好関係を築いて欲しいという思いでアプリを作成致しました。たくさんの方にぜひ使って欲しいと思っております。アプリ作成に至る経緯については最後の方にまとめさせ頂いております。ご興味がございましたらぜひご確認下さい。よろしくお願い致します。

### アプリのURL
https://devise-bookmark-calendar.herokuapp.com/  
### BASIC認証
【ID】shirarin  
【PASS】1999  
### アプリのログイン方法  
###### ファン会員よりログインの方をお願い致します  
【アカウント名】テスト  
【e-mail】test@gmail.com  
【password】ab0000  

# 使用技術（開発環境)

・言語：Html,Css,Ruby,javascript,Ruby on rails  
・フレームワーク：Ruby on Rails  
・DB：mysql  
・デプロイ先：heroku

# ご利用方法と各機能の説明

①トップページからユーザー(ユーザー)会員、アーティスト会員のどちらかで新規登録が出来る仕様になっております。【アプリ内ではユーザーはファン会員という仕様になっておりますのでご注意下さい！！】  
[![Image from Gyazo](https://i.gyazo.com/bf1b6c7c0de318e926304b01259bd6f1.png)](https://gyazo.com/bf1b6c7c0de318e926304b01259bd6f1)  

②イベント作成ボタンからイベントの作成(追加)が可能になっており、カレンダーにイベントが反映される仕様になっております。  
[![Image from Gyazo](https://i.gyazo.com/78e0195648b6af0f5915a7c944c5847d.png)](https://gyazo.com/78e0195648b6af0f5915a7c944c5847d)  

③作成されたイベント内容は詳細の閲覧・編集・削除がそれぞれ出来る仕様になっております。  
[![Image from Gyazo](https://i.gyazo.com/279182942e02f6dbdd16849a10905ce7.png)](https://gyazo.com/279182942e02f6dbdd16849a10905ce7)  

④作成されたイベント内容は他のユーザー(アーティスト)からは編集・削除が出来ない仕様になっております。  
[![Image from Gyazo](https://i.gyazo.com/40258c7c1f708591716bca61c23163fb.png)](https://gyazo.com/40258c7c1f708591716bca61c23163fb)  

⑤ユーザー(アーティスト)のリストからプロフィール・カレンダーが閲覧出来る仕様になっております。  
[![Image from Gyazo](https://i.gyazo.com/57fc42fb85f040203f48fb86203c823c.png)](https://gyazo.com/57fc42fb85f040203f48fb86203c823c)  

⑥ユーザー(アーティスト)からそれぞれフォロー・フォロー解除が出来る仕様になっております。  
[![Image from Gyazo](https://i.gyazo.com/1a4001d60546512601e8cb65001d163a.png)](https://gyazo.com/1a4001d60546512601e8cb65001d163a)  

⑦フォロー・フォロワー画面からそれぞれのユーザー(アーティスト)の一覧が見れる仕様なっております。  
[![Image from Gyazo](https://i.gyazo.com/7f6c14ca2e50e22350c5a0c30d430123.png)](https://gyazo.com/7f6c14ca2e50e22350c5a0c30d430123)

# 工夫したポイント

・ユーザーとアーティストで登録する内容や発信する情報が違うと考えた為、アカウント登録を別々にした点  
・イベント作成した内容をカレンダーに反映させる事で内容を一目で分かるように工夫した点  
・フォロー機能を追加した事で自身がお気にり登録したユーザー、アーティストの情報を閲覧出来るようにした点

# 今後追加したい実装の内容

・日本語化機能  
・テストアカウント機能  
・アイコン画像のプレビュー機能  
・必要に応じてイベントを色分け、非表示にする機能  
・フォローした人のイベントをタイムラインで一覧表示する機能

## アプリ作成に至るまでの経緯とこだわりについて

今回のアプリ作成に至る経緯についてですが、私をはじめ周りの友人や先輩方にライブ鑑賞を趣味としている方が非常に多かった事もあり、自身のライブ予定やイベントの内容をカレンダーに反映させたり、共有したりする事が出来ればすごく便利になるのではないかと思い今回アプリの作成に臨みました。また、アーティスト活動をされている方も同時に応援がする事が出来ればもっと便利だと思い、アーティストの枠も追加しました。お気に入り登録(相互フォロー)を可能にする事で自身のお気に入り一覧を作成し、気になった方の活動履歴やライブスケジュールの予定を閲覧出来るように自分なりに考えて工夫を致しました。アプリを作成する上で自身のレベルアップも目標に掲げていたので、自身が作ってみたいオリジナリティーを追求する形でアプリの作成に臨みました。数多くのトライ＆エラーを繰り返し、自身が作りたいアプリの仕様を無事に完成させる事が出来ました。今後は、自身の友人、先輩、応援しているアーティストさんの方々にアプリを使用して頂き、ご意見、ご感想を承りながらアプリのアップデート(追加実装)に真摯に取り組みたいと考えております。ここまで読んで下本当に有難うございます。

# DB設計

## users テーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| nickname | string  | null: false |
| sex      | integer | null: false |
| birthday | date    | null: false |
| hobby    | string  |             |
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
| birthday    | date    | null: false |
| hobby       | string  |             |
| discography | text    |             |
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
| start_time  | datetime  | null: false                    |
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