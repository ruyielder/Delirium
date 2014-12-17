class Snippet < ActiveRecord::Base
  attr_writer :gist_client

  belongs_to :post

  validates :name, :post, :source, presence: true
  validates :gist_url, url: true, allow_blank: true

  before_save :update_gist_url

  def initialize(gist_client=nil, *args, **kwargs)
    super(*args, **kwargs)
    @gist_client = gist_client
  end

  def update_gist_url
    response = gist_client.post_file(name, source)
    self.gist_url = response['html_url']
  end

  def gist_client
    @gist_client or SnippetsHelper::GistHttpClient.new
  end
end
