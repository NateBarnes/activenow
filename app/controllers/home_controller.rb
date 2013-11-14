class HomeController < ApplicationController
  layout false

  def index
  end

  def insert_event
    puts "controller"
    client.timeline.insert :text => "HELLO WORLD"
    puts "inserted"
    render :file => "home/del_mar.json", :content_type => "application/json"
  end
end
