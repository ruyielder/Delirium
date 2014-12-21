require 'rails_helper'

describe Tag do
  it 'has a valid factory' do
    expect(build(:tag)).to be_valid
  end

  it 'is invalid without name' do
    expect(build(:tag, name: '')).not_to be_valid
  end

  it 'has a valid slug' do
    expect(create(:tag, name: 'Żółć jest żółta').slug).to eq 'zolc-jest-zolta'
  end

  it 'has a unique name' do
    create(:tag, name: 'Hej')
    expect(build(:tag, name: 'Hej')).not_to be_valid
  end

  it 'has moved errors from slug to name' do
    create(:tag, name: 'Hej')
    tag = build(:tag, name: 'Hej')
    tag.save
    expect(tag).not_to be_valid
    expect(tag.errors.messages).to eq(name: ['has already been taken'])
  end
end
