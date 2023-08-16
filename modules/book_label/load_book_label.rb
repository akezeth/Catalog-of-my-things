require 'json'

module LoadData
  def load_data_from_file(file_name)
    file = File.read(file_name)
    JSON.parse(file)
  end

  def load_labels
    label_hash = []
    return label_hash unless File.exist?('data/label.json')

    label_hash = load_data_from_file('data/label.json')

    label_hash.each do |label|
      label_obj = Label.new(label['color'], label['title'])
      label_obj.id = label['id']
      @label << label_obj
    end
  end

  def load_books
    book_hash = []
    return book_hash unless File.exist?('data/book.json')

    book_hash = load_data_from_file('data/book.json')
    book_hash.each do |book|
      book_obj = Book.new(book['cover_state'], book['publisher'], book['publish_date'], book['id'])
      label_obj = @label.find { |label| label.title == book['label'] }
      book_obj.add_label(label_obj)
      @books << book_obj
    end
  end
end
