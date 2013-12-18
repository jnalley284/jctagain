require 'spec_helper'

describe Address do
  let(:address) { FactoryGirl.create(:address) }
  it "should returns the full address" do
    address.full_address.should eq "#{address.line_1}, #{address.line_2}"

  end

end
