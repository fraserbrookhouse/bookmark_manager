describe '.all' do
  it 'returns a list of bookmarks' do
    bookmarks = Bookmark.all

    expect(bookmarks).to include "https://www.twitter.com"
    expect(bookmarks).to include "https://www.destroyallsoftware.com"
    expect(bookmarks).to include "https://www.google.co.uk"
    expect(bookmarks).to include "https://www.reddit.com"
  end
end