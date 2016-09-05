class Song < ActiveRecord::Base
  has_many :paylist_songs
  has_many :playlists, through: :playlist_songs
  belongs_to :artist

  validates :title, presence: true
end
