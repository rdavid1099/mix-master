require 'spec_helper'

RSpec.feature "user edits a song" do
  scenario "user can click edit link and change the title of the song" do
    artist = create(:artist)
    song = Song.create(title: "One Love", artist: artist)
    visit song_path(song)
    click_on "Edit"
    fill_in "song_title", with: "Stir It Up"
    click_on "Update Song"

    expect(page).to have_content "Stir It Up"
    expect(page).to_not have_content "One Love"
  end
end
