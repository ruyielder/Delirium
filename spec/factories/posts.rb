FactoryGirl.define do
  factory :post do
    title { Faker::Name.title }
    content Faker::Lorem.paragraph

    factory :draft_post do
      draft true
      published_at nil
    end

    factory :published_post do
      draft false
      published_at Date.new(2014, 12, 5)
    end
  end
end