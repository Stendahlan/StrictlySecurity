class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def login
    #lookup user by username in db
    #see if passwprds match
  end

  def create

    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      #set new auth token first
      #return a cookie to user's browser
      #value of cookie is equal to users authorization token
      redirect_to '/welcome'
    else
      redirect_to '/login'
    end
  end

  def page_requires_login
  end
end
