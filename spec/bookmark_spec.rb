describe '#.all' do
  it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.twitter.com')")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.destroyallsoftware.com')")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.google.co.uk')")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.reddit.com')")

    bookmarks = Bookmark.all

    expect(bookmarks).to include "https://www.twitter.com"
    expect(bookmarks).to include "https://www.destroyallsoftware.com"
    expect(bookmarks).to include "https://www.google.co.uk"
    expect(bookmarks).to include "https://www.reddit.com"
  end
end