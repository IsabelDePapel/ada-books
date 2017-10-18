class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :find_user

  private

  # on any page, if user is logged in, we'll have a variable that has their info
  def find_user
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    end
  end
end
