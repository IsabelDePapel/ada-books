class SessionsController < ApplicationController

  def login_form

  end

  def login
    author = Author.find_by(name: params[:username])

    if author
      flash[:success] = "Succesfully logged in as #{author.name}"
      session[:author_id] = author.id
      redirect_to root_path
    else
      flash[:error] = "No author found by the name #{params[:username]}"
      redirect_to root_path
    end
  end
end
