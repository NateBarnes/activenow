class HomeController < ApplicationController
  def index
  end

  def debug
  end

  def insert_event
    client.timeline.insert :text => "HELLO WORLD"
    render :text => true
  end
end
