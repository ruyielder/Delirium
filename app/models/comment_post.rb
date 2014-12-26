class CommentPost < ActiveRecord::Base
  belongs_to :post
  belongs_to :admin_user

  validates :name, :content, presence: true
  validates :email, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, allow_blank: true
  validates :url, url: true, allow_blank: true

  validates_length_of :name, minimum: 2, maximum: 30
  validates_length_of :email, minimum: 8, maximum: 150, allow_blank: true
  validates_length_of :url, minimum: 5, maximum: 250, allow_blank: true
  validates_length_of :content, minimum: 3, maximum: 1000

  scope :published, -> {where(blocked: false)}
end
