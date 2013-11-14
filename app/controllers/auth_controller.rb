class AuthController < ApplicationController
  def callback
    redirect_to '/'
  end
end
