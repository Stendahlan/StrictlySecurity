class SessionsController < ApplicationController
  before_action :authenticate
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def login
  end

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      User.find_by(authorization_token: token)
    end
  end

  def create

      if @user.authenticate()
         sessions[:user_id] = @user.id
         redirect_to '/welcome'
      else
         redirect_to '/login'
      end
  end



  def page_requires_login
  end
end
