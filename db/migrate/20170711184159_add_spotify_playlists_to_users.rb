class AddSpotifyPlaylistsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :spotify_playlists, :array, default: [].to_yaml
  end
end
