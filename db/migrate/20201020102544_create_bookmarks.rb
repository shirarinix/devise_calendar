class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.integer :follower_id
      t.integer :following_id

      t.timestamps null: false
    end
    add_index :bookmarks, :follower_id
    add_index :bookmarks, :following_id
    add_index :bookmarks, [:follower_id, :following_id], unique: true
  end
end
