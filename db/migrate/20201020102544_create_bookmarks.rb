class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.integer :following_id, default: 0
      t.integer :follower_id,  default: 0
      t.integer :follow_id,    default: 0
      t.integer :followed_id,  default: 0

      t.timestamps null: false
    end
    add_index :bookmarks, :following_id
    add_index :bookmarks, :follower_id
    add_index :bookmarks, :follow_id
    add_index :bookmarks, :followed_id
    add_index :bookmarks, [:following_id, :follower_id, :follow_id, :followed_id], unique: true, name: 'bookmarks_index'
  end
end
