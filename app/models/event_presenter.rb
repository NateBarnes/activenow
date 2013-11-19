class EventPresenter < Delegator
  def self.find_local_event client
    location = client.locations.list.items.first
    results = ACTV.popular_events :lat_lon => "#{location.latitude},#{location.longitude}", :radius => 5, :start_date => "2013-11-19..2014-11-24", :exclude_children => "true", :onlineRegistration => "true"
    new results.results.first
  end

  def initialize event
    super
    @event = event
  end

  def to_h
    {
      "text" => "Check out the #{assetName}! #{seo_url}",
      "html" => "<article>  <figure>    <img src=\"http://i.imgur.com/eoYDK9d.jpg\">  </figure>  <section> #{assetName} <br><br><br>Saturday, Oct 5<br></section></article>",
      "speakableType" => "Active Event",
      "speakableText" => "#{description_by_type("summary")||description_by_type("standard")}",
      "location" => {
        "kind" => "mirror#location",
        "latitude" => event.place.latitude,
        "longitude" => event.place.longitude
      },
      "menuItems" => [
        {
          "action" => "READ_ALOUD"
        },
        {
          "action" => "SHARE"
        },
        {
          "action" => "CUSTOM",
          "values" => [
            {
              "displayName" => "Sign Me Up!",
              "iconUrl" => "http://prod.static.titans.clubs.nfl.com/assets/images/tickets/tickets-icon.png"
            }
          ]
        },
        {
          "action" => "NAVIGATE"
        },
        {
          "action" => "TOGGLE_PINNED"
        },
        {
          "action" => "DELETE"
        }
      ],
      "notification" => {
        "level" => "DEFAULT"
      }
    }
  end

  def __getobj__
    @event
  end

  def __setobj__ obj
    @event = obj
  end
end
