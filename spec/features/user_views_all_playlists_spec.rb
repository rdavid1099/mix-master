require 'rails_helper'

RSpec.feature "user views all playlists" do
  scenario "user can see all the playlists and click them to see their page" do
    playlist = create(:playlist)
    visit playlists_path

    expect(page).to have_link playlist.name, href: playlist_path(playlist)
  end
end
