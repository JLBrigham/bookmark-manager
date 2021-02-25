require 'Bookmark'
require 'database_helpers'

describe Bookmark do

  describe '#self.all' do
    it 'returns list of bookmark instances' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers")
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.create(url: "http://www.google.com", title: "Google")
      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq(3)
      expect(bookmarks.first).to be_a Bookmark
    #  expect(bookmarks.first.id).to eq(bookmark.id)
      expect(bookmarks.first.title).to eq("Makers")
      expect(bookmarks.first.url).to eq("http://www.makersacademy.com")
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'https://rupaul.com/', title: 'Rupaul')
      expect(bookmark).to be_a Bookmark
      persisted_data = persisted_data(id: bookmark.id)
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Rupaul'
      expect(bookmark.url).to eq 'https://rupaul.com/'
    end
  end

  describe '.delete' do
    it 'deletes a bookmark from the table' do
      bookmark = Bookmark.create(url: 'https://rupaul.com/', title: 'Rupaul')
      Bookmark.delete(id: bookmark.id)
      expect(persisted_data(id: bookmark.id)).to be_nil
      expect(Bookmark.all).not_to include(bookmark)
    end

  end

end
