class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, :slug, :content, presence: true
  validates_uniqueness_of :slug

  after_validation :move_slug_error_to_title

  def move_slug_error_to_title
    errors.add :title, *errors.delete(:slug) if errors[:slug].present?
  end

  # Disable resolve conflict because I need unique slugs without extra UUID..
  def resolve_friendly_id_conflict(candidates)
    candidates.first
  end
end
