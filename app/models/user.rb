class User < ActiveRecord::Base
  has_many :notifications

  def self.get_stored_credentials user_id

  end
end
