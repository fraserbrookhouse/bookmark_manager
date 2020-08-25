# frozen_string_literal: true

feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit ('/')
    expect(page).to have_content "Bookmark Manager"
  end

  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.twitter.com')")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.destroyallsoftware.com')")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.google.co.uk')")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.reddit.com')")

    visit ('/bookmarks')
    
    expect(page).to have_content "https://www.reddit.com"
    expect(page).to have_content "https://www.google.co.uk"
    expect(page).to have_content "https://www.twitter.com"
    expect(page).to have_content "https://www.destroyallsoftware.com"
    expect(page).not_to have_content "https://www.stackoverflow.com"
  end
end
