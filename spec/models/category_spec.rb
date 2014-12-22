require 'rails_helper'

RSpec.describe Category, :type => :model do

  it 'has a valid factory' do
    expect(build(:category)).to be_valid
  end

  it 'has a valid slug' do
    expect(create(:category, name: 'Żółć jest żółta').slug).to eq 'zolc-jest-zolta'
  end

  it 'has moved errors from slug to name' do
    create(:category, name: 'Hej')
    category = build(:category, name: 'Hej')
    category.save
    expect(category).not_to be_valid
    expect(category.errors.messages).to eq(name: ['has already been taken'])
  end

end
