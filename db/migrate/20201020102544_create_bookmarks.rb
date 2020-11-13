class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.integer :follower_id
      t.integer :following_id
      t.integer :artist_follow_id
      t.integer :artist_followed_id

      t.timestamps null: false
    end
    add_index :bookmarks, :follower_id
    add_index :bookmarks, :following_id
    add_index :bookmarks, :artist_follow_id
    add_index :bookmarks, :artist_followed_id
    add_index :bookmarks, [:follower_id, :following_id, :artist_follow_id, :artist_followed_id], unique: true, name: 'bookmarks_index'
  end
end
