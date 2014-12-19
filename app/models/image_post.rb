class ImagePost < ActiveRecord::Base
  belongs_to :post
  mount_uploader :image, ImageUploader
end
