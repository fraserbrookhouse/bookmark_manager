# frozen_string_literal: true

feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit ('/')
    expect(page).to have_content "Bookmark Manager"
  end

  scenario 'A user can see bookmarks' do

    Bookmark.create(url: 'https://www.twitter.com', title: 'Twitter')
    Bookmark.create(url: 'https://www.destroyallsoftware.com', title: 'Destroy All Software')
    Bookmark.create(url: 'https://www.google.co.uk', title: 'Google')
    Bookmark.create(url: 'https://www.reddit.com', title: 'Reddit')

    visit ('/bookmarks')

    expect(page).to have_link('Reddit', href: 'https://www.reddit.com')
    expect(page).to have_link('Google', href: 'https://www.google.co.uk')
    expect(page).to have_link('Twitter', href: 'https://www.twitter.com')
    expect(page).to have_link('Destroy All Software', href: 'https://www.destroyallsoftware.com')
    expect(page).not_to have_link('Stackoverflow', href: 'https://www.stackoverflow.com')
  end
end
