FactoryGirl.define do
  factory :comment_post do
    name {Faker::Name.name}
    content Faker::Lorem.paragraph
    blocked false

    factory :comment_post_with_email do
      email {Faker::Internet.email}
    end

    factory :comment_post_with_url do
      email {Faker::Internet.url}
    end

    factory :full_comment_post do
      email {Faker::Internet.email}
      email {Faker::Internet.url}
    end
  end
end