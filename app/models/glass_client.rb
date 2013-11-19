class GlassClient
  def initialize token
    @client = Mirror::Api::Client.new token
  end

  def insert hsh, user=User.last
    client.timeline.insert hsh
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
