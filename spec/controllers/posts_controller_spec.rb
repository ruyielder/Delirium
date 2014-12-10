require 'rails_helper'

describe PostsController do
  describe 'GET #show' do
    it 'has 200 status code' do
      post = create(:published_post)
      get :show, slug: post.slug
      expect(response.code).to eq('200')
    end
  end

  describe 'GET #index' do
    it 'has ordered posts' do
      posts = [
        create(:published_post, published_at: Date.new(2013, 12, 5)),
        create(:published_post, published_at: Date.new(2014, 12, 5))
      ]

      get :index

      expect(assigns(:posts)).to eq([posts[1], posts[0]])
    end
  end

  describe 'GET #index_by_tag' do
    it 'has ordered posts' do
      posts = [
          create(:published_post, tag_line: 'ruby', published_at: Date.new(2013, 12, 5)),
          create(:published_post, tag_line: 'ruby', published_at: Date.new(2014, 12, 5))
      ]

      get :index_by_tag, tag: 'ruby'

      expect(assigns(:posts)).to eq([posts[1], posts[0]])
    end
  end


  describe 'GET #archives' do
    it 'has ordered posts' do
      posts = [
        create(:published_post, published_at: Date.new(2014, 12, 5)),
        create(:published_post, published_at: Date.new(2013, 12, 5)),
        create(:published_post, published_at: Date.new(2014, 12, 9)),
        create(:published_post, published_at: Date.new(2014, 12, 17))
      ]

      get :archives

      expect(assigns(:posts)).to eq([posts[3], posts[2], posts[0], posts[1]])
    end
  end
end