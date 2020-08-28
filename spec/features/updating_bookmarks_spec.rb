feature 'Updating a bookmark' do
  scenario 'A user can update a bookmark' do
    bookmark = Bookmark.create(
      url: 'https://www.testbookmarkoriginal.com',
      title: 'Test Bookmark Original'
    )
    visit('/bookmarks')
    expect(page).to have_link(
      'Test Bookmark Original',
      href: 'https://www.testbookmarkoriginal.com'
    )

    first('.bookmark').click_button 'Edit'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in('url', with: 'https://www.testbookmarkupdate.com')
    fill_in('title', with: 'Test Bookmark Update')
    click_button('Submit')

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link(
      'Test Bookmark Original',
      href: 'https://www.testbookmarkoriginal.com'
    )
    expect(page).to have_link(
      'Test Bookmark Update',
      href: 'https://www.testbookmarkupdate.com'
    )
  end
end
