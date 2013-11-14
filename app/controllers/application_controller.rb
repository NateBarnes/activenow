class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def token
    @mirror_token ||= Mirror::Api::Oauth.new ENV["GOOGLE_KEY"], ENV["GOOGLE_SECRET"], session[:token]
  end

  def client
    @mirror_client ||= Mirror::Api::Client.new token
  end
end
