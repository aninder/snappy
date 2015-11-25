require 'rails_helper'

RSpec.feature "Sites", type: :feature do
  scenario "adds a new user" do
    user = FactoryGirl.build(:user)
    visit new_user_path
    expect {
      fill_in 'user[name]', with:user.name
      fill_in 'user[password]', with:user.password
      fill_in 'user[password_confirmation]', with:user.password
      click_button "Register"
    }.to change(User, :count).by 1
    expect(current_path).to eq root_path
    within 'span' do
      expect(page).to have_content("Welcome to Snappy")
    end
    within 'h2' do
      expect(page).to have_content("Ask a Question")
    end
# save_and_open_page
  end
end
