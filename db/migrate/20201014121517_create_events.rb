class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string      :title
      t.text        :content
      t.datetime    :start_time
      t.references  :user, foreign_key: true
      t.references  :artist, foreign_key: true

      t.timestamps  null: false
    end
  end
end
