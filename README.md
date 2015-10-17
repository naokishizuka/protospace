== README

# DB構成

##テーブル
- users
- protos
- images
- comments
- tags
- likes
- proto_tags

##アソシエーション
- users
 - has_many :protos
 - has_many :comments
 - has_many :likes

- protos
 - belongs_to :user
 - has_many :images
 - has_many :comments
 - has_many :tags
 - has_many :likes

- images
 - belongs_to :proto

- comments
 - belongs_to :user
 - belongs_to :proto

- tags
 - has_many :protos

- likes
 - belongs_to :user
 - belongs_to :proto

- proto_tags
 - belongs_to :proto
 - belongs_to :tag

##カラム

- users
 - devise関連のカラム（username,email,passwordなど）
 - member
 - profile
 - works
 - avatar
 - proto_id
 - comment_id
 - like_id

- protos
 - catch_copy
 - concept
 - user_id
 - comment_id
 - image_id
 - tag_id
 - like_id

- images
 - image
 - proto_id

- comments
 - comment
 - user_id
 - proto_id

- tags
 - tag

- likes
 - user_id
 - proto_id

- proto_tag
 - proto_id
 - tag_id

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


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
