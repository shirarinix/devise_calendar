class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.integer :user_id
      t.integer :artist_id

      t.timestamps
      t.index [:user_id, :artist_id], unique: true #一意性制限
    end
  end
end
