json.array!(@posts) do |post|
  json.extract! post, :id, :title, :slug, :content, :draft, :published_at
  json.url post_url(post, format: :json)
end
