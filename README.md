# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



        <td><%= custom_playlist[:origin] %></td>
        <td><%= custom_playlist[:origin_user] %></td>
        <td><%= custom_playlist[:url] %></td>
        <td><%= link_to 'Show', custom_playlist %></td>
        <td><%= link_to 'Edit', edit_custom_playlist_path(custom_playlist) %></td>
        <td><%= link_to 'Destroy', custom_playlist, method: :delete, data: { confirm: 'Are you sure?' } %></td>


<%= link_to 'New Playlist', new_custom_playlist_path %>


Next steps: showing some of our playlists on the main screen

first - create an object to store some static, custom playlists to display
on the home page (ones we picked out). search our playlists by the name of the playlist if they're specific enough. otherwise either search the results or
try getting the playlist thru the spotify user. add those playlists to the object so we can grab them custom style in the main page view file.

next - we're gonna need to get a lot of cool playlists in the database. WE should write a script that gets a bunch and then adds them all so we don't have to do it manually

next also - what should be on the home page when they're signed in? what about what's on their profile page?

also we're gonna need a css library and a color scheme. that's u.

eventually we'll use active admin to make an admin portal