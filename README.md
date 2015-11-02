== README

# DB構成

##テーブル
- users
- prototypes
- images
- comments
- tags
- likes
- prototypes_tags

##アソシエーション
- users
 - has_many :prototypes
 - has_many :comments
 - has_many :likes

- prototypes
 - belongs_to :user
 - has_many :images
 - has_many :comments
 - has_many :tags,through: :prototype_tags
 - has_many :likes

- images
 - belongs_to :prototype

- comments
 - belongs_to :user
 - belongs_to :prototype

- tags
 - has_many :prototypes,through: :prototype_tags

- likes
 - belongs_to :user
 - belongs_to :prototype

- tags_prototypes
 - belongs_to :prototype
 - belongs_to :tag

##カラム

- users
 - devise関連のカラム（username,email,passwordなど）
 - member
 - profile
 - works
 - avatar

- prototypes
 - title
 - catch_copy
 - concept
 - user_id

- images
 - image
 - prototype_id

- comments
 - text
 - user_id
 - prototype_id

- tags
 - tag

- likes
 - user_id
 - prototype_id

- tags_prototypes
 - prototype_id
 - tag_id