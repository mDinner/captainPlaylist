class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Now you can access user's private data, create playlists and much more

  # Access private data
  # @spotify_user.country = spotify_user.country
  # @spotify_user.email = spotify_user.email

  # Create playlist in user's Spotify account
  # playlist = spotify_user.create_playlist!('my-awesome-playlist')

  # Add tracks to a playlist in user's Spotify account
  # tracks = RSpotify::Track.search('Know')
  # playlist.add_tracks!(tracks)
  # playlist.tracks.first.name #=> "Somebody That I Used To Know"

  # Access and modify user's music library
  # spotify_user.save_tracks!(tracks)
  # spotify_user.saved_tracks.size #=> 20
  # spotify_user.remove_tracks!(tracks)

  # albums = RSpotify::Album.search('launeddas')
  # spotify_user.save_albums!(albums)
  # spotify_user.saved_albums.size #=> 10
  # spotify_user.remove_albums!(albums)

  # Use Spotify Follow features
  # spotify_user.follow(playlist)
  # spotify_user.follows?(artists)
  # spotify_user.unfollow(users)

  # Get user's top played artists and tracks
  # spotify_user.top_artists #=> (Artist array)
  # spotify_user.top_tracks(time_range: 'short_term') #=> (Track array)

  def spotify
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])

    @artists = {}
    @artists[:zeppelin] = RSpotify::Artist.search("led zeppelin").first

    @songs = {}
    @songs[:suitcase] = RSpotify::Track.search("man in a suitcase").first

    # doesn't work, i wanted all playlists by a user
    # @playlists = RSpotify::Playlist.search(@spotify_user.id)

    # Check doc for more
    Rails.logger.info "spotify_user: #{@spotify_user.inspect}"

    session[:spotify_user] = @spotify_user
    # @spotify_user = spotify_user
    render 'users/spotify_user'
  end

  # Post /users/add_playlist/:playlist_id
  def add_playlist
    playlist_id = params[:playlist_id]
    Rails.logger.info "playlist_id #{playlist_id}"


    playlist = Playlist.where(origin_id: playlist_id).first
    Rails.logger.info "PLAYLIST: #{playlist}"

    # playlist.destroy
    user = User.find(@current_user.id)
    Rails.logger.info "user.playlists.length: #{user.playlists.length}"

    Rails.logger.info "user.playlists: #{user.playlists}"

    # new playlist, create DB entry and add to user playlists
    playlist_new = false

    if (playlist == nil)
      playlist_new = true
      Rails.logger.info "playlist IS NEW!!!"
      playlist = Playlist.new(origin_id: playlist_id)
      user.playlists << playlist
      # user.save!
    end

    # user_playlists = user.playlists
    # if user doesn't have it
    user_playlist = user.playlists.where(origin_id: playlist_id).first
    Rails.logger.info "USER_PLAYLIST: #{user_playlist.inspect}"

    if playlist_new === false and user_playlist == nil
      Rails.logger.info "USER DOESN'T HAVE PLAYLIST"
      user.playlists << playlist
      # user.save!
    else
      Rails.logger.info "USER HAS PLAYLIST"
    end




    Rails.logger.info "user.playlists.LENGTH: #{user.playlists.length}"
    Rails.logger.info "user.playlists[0]: #{user.playlists[0]}"
    Rails.logger.info "user.playlists[1]: #{user.playlists[1]}"
    Rails.logger.info "user.playlists[2]: #{user.playlists[2]}"
    Rails.logger.info "user.playlists2: #{user.playlists}"

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
