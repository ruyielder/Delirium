FactoryGirl.define do
  factory :image_post do
    basename {Faker::Lorem.word}
    image Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'factories', 'bird.png'))
  end
end