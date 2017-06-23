class CreateUsersPlaylists < ActiveRecord::Migration[5.0]
  def change
    create_table :users_playlists do |t|
    	t.belongs_to :user, index: true
    	t.belongs_to :playlist, index: true
    end
  end
end
