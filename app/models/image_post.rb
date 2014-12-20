class ImagePost < ActiveRecord::Base
  belongs_to :post
  mount_uploader :image, ImageUploader

  validates :basename, format: { with: /\A\p{Word}+\z/ }
  validates :image, presence: true
end
