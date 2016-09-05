class PlaylistsController < ApplicationController

  def index

  end

  def show
    byebug
    @playlist = Playlist.find(params[:id])
  end

  def new
    @playlist = Playlist.new
    @songs = Song.all
  end

  def create
    @playlist = Playlist.create(playlist_params)
    byebug
    redirect_to playlists_path(@playlist.id)
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name, song_ids: [])
  end
end
