class Event
  def self.example_event
    {
      "html" => "<article><figure><img src='http://i.imgur.com/eoYDK9d.jpg'></figure><section>2013 Del Mar Mud Run<br><br>Del Mar, CA</section></article>",
      "speakableType" => "Active Event",
      "speakableText" => "The iconic Del Mar Mud Run is back at the historic Del Mar Fairgrounds for its 4th consecutive year. One of the most fun mud runs in the world, it has attracted celebrities, international media and participants from across the country. A 5K race with 15+ obstacles and an after party unlike any other, sign up now because this race will sell out! Event schedule and times 1. Morning => your run will start at 8am, 9am, 10am or 11am. 2. Afternoon => your run will start at noon, 1pm, 2pm or 3pm. We will send out an email to all participants approximately 2 weeks prior to race day letting you know what time your run will start. Times are first come, first serve so the sooner you register the earlier you run! If you sign up as a team you are guaranteed to be put in the same start time.",
      "location" => {
        "kind" => "mirror#location",
        "latitude" => 32.972428,
        "longitude" => -117.258067
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
end
