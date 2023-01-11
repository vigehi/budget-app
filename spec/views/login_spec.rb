require 'rails_helper'

RSpec.describe 'Log in session', type: :feature do
  before :each do
    User.create(password: '123456', email: 'rich@gmail.com')
    visit new_user_session_path
  end

  describe 'Log in users' do
    it 'I can see the username and password inputs and the Submit button.' do
      expect(page).to have_content('SIGN UP')
      expect(page).to have_content('FORGOT YOUR PASSWORD?')
    end
  end
end
