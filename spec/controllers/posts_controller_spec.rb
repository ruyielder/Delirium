require 'rails_helper'

describe PostsController do
  describe 'GET #index' do
    it 'has a 200 status code when id is id' do
      post = create(:published_post)
      get :show, id: post.id
      expect(response.code).to eq('200')
    end

    it 'has 200 status code when id is slug' do
      post = create(:published_post)
      get :show, id: post.slug
      expect(response.code).to eq('200')
    end
  end
end