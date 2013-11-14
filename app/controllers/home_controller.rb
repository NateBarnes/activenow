class HomeController < ApplicationController
  layout false

  def index
  end

  def insert_event
    client.timeline.insert :text => "HELLO WORLD"
    render :file => "home/del_mar.json", :content_type => "application/json"
  end
end
