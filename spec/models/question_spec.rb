require 'rails_helper'

RSpec.describe Question, type: :model do
  it "does not save without user reference" do
    expect(FactoryGirl.build(:question)).not_to be_valid
  end
end
