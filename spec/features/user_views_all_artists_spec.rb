require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "they see the page of all artists and can click on a link to go to an artist's page" do
    Artist.create( name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    Artist.create( name: "Metallica", image_path: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Metallica_%282861233416%29.jpg/267px-Metallica_%282861233416%29.jpg")

    visit artists_path
    expect(page).to have_content "Bob Marley"
    expect(page).to have_content "Metallica"
    click_on "Metallica"

    expect(page).to have_content "Metallica"
    expect(page).to have_css "img[src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Metallica_%282861233416%29.jpg/267px-Metallica_%282861233416%29.jpg\"]"
  end
end
