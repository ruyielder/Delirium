class Post < ActiveRecord::Base
  has_many :post_tags
  has_many :tags, through: :post_tags

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, :slug, :content, presence: true
  validates_uniqueness_of :slug
  validates :tag_line, tag_line: true

  after_validation :move_slug_error_to_title
  after_save :rebuild_post_tags

  scope :published, -> {where(draft: false)}

  def rebuild_post_tags
    post_tags.all.destroy_all
    tag_names = TagsHelper::TagParser.new.parse(tag_line)
    current_tags = create_or_get_tags(tag_names)
    PostTag.import build_posts_tags(current_tags)
  end

  def move_slug_error_to_title
    errors.add :title, *errors.delete(:slug) if errors[:slug].present?
  end

  # Disable resolve conflict because I need unique slugs without extra UUID..
  def resolve_friendly_id_conflict(candidates)
    candidates.first
  end

  private

  def create_or_get_tags(tag_names)
    tags = []
    tag_names.each do |name|
      tag = Tag.new(name: name)
      begin
        tag.save!
      rescue ActiveRecord::RecordNotUnique, ActiveRecord::RecordInvalid
        tags << Tag.where(slug: tag.slug).first
      else
        tags << tag
      end
    end
    tags
  end

  def build_posts_tags(new_tags)
    posts_tags = []
    new_tags.each do |tag|
      posts_tags << PostTag.new(post_id: id, tag_id: tag.id)
    end
    posts_tags
  end
end
