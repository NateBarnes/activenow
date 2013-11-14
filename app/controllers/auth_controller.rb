class AuthController < ApplicationController
  def callback
    refresh_token = request.env.fetch("omniauth.auth", {}).fetch("credentials", {}).fetch("refresh_token", nil)
    token = request.env.fetch("omniauth.auth", {}).fetch("credentials", {}).fetch("token", nil)
    session[:token] = token
    
    user = User.find_by_refresh_token refresh_token

    if user
    else
      User.create :name => request.env.fetch("omniauth.auth", {}).fetch("info", {}).fetch("name"), :refresh_token => refresh_token
    end

    redirect_to '/'
  end
end
