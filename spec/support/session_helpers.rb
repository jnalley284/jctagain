include Warden::Test::Helpers

module SessionHelpers
  def sign_in(user = FactoryGirl.create(:user))
    login_as user, scope: :user
    user
  end
end