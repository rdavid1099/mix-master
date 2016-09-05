require 'rails_helper'

RSpec.feature "user can see all songs" do
  scenario "user can see all songs sorted alphabetically" do
    artist = create(:artist)
    song1 = Song.create(title: "One Love", artist: artist)
    song2 = Song.create(title: "A First Song", artist: artist)

    visit songs_path

    expect(page).to have_content song1.title
    expect(page).to have_content song2.title
    expect(page).to have_link song1.title, href: song_path(song1)
    expect(page).to have_link song2.title, href: song_path(song2)
  end
end
