class Prototype < ActiveRecord::Base
  has_many :images
  belongs_to :user
  has_many :likes
  has_many :comments
  accepts_nested_attributes_for :images

  def like_user(user)
    likes.find_by(user_id: user)
  end

end
