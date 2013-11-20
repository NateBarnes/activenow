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
     :subject => "Hello from the Mandrill API",
     :from_name => "Your name",
     :text => "Hi message, how are you?",
     :to => [
       {
         :email => User.last.email,
         :name => User.last.name
       }
     ],
     :html => "<html><h1>Hi <strong>message</strong>, how are you?</h1></html>",
     :from_email => "sender@yourdomain.com"
    }

    sending = m.messages.send message
  end
end
