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

- bookmark_calendar

# アプリケーション概要

フォロー機能を実装したカレンダー、イベントの共有が出来るアプリです。自身の周りにライブが好きな方が沢山いる事もあり、一般ユーザー、アーティストと立場が異なる状態であってもそれぞれ違う情報で新規登録が出来るようになっております。また、フォロー機能を使って気に入ったユーザーや、自身が好きなアーティストの方をフォローする事で、イベントの予定やプロフィールの情報などが閲覧出来る仕組みのアプリになっております。

# アプリのURL

https://devise-bookmark-calendar.herokuapp.com/

# 今後の追加実装予定

- 日本語化機能
- 画像のプレビュー機能
- テストユーザー機能の実装

# ご利用方法

①トップページからユーザー、アーティストのどちらかで新規登録を行って下さい。  
②イベント作成のボタンから好きな日程へイベントの追加(作成)を行って下さい。  
③追加したイベントが指定した日付でカレンダーに登録されているかご確認下さい。  
④カレンダーに追加されたイベントタイトルから詳細画面、編集ボタンから編集画面へ切り替わるかご確認下さい。  
⑤ユーザー、アーティストのリストからスケジュール予定やイベント内容、プロフィールなどが閲覧出来るようになっているかご確認下さい。  
⑥ユーザー、アーティストの立場からそれぞれフォロー、フォロー解除がしっかり出来ているかご確認下さい。

# 目標にした事・拘りを持った所

- ユーザー、アーティストで登録する内容や発信する情報が違う事を想定して２つのアカウント機能を実装した点
- ユーザーだけでなく、好きなアーティストのライブ予定をカレンダーから確認出来るようにした点
- フォロー機能を追加する事で自身がお気にり登録したユーザー、アーティストの情報を一目で確認出来るようにした点

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