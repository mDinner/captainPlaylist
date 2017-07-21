class AddOriginIdToPlaylists < ActiveRecord::Migration[5.0]
  def change
    add_column :playlists, :origin_id, :string
  end
end
