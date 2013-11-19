class HomeController < ApplicationController
  def index
  end

  def debug
  end

  def insert_event
    client.timeline.insert EventPresenter.new(ACTV.event("ff3a74c9-db0c-4485-adfa-e7b9fd9d2b52")).to_h
    render :text => true
  end

  def find_local_event
    client.timeline.insert EventPresenter.find_local_event(client).to_h
    render :text => true
  end

  def get_location
    render :text => client.locations.list
  end
end
