class Song < ActiveRecord::Base
  has_many :paylist_songs
  has_many :playlists, through: :playlist_songs
  belongs_to :artist

  validates :title, presence: true

  def in?(playlist)
    playlist.songs.exists?(id)
  end

end
