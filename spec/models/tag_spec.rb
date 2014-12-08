require 'rails_helper'

describe Tag do
  it 'has a valid factory' do
    expect(create(:tag).valid?).to be true
  end
end
