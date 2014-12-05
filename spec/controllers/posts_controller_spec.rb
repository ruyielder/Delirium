require 'rails_helper'

describe PostsController do
  describe 'GET #index' do
    it 'has 200 status code' do
      post = create(:published_post)
      get :show, slug: post.slug
      expect(response.code).to eq('200')
    end
  end
end