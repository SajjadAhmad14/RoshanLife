require 'rails_helper'

RSpec.describe Vote, type: :model do
  it 'Vote belongs to an article' do
    expect(Vote.reflect_on_association(:article).macro).to eq(:belongs_to)
  end

  it 'Vote belongs to a user' do
    expect(Vote.reflect_on_association(:user).macro).to eq(:belongs_to)
  end
end
