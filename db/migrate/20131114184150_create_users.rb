class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :glass_refresh_token

      t.timestamps
    end
  end
end
