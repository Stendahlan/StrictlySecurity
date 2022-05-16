class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def login

    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      #puts "YOU SIGNED IN SUCCESS WOOHOO"

      redirect_to '/welcome'
    else
      redirect_to '/login'
    end
    #lookup user by username in db
    #see if passwprds match
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      #set new auth token first - DONE
      @user.set_auth_token
      #return a cookie to user's browser - DONE?
      #value of cookie is equal to users authorization token - DONE?
      cookies[:authorization_token] = @user.authorization_token

      redirect_to '/welcome'
    else
      redirect_to '/login'
    end
  end

  def page_requires_login
  end
end
