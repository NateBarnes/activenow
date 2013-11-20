class HomeController < ApplicationController
  def index
  end

  def debug
  end

  def insert_event
    client.insert EventPresenter.new(ACTV.event("068487f1-807f-4fcd-8561-53740f80f6b3")).to_h
    render :text => true
  end

  def find_local_event
    if params[:lat] and params[:lon]
      event = EventPresenter.find_event params[:lat], params[:lon]
    else
      event = EventPresenter.find_local_event client
    end

    client.insert event.to_h
    render :text => true
  end

  def get_location
    render :text => client.locations
  end

  def empty_notifications
    Notification.destroy_all
    render :text => true
  end

  def day_of_notification

  end

  def callback
    m = Mandrill::API.new
    message = {
     :subject => "Complete Your Registration for the Event",
     :from_name => "ActiveNow",
     :text => "Hi #{User.last.name}, you asked us to help you register for the Event. Just follow this link and we'll help you finish getting setup!",
     :to => [
       {
         :email => User.last.email,
         :name => User.last.name
       }
     ],
     :html => "Hi #{User.last.name}, you asked us to help you register for the Event. Just click <a href='http://www.active.com'>here</a> and we'll help you finish getting setup!",
     :from_email => "activenow@active.com"
    }

    sending = m.messages.send message
    render :text => true
  end
end
