require "test_helper"

describe SessionsController do
  # it "must be a real test" do
  #   flunk "Need real tests"
  # end

  describe "auth_callback" do
    it "logs in an existing user and redirects them back to the homepage" do
      start_count = User.count

      user = users(:dee)

      # tell omniauth to use this user's hash when use github callback
      # OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(mock_auth_hash(user))

      # path also works if feed in github as string
      # get auth_callback_path(:github)

      log_in(user, :github)

      must_respond_with :redirect
      must_redirect_to root_path
      User.count.must_equal start_count
      session[:user_id].must_equal user.id
    end

    it "creates an account for a new user and redirects to the homepage" do
      start_count = User.count
      user = User.new provider: "github", name: "ada", email: "ada@adadev.org", uid: 30
      # user.save if you save here, then doing the same test as above

      # OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(mock_auth_hash(user))

      #proc { get auth_callback_path(:github) }.must_change 'User.count', +1

      # get auth_callback_path(:github)
      log_in(user, :github)
      User.count.must_equal start_count + 1

      must_respond_with :redirect
      must_redirect_to root_path
      session[:user_id].must_equal User.find_by(uid: user.uid, provider: user.provider).id
    end

    it "redirects to the login route if given invalid user data" do
      start_count = User.count
      bad_user = User.new name: "bad user", email: "baduser@adadev.org", uid: 35

      log_in(bad_user, :github)
      User.count.must_equal start_count
      must_respond_with :redirect
      must_redirect_to root_path
    end
  end
end
