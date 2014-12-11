class CommentPost < ActiveRecord::Base
  belongs_to :post

  validates :name, :content, presence: true
  validates :email, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, allow_blank: true
  validates :url, url: true, allow_blank: true

  scope :published, -> {where(blocked: false)}
end
