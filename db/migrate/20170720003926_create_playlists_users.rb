class CreatePlaylistsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :playlists_users do |t|
      t.belongs_to :playlist, index: true
      t.belongs_to :user, index: true
    end
  end
end
