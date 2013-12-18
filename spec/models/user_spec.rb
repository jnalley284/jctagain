require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }
  it "should return the flex account name" do
    user.flex_account_name.should eq("jct-#{user.id}")
  end

end
