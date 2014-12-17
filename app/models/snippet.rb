class Snippet < ActiveRecord::Base
  attr_writer :gist_client

  belongs_to :post

  validates :name, :post, :source, presence: true
  validates :gist_url, url: true, allow_blank: true

  before_save :update_gist_url

  def initialize(*args, **kwargs)
    super(*args, **kwargs)
    @gist_client = nil
  end

  def update_gist_url
    response = gist_client.post_file(name, source)
    self.gist_url = response['html_url']
  end

  def gist_client
    if @gist_client.nil?
      @gist_client = SnippetsHelper::GistHttpClient.new
    end

    @gist_client
  end
end
