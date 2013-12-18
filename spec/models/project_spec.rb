require "spec_helper"

describe Project do
  let(:project) { FactoryGirl.create(:project) } 
  
  it "should return formatted date" do
    project.start_date.should eq(project.due_date.strftime("%m/%d/%Y"))
  end
end
