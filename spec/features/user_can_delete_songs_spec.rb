require 'rails_helper'

RSpec.feature "user can delete songs" do
  scenario "user can delete a song from an artist's catalogue" do
    artist = create(:artist)
    song1 = Song.create(title: "One Love", artist: artist)
    song2 = Song.create(title: "A First Song", artist: artist)

    visit artist_songs_path(artist)
    within('li:first') do
      click_on "Delete"
    end

    expect(page).to have_content song1.title
    expect(page).to_not have_content song2.title
  end
end
