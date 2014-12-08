require 'rails_helper'

describe Tag do
  it 'has a valid factory' do
    expect(create(:tag).valid?).to be true
  end

  it 'is invalid without name' do
    expect {create(:tag, name: '')}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'has a valid slug' do
    expect(create(:tag, name: 'Żółć jest żółta').slug).to eq 'zolc-jest-zolta'
  end

  it 'has a unique name' do
    create(:tag, name: 'Hej')
    expect {create(:tag, name: 'Hej')}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'has moved errors from slug to name' do
    create(:tag, name: 'Hej')
    tag = build(:tag, name: 'Hej')
    tag.save
    expect(tag.valid?).to be false
    expect(tag.errors.messages).to eq(name: ['has already been taken'])
  end

end
