## アプリケーション名
  「CHAT HANIL」

## アプリケーション概要
  日本人と韓国人が、投稿を通して疎通するアプリケーションです。アプリケーション名に含まれている「HANIL」は韓国語で日韓を意味します。  
  各国の魅力など発信したいことを画像付きで投稿することができます。 
  また、ヘッダー部分にあるリンクを押すことで日本語・韓国語表記への切り替えが可能です。

## 作成背景
  私は韓国が好きで趣味が韓国旅行なのですが、コロナウイルスの影響で海外旅行に行くことが困難になってしまいました。そこで、このご時世でもアプリケーションを通して日本の魅力を発信しながら韓国人と疎通できないかと考えこのアプリケーションを作成しました。

## 工夫したポイント
  日本人と韓国人が利用するのを想定して作成しているため、i18nを導入しリンクをクリックすることで日本語表記と韓国語表記に分けられるよう実装しました。  
  また、いいね機能を実装し、投稿にいいねをつけられるようにしました。

## 使用技術
  Ruby on Rails, Ruby, HTML, CSS, jQuery, GitHub

## 今後実装したい機能
  - JavaScriptでのコメント機能の非同期化
  - 一つの投稿に複数枚画像を投稿可能にする


## DB設計

### users テーブル

|Column             |Type      |Options      |
|-----------------  |--------  |-----------  |
|nickname           |string    |null: false  |
|email              |string    |null: false  |
|password           |string    |null: false  |
|last_name          |string    |null: false  |
|first_name         |string    |null: false  |
|last_name_eng      |string    |null: false  |
|first_name_eng     |string    |null: false  |
|sex_id             |integer   |null: false  |
|area_id            |integer   |null: false  |
|language_id        |integer   |null: false  |
|self_introduction  |text      |             |
|birthday           |date      |null: false  |

- has_many :posts
- has_many :room_users
- has_many :rooms, through :room_users
- has_many :messages
- has_many :likes
- has_many :comments

### posts テーブル

|Column   |Type        |Options                         |
|-------  |----------  |------------------------------  |
|content  |text        |null: false                     |
|user     |references  |null: false, foreign_key: true  |

- belongs_to :user
- has_many :likes
- has_many :comments


### likes テーブル

|Column  |Type        |Options                         |
|------  |----------  |------------------------------  |
|user    |references  |null: false, foreign_key: true  |
|post    |references  |null: false, foreign_key: true  |

- belongs_to :user
- belongs_to :post

### comments テーブル

|Column  |Type        |Options            |
|------  |----------  |-----------------  |
|text    |text        |                   |
|user    |references  |foreign_key: true  |
|post    |references  |foreign_key: true  |

- belongs_to :user
- belongs_to :post