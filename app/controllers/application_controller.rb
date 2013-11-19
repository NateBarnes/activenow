class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def refresh_token
    session[:refresh_token] ||= User.last.glass_refresh_token
  end

  def token
    @mirror_token ||= session[:token] || Mirror::Api::OAuth.new(ENV["GOOGLE_KEY"], ENV["GOOGLE_SECRET"], refresh_token).get_access_token
  end

  def client
    @mirror_client ||= Mirror::Api::Client.new token
  end
end
