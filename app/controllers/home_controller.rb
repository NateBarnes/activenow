class HomeController < ApplicationController
  layout false

  def index
    render :file => "home/del_mar.json", :content_type => "application/json"
  end
end
