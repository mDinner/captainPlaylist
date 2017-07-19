class AddPlaylistsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :playlists, :array, default: [].to_yaml
  end
end