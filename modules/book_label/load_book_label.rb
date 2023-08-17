require 'json'
require_relative '../../classes/book'
require_relative '../../classes/label'

module LoadBookAndLabelData
  def load_data_from_file(file_name)
    file = File.read(file_name)
    JSON.parse(file)
  end

  def load_labels
    label_hash = []
    return label_hash unless File.exist?('data/label.json')

    label_hash = load_data_from_file('data/label.json')

    label_hash.each do |label|
      label_obj = Label.new(color: label['color'], title: label['title'], id: label['id'])
      @labels << label_obj
    end
  end

  def load_books
    book_hash = []
    return book_hash unless File.exist?('data/book.json')

    book_hash = load_data_from_file('data/book.json')
    book_hash.each do |book|
      book_obj = Book.new(cover_state: book['cover_state'], publisher: book['publisher'],
                          publish_date: book['publish_date'], id: book['id'], label: book['label'])
      @books << book_obj
    end
  end
end
