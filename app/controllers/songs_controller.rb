class SongsController < ApplicationController
  before_action :set_song,   only: [:show, :edit, :update, :destroy]
  before_action :set_artist, only: [:index, :new, :create]

  def index
    @songs = @artist.songs.order(:title)
  end

  def index_all
    @songs = Song.order(:title)
  end

  def new
    @song = @artist.songs.new
  end

  def create
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @song.destroy
    redirect_to artist_songs_path(params[:artist_id])
  end

  private

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title)
  end
end
