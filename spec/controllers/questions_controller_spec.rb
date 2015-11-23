require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  it "does not save without user reference" do
    expect(FactoryGirl.build(:question)).not_to be_valid
  end

  # describe "GET #index" do
  #   it "returns http success" do
  #     get :index
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
