require 'spec_helper'

feature 'Visitor signs up' do
  pending 'with valid details', js: true do
    visit new_user_registration_path
    within('.nav-wrapper') do
      click_link 'Register'
    end
    within('.reveal-modal') do
      fill_in 'user_email', with: 'test123@example.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button 'Register'
    end
    current_path.should eq new_project_path
  end

  context 'with invalid details' do
    pending 'name' do
      visit new_user_registration_path
      fill_in 'user_email', with: 'test@example.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button 'Create Account'
      page.should have_content "First name can't be blank"
    end

  end

end
