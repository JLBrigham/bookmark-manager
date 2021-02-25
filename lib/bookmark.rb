require 'pg'

class Bookmark

  def self.create(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}');")
  end
  
  def self.all
    result = get_connection.exec "SELECT * FROM bookmarks"
    result.map { |row| Bookmark.new(id: row['id'], url: row['url'], title: row['title']) }
  end

  def self.delete(id:)
    get_connection.exec("DELETE FROM bookmarks WHERE id = '#{id}'")
  end

  def initialize(id:, url:, title:)
    @id = id
    @url = url
    @title = title
  end

  private

  def self.get_connection
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'bookmark_manager_test'
    else
      connection = PG.connect :dbname => 'bookmark_manager'
    end
    result = connection.exec "SELECT * FROM bookmarks"
    result.map { |row| row['title'] }
  end

end
