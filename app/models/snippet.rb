class Snippet < ActiveRecord::Base
  belongs_to :post

  validates :name, :post, :source, presence: true
  validates :gist_url, url: true, allow_blank: true
end
