require 'rails_helper'

RSpec.feature "_question template cache", type: :feature do
  scenario "question is displayed on the page" do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question, user:user)
    visit new_session_path
    signIn user
    # expect {
    #   fill_in 'user[name]', with:user.name
    #   fill_in 'user[password]', with:user.password
    #   fill_in 'user[password_confirmation]', with:user.password
    #   click_button "Register"
    # }.to change(User, :count).by 1
    # expect(current_path).to eq root_path
    # within 'span' do
    #   expect(page).to have_content("Welcome to Snappy")
    # end
    # within 'h2' do
    #   expect(page).to have_content("Ask a Question")
    # end
# save_and_open_page
  end
end

def signIn user
    fill_in 'user[name]', with:user.name
    fill_in 'user[password]', with:user.password
end

