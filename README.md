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



Wednesday tasks: 
1. on playlists: put Title, Artist, Album above the tables in black area, and
soon we should look into a SORTABLE table plugin.. i think bootstrap does
them so look up if they we and eventually all playlists need to be sortable.

2. create a registration prompt modal for people who click 'add to spotify/add to my playlist' that are not
logged in. you can create the modal for either one first, it should be a box
that pops up in the middle of the screen over everything else. This should
be set to CSS position: absolute; tip: create an absolutely positioned div,
set give it a static width and heigh, like 400px wide and tall, give it a
z-index of at least 10 so it goes on top of everything, and then center
it with this absolute position centering trick: 
https://www.smashingmagazine.com/2013/08/absolute-horizontal-vertical-centering-css/
..you might need to offset the modal by 200px (half of 400px) to center it, i'm
not sure

2A.for the 'add to my playlist' button, when they click it, the modal needs to prompt them to sign up with us AND connect their spotify. We should offer them
the ability to sign up with facebook for both or connect to either
individually.

The modal should have 2 sides, on the left a 'Signup with Spotify and register' side that let's you connect your spotify and makes you a user on our site as well, and a 'Create An Account' side that just let's you register a new user, it just needs an email and a password and maybe a username.

2B. When the modal's done, (or even before), we can make the functionality
of the 'add to spotify' and 'add to my playlists' work for users that are
logged in.. remember we set a conditional so we're setting elements with
a different class depending on whether the user is logged in. So obviously,
when a user that's logged in clicks "add to spotify", you should add that
playlist to their spotify account, and the same thing we 'add to my playlists'
although that might be a little different since you have to save the playlist.
You will have to generate a migration that adds 'playlist' to users which will
be of type 'int' or wtv rails uses for a regular number. All you need to
do when a logged-in user clicks 'add to my playlist', is add the id of
the playlist to the users 'playlist' database column.
ALSO - when someone clicks 'add to spotify', you should automatically add it to
their saved playlists as well. We need to have a checkbox next to the 'add to
my playlists' button that gets checked when it's been added, that way it will
autocheck when someone 'adds it to their spotify'.


3. We'll start working on the user's saved playlist page, and adding the ability
to search new playlists on our homepage. On the user's page they should have
the ability to view all their playlists on spotify/music networks and combine
them/convert them to playlists of other music networks and add playlists together.. Perhaps instead of putting this on the user's page we can just add filters to the home page. Just a thought, we can talk that part out.







