class HomeController < ApplicationController
  def index
  end

  def debug
  end

  def insert_event
    client.timeline.insert EventPresenter.new.to_h
    render :text => true
  end

  def find_local_event
    render :text => EventPresenter.find_local_event
  end

  def get_location
    render :text => client.locations.list
  end
end
