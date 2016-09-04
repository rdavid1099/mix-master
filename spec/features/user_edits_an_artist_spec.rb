require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario "User can edit an artist clicking on a link on the artist's page" do
    artist = Artist.create( name: "Metallica", image_path: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Metallica_%282861233416%29.jpg/267px-Metallica_%282861233416%29.jpg")

    visit artist_path(artist.id)
    click_on "Edit"
    fill_in "artist_name", with: "James Hetfield"
    click_on "Update Artist"

    expect(page).to have_content "James Hetfield"
    expect(page).to have_css "img[src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Metallica_%282861233416%29.jpg/267px-Metallica_%282861233416%29.jpg\"]"
  end
end
