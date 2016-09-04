require 'rails_helper'

RSpec.feature "User deletes an artist" do
  scenario "User can delete an artist from that user's page" do
    bob = Artist.create( name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    metlica = Artist.create( name: "Metallica", image_path: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Metallica_%282861233416%29.jpg/267px-Metallica_%282861233416%29.jpg")

    visit artists_path
    expect(page).to have_content "Bob Marley"
    expect(page).to have_content "Metallica"
    visit artist_path(metlica.id)
    click_on "Delete"

    expect(page).to have_content "All Artists"
    expect(page).to have_content "Bob Marley"
    expect(page).to_not have_content "Metallica"
  end
end

# As a user
# Given that an artist exists in the database
# When I visit that artist's show page
# And I click on "Delete"
# Then I should be back on the artist index page
# Then I should not see the artist's name
