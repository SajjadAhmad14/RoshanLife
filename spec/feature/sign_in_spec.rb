require 'rails_helper'
RSpec.describe 'Login a user', type: :feature do
  before(:each) do
    @user = User.create(name: 'abc', password: '12345')
  end
  scenario 'valid inputs' do
    visit login_path
    fill_in 'session[name]', with: 'abc'
    fill_in 'session[password]', with: '12345'
    click_on 'Log In'
    redirect_to root_path
  end
end