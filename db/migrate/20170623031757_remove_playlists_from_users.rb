class RemovePlaylistsFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :playlists, :array, default: [].to_yaml
  end
end
