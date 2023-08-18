module BookAndLabel
  def list_all_books
    if @books.empty?
      puts 'No books availabel.'
    else
      @books.each_with_index do |book, index|
        puts "#{index + 1}) Publisher: #{book.publisher}, Publish Date: #{book.publish_date}, Label: #{book.label}"
      end
    end
  end

  def list_all_labels
    if @labels.empty?
      puts 'No labels available.'
    else
      @labels.each_with_index do |label, index|
        puts "#{index + 1}) Label Title: #{label.title}, Label Color: #{label.color}"
      end
    end
  end

  def add_book
    publish_date = get_input('Please Enter publish date in following format: yyyy/mm/dd')
    publisher = get_input('Enter Publisher')
    cover_state = get_input('Enter Cover state')
    book = Book.new(cover_state: cover_state, publisher: publisher, publish_date: publish_date)
    label = add_label
    book.label = label.title
    @books << book
    puts 'Book album Added Successfully'
  end

  def add_label
    puts 'Add a label'
    color = get_input('Enter Label Color')
    title = get_input('Enter Label title')
    label = Label.new(color: color, title: title)
    @labels << label
    label
  end

  def get_input(message)
    puts message
    gets.chomp
  end
end
