class RemoveUsersPlaylists < ActiveRecord::Migration[5.0]
  def change
    drop_table :users_playlists
  end
end
