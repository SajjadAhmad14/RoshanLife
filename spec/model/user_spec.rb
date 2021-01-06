require 'rails_helper'

RSpec.describe User, type: :model do
  it 'User is valid if a name attribute is present' do
    user = User.new(name: 'abc', password: '12345')
    expect(user).to be_valid
  end

  it 'User is not valid without name attribute' do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end

  it 'User has many articles' do
    expect(User.reflect_on_association(:articles).macro).to eq(:has_many)
  end

  it 'User has many votes' do
    expect(User.reflect_on_association(:articles).macro).to eq(:has_many)
  end
end
