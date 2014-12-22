class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, :slug, presence: true
  validates_uniqueness_of :slug

  after_validation :move_slug_error_to_name

  def move_slug_error_to_name
    errors.add :name, *errors.delete(:slug) if errors[:slug].present?
  end

  # Disable resolve conflict because I need unique slugs without extra UUID..
  def resolve_friendly_id_conflict(candidates)
    candidates.first
  end
end