require "rails_helper"

RSpec.describe Article, :type => :model do
  let(:user) { User.create(name:'user1', password:'12345') }
  let(:category) { Category.create(name:'soprts') }
  it 'Create new article' do
    @article = Article.new(title: 'a', body: 'b', category_id: category.id, user_id: user.id)
    expect(@article).to be_an Article
  end

  it 'Article is not valid without title' do
    @article = Article.new(body: 'b', category_id: category.id, user_id: user.id)
    expect(@article).to_not be_valid
  end

  it 'Article is not valid without body' do
    @article = Article.new(title: 'a', category_id: category.id, user_id: user.id)
    expect(@article).to_not be_valid
  end
  
  it 'Article is not valid without user' do
    @article = Article.new(title: 'a', body: 'b', category_id: category.id)
    expect(@article).to_not be_valid
  end

  it 'Article is not valid without category' do
    @article = Article.new(title: 'a', body: 'b', user_id: user.id)
    expect(@article).to_not be_valid
  end

  it 'Article belongs to user' do
    expect(Article.reflect_on_association(:user).macro).to eq(:belongs_to)
  end
  
  it 'Article belongs to a category' do
    expect(Article.reflect_on_association(:category).macro).to eq(:belongs_to)
  end

  it 'Article has many votes' do
    expect(Article.reflect_on_association(:votes).macro).to eq(:has_many)
  end

end