require 'spec_helper'

describe PostsHelper do
  include PostsHelper

  describe 'ImagePostRenderer' do
    context 'without image markups' do
      it 'returns same content' do
        post = create(:published_post, content: 'Przykładowy tekst')
        create(:image_post, post: post)
        renderer = PostsHelper::ImagePostRenderer.new(post)
        expect(renderer.render(post.content)).to eq 'Przykładowy tekst'
      end
    end

    context 'with image markups' do
      it 'replaces markup with html' do
        post = create(:published_post, content: 'Hej to moje logo: IMG:logo')
        create(:image_post, post: post, basename: 'logo')
        renderer = PostsHelper::ImagePostRenderer.new(post)
        content = renderer.render(post.content)
        expect(content).to eq "Hej to moje logo: <div class='center-block'>" +
          "<img src='/uploads/image_post/image/1/bird.png' class='img-responsive center-block'/></div>"
      end

      it 'replaces markups with html' do
        post = create(:published_post, content: 'Foo IMG:logo boo IMG:example')
        create(:image_post, post: post, basename: 'logo')
        create(:image_post, post: post, basename: 'example')
        renderer = PostsHelper::ImagePostRenderer.new(post)
        content = renderer.render(post.content)
        expect(content).to eq "Foo <div class='center-block'><img src='/uploads/image_post/image/1/bird.png'" +
          " class='img-responsive center-block'/></div> boo <div class='center-block'>" +
          "<img src='/uploads/image_post/image/2/bird.png' class='img-responsive center-block'/></div>"
      end

      it 'replaces markup with html written in polish' do
        post = create(:published_post, content: 'Hej to moje logo: IMG:żółć')
        create(:image_post, post: post, basename: 'żółć')
        renderer = PostsHelper::ImagePostRenderer.new(post)
        content = renderer.render(post.content)
        expect(content).to eq "Hej to moje logo: <div class='center-block'>" +
          "<img src='/uploads/image_post/image/1/bird.png' class='img-responsive center-block'/></div>"
      end
    end
  end
end
