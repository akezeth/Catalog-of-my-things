module BookAndLabel
  def list_all_books
    if @books.empty?
      puts 'No books availabel.'
    else
      @books.each_with_index do |book, index|
        label_title = book.label ? book.label.title : 'N/A'
        puts "#{index}) Publisher: #{book.publisher}, Publish Date: #{book.publish_date}, Label: #{label_title}"
      end
    end
  end

  def list_all_labels
    if @labels.empty?
      puts 'No labels available.'
    else
      @labels.each_with_index do |label, index|
        puts "#{index}) Label Title: #{label.title}, Label Color: #{label.color}"
      end
    end
  end

  def add_book
    publish_date = get_input('Please Enter publish date in following format: yyyy/mm/dd')
    publisher = get_input('Enter Publisher')
    cover_state = get_input('Enter Cover state')
    book = Book.new(cover_state: cover_state, publisher: publisher, publish_date: publish_date)
    @books << book
    label = add_label(book)
    book.add_label(label)
    puts 'Book album Added Successfully'
    puts 'Press Enter to continue!'
    gets.chomp
  end

  def add_label(book)
    puts 'Add a label'
    color = get_input('Enter Label Color')
    title = get_input('Enter Label title')
    label = Label.new(color: color, title: title)
    @label << label
    label
  end

  def get_input(message)
    puts message
    gets.chomp
  end
end
