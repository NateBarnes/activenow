class HomeController < ApplicationController
  def index
  end

  def debug
  end

  def insert_event
    client.timeline.insert File.open("app/views/home/del_mar.json", "rb").read
    render :text => true
  end
end
