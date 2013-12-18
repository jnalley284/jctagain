require "spec_helper"
describe 'Integration with Flex' do

  let(:user) { FactoryGirl.create(:user_with_project) }

  context 'Registration' do

    pending "creates a user and returns an id" do
      user.update_attribute(:flex_id,nil)
      VCR.use_cassette 'registration' do
        service = RegistrationService.new
        service.create(user)
        user.reload
        user.flex_id.should be > 1
      end
    end

    xit "should update the account details" do
      VCR.use_cassette 'account_details' do
        service =  AccountService.new
        result = service.update_account(user.projects.last)
        result.should be_true
      end
    end
    
  end

  context 'Project' do
    let(:service) { ProjectService.new }
    let(:project) { user.projects.last }

    it "should create a project and return a project id and account id" do
      VCR.use_cassette 'new project' do
        user.update_attribute(:flex_id,nil)
        project.update_attribute(:flex_project_id,nil)

        user.flex_id.should be_nil
        project.flex_project_id.should be_nil
        
        params = service.message_params(project)
        params[:account_ID].should eq(0)
        
        service.create(project)

        user.reload
        project.reload
        user.flex_id.should be > 1
        project.flex_project_id.should match /\d{0,2}\.\d{0,3}\.\d{0,3}/   
      end
    end

    xit "should create a project" do
      VCR.use_cassette 'create_project' do
        user.flex_id = nil
        user.save
        service.create(project)
        project.flex_project_id.should match /\d{0,2}\.\d{0,3}\.\d{0,3}/   
        project.user.flex_id.should be > 1
      end
    end

    xit "should return the project details as a hash" do
      VCR.use_cassette 'project_details' do
        results = service.project_details(project)
        results[:status].should eq("Active") 
      end
    end
  end
end
