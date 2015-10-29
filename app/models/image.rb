class Image < ActiveRecord::Base
  belongs_to :proto
  mount_uploader :image, ImageUploader
  enum status: %i(main sub)
end
