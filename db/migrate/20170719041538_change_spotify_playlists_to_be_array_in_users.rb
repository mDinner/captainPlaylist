class ChangeSpotifyPlaylistsToBeArrayInUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :spotify_playlists, :string, array: true, default: [].to_yaml
  end
end
