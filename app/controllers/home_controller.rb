class HomeController < ApplicationController
  def index
  end

  def debug
  end

  def insert_event
    client.timeline.insert EventPresenter.new(ACTV.event("068487f1-807f-4fcd-8561-53740f80f6b3")).to_h
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
