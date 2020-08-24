# frozen_string_literal: true

feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit ('/')
    expect(page).to have_content "Bookmark Manager"
  end

  scenario 'A user can see bookmarks' do
    visit ('/bookmarks')
    expect(page).to have_content "https://www.google.co.uk"
    expect(page).to have_content "https://www.reddit.com"
  end
end
