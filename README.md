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

- protos
 - catch_copy
 - concept
 - user_id

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