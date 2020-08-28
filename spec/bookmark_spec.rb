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

      expect(Bookmark.all.length).to eq 0
    end
  end

  describe '.update' do
    it 'updates the given bookmark' do
      bookmark = Bookmark.create(
        title: 'Test Bookmark',
        url: 'https://www.testbookmark.com'
      )
      updated_bookmark = Bookmark.update(
        id: bookmark.id,
        url: 'http://www.testbookmarkupdated.com',
        title: 'Test Bookmark Updated'
      )

      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq 'Test Bookmark Updated'
      expect(updated_bookmark.url).to eq 'http://www.testbookmarkupdated.com'
    end
  end

  describe '.find' do
    it 'returns the requested bookmark' do
      bookmark = Bookmark.create(
        title: 'Test Bookmark',
        url: 'https://www.testbookmark.com'
      )
      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'Test Bookmark'
      expect(result.url).to eq 'https://www.testbookmark.com'
    end
  end
end