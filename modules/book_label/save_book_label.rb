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
        label: book.label
      }
    end
    save_to_file('data/book.json', books_hash)
  end

  def save_label
    label_hash = @labels.map do |label|
      {
        id: label.id,
        color: label.color,
        title: label.title
      }
    end
    save_to_file('data/label.json', label_hash)
  end
end
