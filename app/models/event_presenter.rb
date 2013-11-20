class EventPresenter < Delegator
  include TemplateHelper

  def self.find_local_event client
    location = client.location
    find_event location.latitude, location.longitude
  end

  def self.find_event lat, lon
    results = ACTV.search '', :lat_lon => "#{lat},#{lon}", :radius => 5, :start_date => "#{search_formatter(DateTime.now)}..#{search_formatter(2.weeks.from_now)}", :exclude_children => "true", :onlineRegistration => "true", :sort => "ranking_desc"
    new results.results.first
  end

  def self.search_formatter dt
    dt.strftime "%Y-%m-%d"
  end

  def initialize event, user=User.last
    super event
    @event = event
    @user = user
  end

  def formatted_date str=self.start_date
    dt = DateTime.parse str
    dt.strftime "%A, %b %-d"
  end

  def to_h
    {
      "asset_id" => assetGuid,
      "text" => "Check out the #{assetName}! #{seo_url}",
      "html" => "<article>  <figure>    <img src=\"http://i.imgur.com/eoYDK9d.jpg\">  </figure>  <section> #{assetName} <br><br>#{formatted_date}<br></section></article>",
      "speakableType" => "Active Event",
      "speakableText" => "#{template.strip_tags(description_by_type("summary")||description_by_type("standard"))}",
      "location" => {
        "kind" => "mirror#location",
        "latitude" => place.latitude,
        "longitude" => place.longitude
      },
      "menuItems" => [
        {
          "action" => "READ_ALOUD"
        },
        {
          "action" => "SHARE"
        },
        {
          "id" => "#{assetGuid}||#{@user.id}",
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
