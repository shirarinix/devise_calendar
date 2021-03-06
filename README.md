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
【アプリ機能】
※本アプリには大きく分けて３つの機能がございます。
- ファンとアーティストの立場で別々にユーザー登録が出来る機能。
- イベントの内容をカレンダーに反映させる機能。
- お気に入り登録(相互フォロー)をする事でスケジュールの確認が出来る機能。

【制作目的】

気になっているユーザー(ファン同士)、もしくは応援しているアーティストをフォローする事でスケジュール一覧からイベントの内容を確認・共有が出来るようにしました。

【どんな時に使うの？？】
- 自分の好きなアーティストのライブスケジュールを確認したい時
- 友達同士でお互いのスケジュールを確認したい時
- 相互フォローからお互いのプロフィールやフォロワーを確認したい時

たくさんの方々にぜひ使って欲しいと思っております。
本アプリの作成に至るまでの詳しい経緯については最後の方にまとめております。
ご興味がありましたらぜひ一度ご覧下さい。よろしくお願い致します。

### アプリのURL
【AWS】http://3.113.90.130/

【heroku】https://devise-bookmark-calendar.herokuapp.com/

### BASIC認証
【ID】shirarin
【PASS】1999

### アプリのログイン方法
###### ↓ファン会員よりログインの方をお願い致します
【アカウント名】テスト

【e-mail】test@gmail.com

【password】ab0000

# 使用技術（開発環境）
- 言語：Html/Css/Ruby/javascript/
- フレームワーク：Ruby on Rails
- DB：mysql
- デプロイ先：heroku/AWS

# ご利用方法と各機能毎のご説明

1.トップページからファン(ユーザー)会員、アーティスト会員のどちらかで新規登録が出来る仕様になっています。【アプリ内でユーザーはファン会員という仕様になっておりますのでご注意下さい！！】
[![Image from Gyazo](https://i.gyazo.com/bf1b6c7c0de318e926304b01259bd6f1.png)](https://gyazo.com/bf1b6c7c0de318e926304b01259bd6f1)
***
2.イベント作成ボタンからイベントの作成(追加)が可能になっており、カレンダーにイベントが反映される仕様になっています。
[![Image from Gyazo](https://i.gyazo.com/78e0195648b6af0f5915a7c944c5847d.png)](https://gyazo.com/78e0195648b6af0f5915a7c944c5847d)
***
3.作成されたイベント内容は詳細の閲覧・編集・削除がそれぞれ出来る仕様になっています。
[![Image from Gyazo](https://i.gyazo.com/279182942e02f6dbdd16849a10905ce7.png)](https://gyazo.com/279182942e02f6dbdd16849a10905ce7)
***
4.作成されたイベント内容は他のファン(ユーザー)、アーティストからは編集・削除が出来ない仕様になっています。
[![Image from Gyazo](https://i.gyazo.com/40258c7c1f708591716bca61c23163fb.png)](https://gyazo.com/40258c7c1f708591716bca61c23163fb)
***
5.ファン(ユーザー)、アーティストのリストからそれぞれプロフィールやカレンダーの内容が閲覧出来る仕様になっています。
[![Image from Gyazo](https://i.gyazo.com/57fc42fb85f040203f48fb86203c823c.png)](https://gyazo.com/57fc42fb85f040203f48fb86203c823c)
***
6.ファン(ユーザー)、アーティストからそれぞれフォローとフォロー解除が出来る仕様になっています。
[![Image from Gyazo](https://i.gyazo.com/1a4001d60546512601e8cb65001d163a.png)](https://gyazo.com/1a4001d60546512601e8cb65001d163a)
***
7.フォロー・フォロワー画面からそれぞれのファン(ユーザー)、アーティストの一覧(リスト)が見られる仕様なっています。
[![Image from Gyazo](https://i.gyazo.com/7f6c14ca2e50e22350c5a0c30d430123.png)](https://gyazo.com/7f6c14ca2e50e22350c5a0c30d430123)

## こだわりポイント

- ユーザー登録をファン会員とアーティスト会員で分けた点
- イベント内容をカレンダーでも確認できる点
- フォロー、フォロワー機能を加えた点

# 今後追加したい実装内容

- 日本語化機能
- テストアカウント機能
- プロフィールの編集機能
- 必要に応じてイベントを色分け、非表示にする機能
- フォローした人のイベントをタイムラインで一覧表示する機能

## 【アプリ作成に至るまでの経緯とこだわりについて】

今回のアプリ作成に至る経緯についてですが、私をはじめ周りの友人や先輩方にライブ鑑賞を趣味としている方が非常に多かった事もあり、自身のイベント予定やライブスケジュールの内容をカレンダーに反映させ、共有する事が出来ればすごく便利になるのではないかと考えて今回のアプリ作成に臨みました。また、同時にアーティスト活動をされている方の応援も出来るような形にしたかった為、アーティストの枠も付け加えて実装を行いました。お気に入り登録(相互フォロー)を可能にする事で、自身のお気に入り一覧から気になった人の活動履歴やライブのスケジュールを確認したり、共有したりする事が実際に出来れば、周りの方々の課題解決やアーティストの応援材料として役立つアプリになると思い、自分なりに創意工夫をして実装に取り組みました。自身が作ってみたいオリジナリティーを追求した形のアプリだったので、数多くのトライ＆エラーを繰り返しましたが、無事に完成させる事が出来ました。今後は、自身の友人、先輩、また応援しているアーティストさんの方々に本アプリを実際に使用して頂き、ご意見、ご感想を頂戴しながらアプリのアップデート(追加実装)に真摯に取り組んで参りたいと考えております。その上で得た経験値をお仕事でもぜひ役立てていきたいと考えております。最後まで私の想いも読んで下さり、誠に有難うございます。

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
