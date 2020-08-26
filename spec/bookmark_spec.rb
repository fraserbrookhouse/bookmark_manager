require 'database_helpers'

describe 'Bookmark' do  
  describe '#.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # add test data
      bookmark = Bookmark.create(url: "https://www.twitter.com", title: 'Twitter')
      Bookmark.create(url: "https://www.destroyallsoftware.com", title: 'Destroy All Software')
      Bookmark.create(url: "https://www.google.co.uk", title: 'Google')
      Bookmark.create(url: "https://www.reddit.com", title: 'Reddit')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 4
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Twitter'
      expect(bookmarks.first.url).to eq 'https://www.twitter.com'
    end
  end

  describe '#.create' do
    it 'creates a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      
      persisted_data = persisted_data(id: bookmark.id)
      p persisted_data
      
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end
  end

  describe '.delete' do
    it 'deletes the given bookmark' do
      bookmark = Bookmark.create(title: 'Test Bookmark', url: 'https://www.testbookmark.com')

      Bookmark.delete(id: bookmark.id)

      expect(bookmark.all.length).to eq 0
    end
  end
end