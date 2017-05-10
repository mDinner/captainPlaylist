json.extract! playlist, :id, :title, :origin, :origin_user, :url, :created_at, :updated_at
json.url playlist_url(playlist, format: :json)
