class Image < ActiveRecord::Base
  belongs_to :proto
  mount_uploader :image, ImageUploader
end
