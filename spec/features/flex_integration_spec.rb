require "spec_helper"

describe FlexIntegration do
  let(:user) { FactoryGirl.create(:user_with_project) }
  let(:project) { user.projects.last }

  it "should set the flex id and project_id" do
    VCR.use_cassette 'flex_integration' do
      user.update_attribute(:flex_id,nil)
      project.update_attribute(:flex_project_id,nil)
      FlexIntegration.new(project.id)
      user.reload
      user.flex_id.should be > 1
      project.reload
      # This matches 11.111.111
      project.flex_project_id.should match /\d{0,2}\.\d{0,3}\.\d{0,3}/   
    end
  end
end
