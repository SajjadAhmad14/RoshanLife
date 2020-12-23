require 'rails_helper'
RSpec.describe 'Login a user', type: :feature do
  before(:each) do
    @user = User.create(name: 'abc')
  end
  scenario 'valid inputs' do
    visit login_path
    fill_in 'session[name]', with: 'abc'
    click_on 'Log In'
    visit root_path  
  end
end