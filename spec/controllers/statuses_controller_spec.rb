require 'spec_helper'

describe StatusesController do
  let!(:user) { FactoryGirl.create(:user_with_project) }
  let!(:project) { user.projects.last }
  
  it "should accept a status message post in JSON" do
    post 'create', { pcode: project.flex_project_id, status: 'Confirming Scheduling', message: 'Spoke with dave' }

    expect(response.status).to eq(200)
  end

  it "should thrown an error if the fields aren't passed correctly" do
    post 'create', { message: 'this should fail'}
    expect(response.status).to eq(422)
  end

  it "should throw an error if it cannot find the project" do 
    post 'create', { pcode: 'not a project', 
                     status: 'Confirming Scheduling', 
                     message: 'Spoke with dave'
                   }
    expect(response.status).to eq(422)
  end
end
