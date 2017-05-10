class CreatePlaylists < ActiveRecord::Migration[5.0]
  def change
    create_table :playlists do |t|
      t.string :title
      t.string :origin
      t.string :origin_user
      t.string :url

      t.timestamps
    end
  end
end
