class AddOriginUserIdToPlaylists < ActiveRecord::Migration[5.0]
  def change
  	add_column :playlists, :origin_user_id, :string
  end
end
