class HomeController < ApplicationController
  def index
  end

  def debug
  end

  def insert_event
    client.timeline.insert Event.example_event
    render :text => true
  end
end
