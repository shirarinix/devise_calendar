class CreateUsersArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :users_artists do |t|
      t.integer :user_id,       nill: false
      t.integer :artist_id,     nill: false

      t.timestamps
    end
  end
end
