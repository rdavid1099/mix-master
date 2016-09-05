require 'rails_helper'

RSpec.feature "user can view all songs associated with artist" do
  scenario "user sees all songs after clicking view songs" do
    artist = create(:artist)
    song1 = Song.create(title: "One Love", artist: artist)
    song2 = Song.create(title: "A First Song", artist: artist)
    visit artist_path(artist)
    click_on "View songs"

    expect(page).to have_content "A First Song"
    expect(page).to have_content "One Love"
    expect(page).to have_link song1.title, href: song_path(song1)
  end
end
