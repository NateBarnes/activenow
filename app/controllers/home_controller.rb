class HomeController < ApplicationController
  def index
    render :json =>  %( {"text": "Hello world", "menuItems": [ { "action": "DELETE" }, { "action": "TOGGLE_PINNED" } ] })
  end
end
