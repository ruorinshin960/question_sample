# version

ruby 2.5.1
Rails 5.2.3

# DB設計 

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false,index: true|
|mail|string|null: false, unipue: true|

### Association
- has_many :posts
- has_many :comments
- has_many :groups, through: :group_users
- has_many :group_users

## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|group_name|string|null: false, unipue: true|

### Association
- has_many :users, through: :group_users
- has_many :group_users
- has_many :posts


## groups_usersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## postsテーブル

|Column|Type|Options|
|------|----|-------|
|body|text|null: false,index: true|
|image|string|null: true|
|user_id|integer|foreign_key: true|

### Association
- belongs_to :user
- has_many :comments

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|body|text|null: false|
|image|string|null: true|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :post
- belongs_to :user