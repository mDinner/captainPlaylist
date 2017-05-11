require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "7933d15b129245a6936beb0980b05a98", "
c352e97d411e4305ba4470bc4c8a5cda", scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
end