FactoryGirl.define do
  factory :snippet do
    name {Faker::Name.name}
    source Faker::Lorem.paragraph
    gist_url {Faker::Internet.url('gist.github.com')}
  end
end