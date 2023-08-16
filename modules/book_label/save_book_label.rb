require 'json'

module SaveBookAndLabelData
  def save_to_file(file_name, data)
    File.write(file_name, JSON.pretty_generate(data))
  end

  def save_book
    books_hash = @books.map do |book|
      {
        cover_state: book.cover_state,
        publisher: book.publisher,
        publish_date: book.publish_date,
        id: book.id,
        label: book.label.title
      }
    end
    save_to_file('data/book.json', books_hash)
  end
end
