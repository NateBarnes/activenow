class GlassClient
  def initialize token
    @client = Mirror::Api::Client.new token
  end

  def insert hsh, user=User.last
    if Notification.where(:user_id => user.id).where(:asset_id => hsh["asset_id"]).empty?
      Notification.create :user_id => user.id, :asset_id => hsh["asset_id"]
      client.timeline.insert hsh
    end
  end

  def locations
    client.locations.list
  end

  def location
    locations.items.first
  end

  private
  def client
    @client
  end
end
