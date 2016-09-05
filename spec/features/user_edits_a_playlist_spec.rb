require 'rails_helper'

RSpec.feature "user edits a playlist" do
  scenario "they can change the playlist name, add songs and remove songs" do
    song_one, song_two, song_three = create_list(:song, 3)
    playlist = Playlist.create(name: "test", song_ids: [song_one.id, song_two.id])

    visit playlist_path(playlist)
    click_on "Edit"
    fill_in "playlist_name", with: "New Name"
    uncheck("song-#{song_one.id}")
    check("song-#{song_three.id}")
    click_on "Update Playlist"

    expect(page).to have_content "NEW NAME"
    expect(page).to have_content song_two.title
    expect(page).to have_content song_three.title
    expect(page).to_not have_content song_one.title
  end
end
