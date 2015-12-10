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

    within '.container > h2' do
      expect(page).to have_content("Ask a Question")
    end
# save_and_open_page
  end

  scenario "show details of a particular question" do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:random_question, user:user)
    visit user_question_path(id:question.id, user_id:user.id)

    within '.container > h2' do
      expect(page).to have_content("#{user.name} asks:")
    end
    expect(page).to have_content("#{question.ques}")
    expect(page).to have_content("Please login to ask or answer questions")
  end
end
