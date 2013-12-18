require 'spec_helper'

describe ProjectsController do
  context 'when the user is not authenticated' do
    it 'will redirect to the login page' do
      get :index
      expect(response).to redirect_to new_user_session_path
    end
  end
end