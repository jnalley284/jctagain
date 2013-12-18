require "spec_helper"

describe AccountService do
  let(:user) { FactoryGirl.create(:user_with_project) }

  it "should create a user with a project" do
    user.projects.count.should eq(1)
  end
  
end
