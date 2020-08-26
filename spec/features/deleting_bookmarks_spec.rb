feature 'Deleting a bookmark' do
  scenario 'A user can delete a bookmark' do
    Bookmark.create(url: 'https://www.testbookmark.com', title: 'Test Bookmark')
    visit('/bookmarks')
    expect(page).to have_link('Test Bookmark', href: 'https://www.testbookmark.com')

    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Test Bookmark', href: 'https://www.testbookmark.com')
  end
end