feature 'deleting bookmarks' do
  scenario 'when user has entered a bookmark and then decided to delete it' do
    visit('/bookmarks')
    adds_a_bookmark
    click_button('Delete')
    expect(page).not_to have_content 'The Beeb'
  end
end
