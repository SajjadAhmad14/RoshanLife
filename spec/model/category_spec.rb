require "rails_helper"

RSpec.describe Category, :type => :model do
  it 'Category is valid if a name attribute is present' do
    @category = Category.new(name: 'abc')
    expect(@category).to be_valid
  end

  it 'Category is not valid without name attribute' do
    @category = Category.new(name: nil)
    expect(@category).to_not be_valid
  end

  it 'Category has many articles' do
    expect(Category.reflect_on_association(:articles).macro).to eq(:has_many)
  end
  
end