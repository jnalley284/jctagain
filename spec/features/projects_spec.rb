require 'spec_helper'

feature 'Create a new Project' do
  before { sign_in }

  context 'when the user is signed in' do
    before do
      visit new_project_path
    end

    pending 'when I am signed in', js: true do
      Capybara.default_wait_time = 20
      fill_in 'What Service do you need?', with: 'I have a leaky tap'
      fill_in 'When do you need it?', with: '10/02/2013'
      fill_in 'First Name', with: 'Alex'
      fill_in 'Last Name', with: 'Handley'
      fill_in 'Primary Phone Number', with: '07711540312'

      fill_in_address_section
      fill_in_payment_section

      save_screenshot "#{Rails.root}/ss.png"

      click_link 'Proceed to Checkout'
      click_button 'Place Order'

      expect(page).to have_content 'Project was successfully created.'
    end
  end


  def fill_in_address_section
    within '.billing-address-container' do
      fill_in 'Contact Name', with: 'John'
      fill_in 'Contact Phone Number', with: '2343534565'
      fill_in 'Address Line 1', with: '121 Nowhere Street'
      fill_in 'City', with: 'London'
      fill_in 'State', with: 'London'
      fill_in 'Zip Code', with: 'E3 121'
    end
  end

  def fill_in_payment_section
    within '.payment-info' do
      fill_in 'Name on Card', with: 'Alex Handley'
      fill_in 'Card Number', with: '4242424242424242'
      fill_in 'MM', with: '09'
      fill_in 'YY', with: Date.today.year + 1
      fill_in 'CVC', with: '121'
    end
  end
end


