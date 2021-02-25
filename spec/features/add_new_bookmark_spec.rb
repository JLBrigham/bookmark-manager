feature 'adding a new bookmark' do
  scenario 'it should allow me to add a new bookmark page' do
    visit('/bookmarks')
    adds_a_bookmark
    expect(page).to have_content 'The Beeb'
  end
end
